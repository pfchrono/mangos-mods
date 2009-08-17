/*
 * Copyright (C) 2008 - 2009 Trinity <http://www.trinitycore.org/>
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

#include "precompiled.h"
#include "def_ulduar.h"

#define SPELL_PYROBLAST         64698
#define SPELL_BATTERING_RAM     62376
#define SPELL_BLAST_WAVE        38536


enum Events
{
    EVENT_PYROBLAST,
    EVENT_BATTERING_RAM,
	EVENT_BLAST_WAVE,
};

struct TRINITY_DLL_DECL boss_flame_leviathanAI : public BossAI
{
    boss_flame_leviathanAI(Creature *c) : BossAI(c, BOSS_RAZORSCALE) {}

    void EnterCombat(Unit *who)
    {
        _EnterCombat();
        events.ScheduleEvent(EVENT_PYROBLAST, 15000); // Might need removal
        events.ScheduleEvent(EVENT_BATTERING_RAM, 30000);
        events.ScheduleEvent(EVENT_BLAST_WAVE, 20000); 
    }

    void UpdateAI(const uint32 diff)
    {
        if(!UpdateVictim())
            return;

        events.Update(diff);

        if(me->hasUnitState(UNIT_STAT_CASTING))
            return;

        if(uint32 eventId = events.GetEvent())
        {
            switch(eventId)
            {
                case EVENT_PYROBLAST:
					if(Unit *target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0, true))
						DoCastAOE(SPELL_PYROBLAST);
                    events.RepeatEvent(15000);
                    return;
                case EVENT_BATTERING_RAM:
                    DoCast(me->getVictim(), SPELL_BATTERING_RAM);
                    events.RepeatEvent(30000);
                    return;
                case EVENT_BLAST_WAVE:
                    DoCastAOE(SPELL_BLAST_WAVE);
                    events.RepeatEvent(20000);
                    return;
                default:
                    events.PopEvent();
                    break;
            }
        }

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_flame_leviathan(Creature *_Creature)
{
    return new boss_flame_leviathanAI (_Creature);
}

void AddSC_boss_flame_leviathan()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name="boss_flame_leviathan";
    newscript->GetAI = &GetAI_boss_flame_leviathan;
    newscript->RegisterSelf();
}
