/*
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
 *
 * Copyright (C) 2008-2009 Trinity <http://www.trinitycore.org/>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 */

#include "PetAI.h"
#include "Errors.h"
#include "Pet.h"
#include "Player.h"
#include "DBCStores.h"
#include "Spell.h"
#include "ObjectAccessor.h"
#include "SpellMgr.h"
#include "Creature.h"
#include "World.h"
#include "Util.h"

int PetAI::Permissible(const Creature *creature)
{
    if( creature->isPet())
        return PERMIT_BASE_SPECIAL;

    return PERMIT_BASE_NO;
}

PetAI::PetAI(Creature *c) : CreatureAI(c), i_tracker(TIME_INTERVAL_LOOK)
{
    m_AllySet.clear();
    UpdateAllies();
}

void PetAI::EnterEvadeMode()
{
}

bool PetAI::_needToStop() const
{
    // This is needed for charmed creatures, as once their target was reset other effects can trigger threat
    if(m_creature->isCharmed() && m_creature->getVictim() == m_creature->GetCharmer())
        return true;

    return !m_creature->canAttack(m_creature->getVictim());
}

void PetAI::_stopAttack()
{
    if( !m_creature->isAlive() )
    {
        DEBUG_LOG("Creature stoped attacking cuz his dead [guid=%u]", m_creature->GetGUIDLow());
        m_creature->GetMotionMaster()->Clear();
        m_creature->GetMotionMaster()->MoveIdle();
        m_creature->CombatStop();
        m_creature->getHostilRefManager().deleteReferences();

        return;
    }

    Unit* owner = m_creature->GetCharmerOrOwner();

    if(owner && m_creature->GetCharmInfo() && m_creature->GetCharmInfo()->HasCommandState(COMMAND_FOLLOW))
    {
        m_creature->GetMotionMaster()->MoveFollow(owner,PET_FOLLOW_DIST, m_creature->GetFollowAngle());
    }
    else
    {
        m_creature->clearUnitState(UNIT_STAT_FOLLOW);
        m_creature->GetMotionMaster()->Clear();
        m_creature->GetMotionMaster()->MoveIdle();
    }
    m_creature->AttackStop();
}

