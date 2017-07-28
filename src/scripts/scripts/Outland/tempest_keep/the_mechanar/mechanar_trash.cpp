/* 
 * Copyright (C) 2006-2008 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
 * Copyright (C) 2008-2014 Hellground <http://hellground.net/>
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

/* ScriptData
SDName: mechanar_trash
SD%Complete: 100
SDComment:
SDCategory: Mechanar
EndScriptData */

#include "precompiled.h"
#include "def_mechanar.h"

/*######
## mob_sunseeker_netherbinder
######*/

enum NetherbinderSpells
{
    SPELL_DISPEL_MAGIC                    =   17201,
    SPELL_SUMMON_ARCANE_SERVANT_NORMAL    =   35251,
    SPELL_SUMMON_ARCANE_SERVANT_HEROIC    =   35260,
    SPELL_ARCANE_NOVA_NORMAL              =   35261,
    SPELL_ARCANE_NOVA_HEROIC              =   38936
};

struct mob_sunseeker_netherbinderAI : public ScriptedAI
{
    mob_sunseeker_netherbinderAI(Creature* creature) : ScriptedAI(creature) 
    {
        HeroicMode = m_creature->GetMap()->IsHeroic();
    }

    uint32 ArcaneNovaTimer;
    uint32 DispelMagicTimer;
    uint32 ArcaneServantTimer;

    bool HeroicMode;
    bool Summoned;

    void Reset()
    {
        ArcaneNovaTimer       = 6000;
        DispelMagicTimer      = 8000;
        ArcaneServantTimer    = 10000;
        Summoned = false;
    }

    void UpdateAI(const uint32 diff)
    {
        if (!UpdateVictim())
            return;

        if (ArcaneNovaTimer <= diff)
        {
            DoCast(me->getVictim(), HeroicMode ? SPELL_ARCANE_NOVA_HEROIC : SPELL_ARCANE_NOVA_NORMAL);
            ArcaneNovaTimer =  urand(11000, 13000);
        }
        else ArcaneNovaTimer -= diff;

        if (DispelMagicTimer <= diff)
        {
            DoCast(me->getVictim(), SPELL_DISPEL_MAGIC);
            DispelMagicTimer = urand(12000, 17000);
        }
        else DispelMagicTimer -= diff;

        if (HealthBelowPct(80.0f) && !Summoned)
        {
            for (uint8 i = 0; i <= 1; ++i)
            {
                ForceSpellCast(me->getVictim(), HeroicMode ? SPELL_SUMMON_ARCANE_SERVANT_HEROIC : SPELL_SUMMON_ARCANE_SERVANT_NORMAL, INTERRUPT_AND_CAST_INSTANTLY);
                Summoned = true;
            }
        }

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_mob_sunseeker_netherbinder(Creature* creature)
{
    return new mob_sunseeker_netherbinderAI(creature);
}

/*######
## mob_arcane_servant
######*/

#define AURA_ARCANE_EXPLOSION_PROC_NORMAL    35187
#define AURA_ARCANE_EXPLOSION_PROC_HEROIC    35191

struct mob_arcane_servantAI : public ScriptedAI
{
    mob_arcane_servantAI(Creature* creature) : ScriptedAI(creature) 
    {
        HeroicMode = m_creature->GetMap()->IsHeroic();
        creature->setActive(true);
    }

    bool HeroicMode;

    void Reset() { m_creature->AddAura(HeroicMode ? AURA_ARCANE_EXPLOSION_PROC_HEROIC : AURA_ARCANE_EXPLOSION_PROC_NORMAL, m_creature); }

    void UpdateAI(const uint32 diff)
    {
        if (!UpdateVictim())
            return;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_mob_arcane_servant(Creature* creature)
{
    return new mob_arcane_servantAI(creature);
}

void AddSC_mechanar_trash()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name = "mob_sunseeker_netherbinder";
    newscript->GetAI = &GetAI_mob_sunseeker_netherbinder;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_arcane_servant";
    newscript->GetAI = &GetAI_mob_arcane_servant;
    newscript->RegisterSelf();
}
