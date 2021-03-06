/* Copyright (C) 2006 - 2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
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

/* ScriptData
SDName: Areatrigger_Scripts
SD%Complete: 100
SDComment: Scripts for areatriggers
SDCategory: Areatrigger
EndScriptData */

/* ContentData
at_legion_teleporter    4560 Teleporter TO Invasion Point: Cataclysm
EndContentData */

#include "precompiled.h"

/*#####
## at_legion_teleporter
#####*/

enum
{
    SPELL_TELE_A_TO         = 37387,
    QUEST_GAINING_ACCESS_A  = 10589,

    SPELL_TELE_H_TO         = 37389,
    QUEST_GAINING_ACCESS_H  = 10604
};

bool AreaTrigger_at_legion_teleporter(Player* pPlayer, AreaTriggerEntry* pAt)
{
    if (pPlayer->isAlive() && !pPlayer->isInCombat())
    {
        if (pPlayer->GetTeam()== ALLIANCE && pPlayer->GetQuestRewardStatus(QUEST_GAINING_ACCESS_A))
        {
            pPlayer->CastSpell(pPlayer,SPELL_TELE_A_TO,false);
            return true;
        }

        if (pPlayer->GetTeam()== HORDE && pPlayer->GetQuestRewardStatus(QUEST_GAINING_ACCESS_H))
        {
            pPlayer->CastSpell(pPlayer,SPELL_TELE_H_TO,false);
            return true;
        }

        return false;
    }
    return false;
}

enum
{
    QUEST_MANOR_RAVENHOLDT  = 6681,
    NPC_RAVENHOLDT          = 13936
};

bool AreaTrigger_at_ravenholdt(Player* pPlayer, AreaTriggerEntry* pAt)
{
    if (pPlayer->GetQuestStatus(QUEST_MANOR_RAVENHOLDT) == QUEST_STATUS_INCOMPLETE)
        pPlayer->KilledMonsterCredit(NPC_RAVENHOLDT, 0);

    return false;
}

void AddSC_areatrigger_scripts()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "at_legion_teleporter";
    newscript->pAreaTrigger = &AreaTrigger_at_legion_teleporter;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "at_ravenholdt";
    newscript->pAreaTrigger = &AreaTrigger_at_ravenholdt;
    newscript->RegisterSelf();
}