void PetAI::UpdateAI(const uint32 diff)
{
    Unit* owner = m_creature->GetCharmerOrOwner();

    if(m_updateAlliesTimer <= diff)
        // UpdateAllies self set update timer
        UpdateAllies();
    else
        m_updateAlliesTimer -= diff;

    // m_creature->getVictim() can't be used for check in case stop fighting, m_creature->getVictim() clear at Unit death etc.
    if( m_creature->getVictim() )
    {
        if( _needToStop() )
        {
            DEBUG_LOG("Pet AI stoped attacking [guid=%u]", m_creature->GetGUIDLow());
            _stopAttack();
            return;
        }

        DoMeleeAttackIfReady();
    }
    else if(owner && m_creature->GetCharmInfo()) //no victim
    {
        if(owner->isInCombat() && !(m_creature->HasReactState(REACT_PASSIVE) || m_creature->GetCharmInfo()->HasCommandState(COMMAND_STAY)))
            AttackStart(owner->getAttackerForHelper());
        else if(m_creature->GetCharmInfo()->HasCommandState(COMMAND_FOLLOW) && !m_creature->hasUnitState(UNIT_STAT_FOLLOW))
            m_creature->GetMotionMaster()->MoveFollow(owner,PET_FOLLOW_DIST, m_creature->GetFollowAngle());
    }
    else if (owner && !m_creature->hasUnitState(UNIT_STAT_FOLLOW)) // no charm info and no victim
        m_creature->GetMotionMaster()->MoveFollow(owner,PET_FOLLOW_DIST, m_creature->GetFollowAngle());

    if(!me->GetCharmInfo())
        return;

    bool inCombat = me->getVictim();

    // Autocast (casted only in combat or persistent spells in any state)
    if (m_creature->GetGlobalCooldown() == 0 && !m_creature->hasUnitState(UNIT_STAT_CASTING))
    {
        typedef std::vector<std::pair<Unit*, Spell*> > TargetSpellList;
        TargetSpellList targetSpellStore;

        for (uint8 i = 0; i < m_creature->GetPetAutoSpellSize(); ++i)
        {
            uint32 spellID = m_creature->GetPetAutoSpellOnPos(i);
            if (!spellID)
                continue;

            SpellEntry const *spellInfo = sSpellStore.LookupEntry(spellID);
            if (!spellInfo)
                continue;

            // ignore some combinations of combat state and combat/noncombat spells
            if (!inCombat)
            {
                // ignore attacking spells, and allow only self/around spells
                if (!IsPositiveSpell(spellInfo->Id))
                    continue;

                // non combat spells allowed
                // only pet spells have IsNonCombatSpell and not fit this reqs:
                // Consume Shadows, Lesser Invisibility, so ignore checks for its
                if (!IsNonCombatSpell(spellInfo))
                {
                    // allow only spell without spell cost or with spell cost but not duration limit
                    int32 duration = GetSpellDuration(spellInfo);
                    if ((spellInfo->manaCost || spellInfo->ManaCostPercentage || spellInfo->manaPerSecond) && duration > 0)
                        continue;

                    // allow only spell without cooldown > duration
                    int32 cooldown = GetSpellRecoveryTime(spellInfo);
                    if (cooldown >= 0 && duration >= 0 && cooldown > duration)
                        continue;
                }
            }
            else
            {
                // just ignore non-combat spells
                if (IsNonCombatSpell(spellInfo))
                    continue;
            }

            Spell *spell = new Spell(m_creature, spellInfo, false, 0);

            if (inCombat && !m_creature->hasUnitState(UNIT_STAT_FOLLOW) && spell->CanAutoCast(m_creature->getVictim()))
            {
                targetSpellStore.push_back(std::make_pair<Unit*, Spell*>(m_creature->getVictim(), spell));
                continue;
            }
            else
            {
                bool spellUsed = false;
                for(std::set<uint64>::const_iterator tar = m_AllySet.begin(); tar != m_AllySet.end(); ++tar)
                {
                    Unit* Target = ObjectAccessor::GetUnit(*m_creature,*tar);

                    //only buff targets that are in combat, unless the spell can only be cast while out of combat
                    if(!Target)
                        continue;

                    if(spell->CanAutoCast(Target))
                    {
                        targetSpellStore.push_back(std::make_pair<Unit*, Spell*>(Target, spell));
                        spellUsed = true;
                        break;
                    }
                }
                if (!spellUsed)
                    delete spell;
            }
        }

        //found units to cast on to
        if (!targetSpellStore.empty())
        {
            uint32 index = urand(0, targetSpellStore.size() - 1);

            Spell* spell  = targetSpellStore[index].second;
            Unit*  target = targetSpellStore[index].first;

            targetSpellStore.erase(targetSpellStore.begin() + index);

            SpellCastTargets targets;
            targets.setUnitTarget( target );

            if( !m_creature->HasInArc(M_PI, target) )
            {
                m_creature->SetInFront(target);
                if( target->GetTypeId() == TYPEID_PLAYER )
                    m_creature->SendUpdateToPlayer( (Player*)target );

                if(owner && owner->GetTypeId() == TYPEID_PLAYER)
                    m_creature->SendUpdateToPlayer( (Player*)owner );
            }

            m_creature->AddCreatureSpellCooldown(spell->m_spellInfo->Id);

            spell->prepare(&targets);
        }

        // deleted cached Spell objects
        for(TargetSpellList::const_iterator itr = targetSpellStore.begin(); itr != targetSpellStore.end(); ++itr)
            delete itr->second;
    }
}

void PetAI::UpdateAllies()
{
    Unit* owner = m_creature->GetCharmerOrOwner();
    Group *pGroup = NULL;

    m_updateAlliesTimer = 10*IN_MILISECONDS;                //update friendly targets every 10 seconds, lesser checks increase performance

    if(!owner)
        return;
    else if(owner->GetTypeId() == TYPEID_PLAYER)
        pGroup = ((Player*)owner)->GetGroup();

    //only pet and owner/not in group->ok
    if(m_AllySet.size() == 2 && !pGroup)
        return;
    //owner is in group; group members filled in already (no raid -> subgroupcount = whole count)
    if(pGroup && !pGroup->isRaidGroup() && m_AllySet.size() == (pGroup->GetMembersCount() + 2))
        return;

    m_AllySet.clear();
    m_AllySet.insert(m_creature->GetGUID());
    if(pGroup)                                              //add group
    {
        for(GroupReference *itr = pGroup->GetFirstMember(); itr != NULL; itr = itr->next())
        {
            Player* Target = itr->getSource();
            if(!Target || !pGroup->SameSubGroup((Player*)owner, Target))
                continue;

            if(Target->GetGUID() == owner->GetGUID())
                continue;

            m_AllySet.insert(Target->GetGUID());
        }
    }
    else                                                    //remove group
        m_AllySet.insert(owner->GetGUID());
}
