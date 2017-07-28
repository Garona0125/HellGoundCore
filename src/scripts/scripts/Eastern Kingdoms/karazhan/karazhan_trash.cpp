/* 
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

#include "precompiled.h"
#include "def_karazhan.h"

/*######
## mob_phantom_guest
######*/

#define SPELL_DANCE_VIBE            29521
#define SPELL_SEARING_PAIN          29492
#define SPELL_IMMOLATE              29928
#define SPELL_THROW                 29582
#define SPELL_IMPALE                29583
#define SPELL_GOBLIN_DRAGON_GUN     29513
#define SPELL_THROW_DYNAMITE        29579
#define SPELL_PUNCH                 29581
#define SPELL_CURSE_OF_AGONY        29930
#define SPELL_HEAL                  29580
#define SPELL_HOLY_NOVA             29514

#define PHANTOM_OOC_TEXT_NO_DANCE_1 "And so then he says \"I was talking to the chicken!"
#define PHANTOM_OOC_TEXT_NO_DANCE_2 "I'm positively stuffed; I can't eat another bite! Well, perhaps just one more..."
#define PHANTOM_OOC_TEXT_NO_DANCE_3 "That joke kills me!"
#define PHANTOM_OOC_TEXT_NO_DANCE_4 "Every dish is more delicious than the last!"
#define PHANTOM_OOC_TEXT_NO_DANCE_5 "Ahh, life is good."
#define PHANTOM_OOC_TEXT_NO_DANCE_6 "I've never been so happy! I wish this night would never end!"
#define PHANTOM_OOC_TEXT_NO_DANCE_7 "A feast fit for royalty!"
#define PHANTOM_OOC_TEXT_NO_DANCE_8 "Another meal, another triumph!"
#define PHANTOM_OOC_TEXT_NO_DANCE_9 "That joke... I swear I laugh every time!"
#define PHANTOM_OOC_TEXT_NO_DANCE_10 "Where did I live before this? I used to know. At least I thought I did..."

#define PHANTOM_OOC_TEXT_DANCE_1 "This all seems so strange."
#define PHANTOM_OOC_TEXT_DANCE_2 "I feel as though there's a task I have yet to complete...."
#define PHANTOM_OOC_TEXT_DANCE_3 "This music never gets old, does it?"
#define PHANTOM_OOC_TEXT_DANCE_4 "Perhaps just one more dance. Then I really must be leaving! I have to get back too... to..."
#define PHANTOM_OOC_TEXT_DANCE_5 "It's so strange: I can't remember how I came to be here."

#define PHANTOM_AGGRO_TEXT_1 "Leave us alone! Let us be!"
#define PHANTOM_AGGRO_TEXT_2 "How dare you interfere?!"
#define PHANTOM_DEATH_TEXT_1 "It's not my time, not yet!"

const int chairID[] =
{
    183585,
    183586,
    183587,
    183588,
    183589,
    183590,
    183591,
    183592,
    183593,
    183594,
    183595,
    183596,
    183597,
    183598,
    183599,
    183600,
    183601,
    183602,
    183603,
    183605,
    183606,
    183607,
    183608,
    183609,
    183610,
    183611,
    183612,
    183613,
    183614,
    183615,
    183616,
    183617,
    183773,
    183774,
    183775,
    183776,
    183777,
    183778,
    183779,
    183780
};
struct mob_phantom_guestAI : public ScriptedAI
{
    mob_phantom_guestAI(Creature* c) : ScriptedAI(c) 
    {
        Type = urand(0, 4);   
    }

    uint32 Type;
    uint32 MainTimer;
    uint32 SecondaryTimer;
    uint32 TalkTimer;

    bool TryToFoundChair;

    void MoveInLineOfSight(Unit* who) 
    {
        if (who->GetTypeId() == TYPEID_PLAYER)
        {
            if (!TryToFoundChair)
            {
                TryToFoundChair = true;

                for (int i = 0; i < 40 ; i++)
                { 
                    if (GameObject* chair = FindGameObject(chairID[i], 5.0, me))
                        if (chair->IsInRange2d(me->GetPositionX(), me->GetPositionY(), 0, 0.1))
                            chair->Use(me);
                }
            }
        }

        ScriptedAI::MoveInLineOfSight(who);
    }

    void Reset()
    {
        if (me->GetUInt32Value(UNIT_NPC_EMOTESTATE))
            me->CastSpell(me, SPELL_DANCE_VIBE, true);

        MainTimer = 0;
        SecondaryTimer = urand(5000, 20000);
        TalkTimer = urand(5000, 20000);

        TryToFoundChair = false;
    }

    void AttackStart(Unit *who)
    {
        if(Type == 0 || Type == 1)
            ScriptedAI::AttackStartNoMove(who, Type == 0 ? CHECK_TYPE_CASTER : CHECK_TYPE_SHOOTER);
        else
            ScriptedAI::AttackStart(who);
    }

    void EnterCombat(Unit *who)
    {
        if(roll_chance_i(5))
            me->Say(RAND<const char*>(PHANTOM_AGGRO_TEXT_1, PHANTOM_AGGRO_TEXT_2), 0, 0);
    }

    void JustDied(Unit *)
    {
        if(roll_chance_i(5))
            me->Say(PHANTOM_DEATH_TEXT_1, 0, 0);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!me->isInCombat())
        {
            if (TalkTimer <= diff)
            {
                if (!me->GetUInt32Value(UNIT_NPC_EMOTESTATE))
                {
                    if (roll_chance_i(3))
                        me->Say(RAND<const char*>(PHANTOM_OOC_TEXT_NO_DANCE_1, PHANTOM_OOC_TEXT_NO_DANCE_2, PHANTOM_OOC_TEXT_NO_DANCE_3, PHANTOM_OOC_TEXT_NO_DANCE_4, PHANTOM_OOC_TEXT_NO_DANCE_5, 
                        PHANTOM_OOC_TEXT_NO_DANCE_6, PHANTOM_OOC_TEXT_NO_DANCE_7, PHANTOM_OOC_TEXT_NO_DANCE_8 , PHANTOM_OOC_TEXT_NO_DANCE_9, PHANTOM_OOC_TEXT_NO_DANCE_10), 0, 0);
                }
                else if (me->GetUInt32Value(UNIT_NPC_EMOTESTATE))
                    if (roll_chance_i(3))
                        me->Say(RAND<const char*>(PHANTOM_OOC_TEXT_DANCE_1, PHANTOM_OOC_TEXT_DANCE_2, PHANTOM_OOC_TEXT_DANCE_3, PHANTOM_OOC_TEXT_DANCE_4, PHANTOM_OOC_TEXT_DANCE_5), 0, 0);

                TalkTimer = urand(40000, 120000);
            }
            else 
                TalkTimer -= diff;
        }

        if(!UpdateVictim())
            return;

        // Spectral Guests continue to dance while attacking you. - Disable dance emote in combat
        if (me->isInCombat())
            me->SetUInt32Value(UNIT_NPC_EMOTESTATE, 0);

        if(MainTimer < diff)
        {
            switch(Type)
            {
            case 0:
                AddSpellToCast(SPELL_SEARING_PAIN, CAST_TANK);
                MainTimer = 3500;
                break;
            case 1:
                AddSpellToCast(SPELL_THROW, CAST_TANK);
                MainTimer = 2000;
                break;
            case 2:
                AddSpellToCast(SPELL_GOBLIN_DRAGON_GUN, CAST_SELF);
                MainTimer = 20000;
                break;
            case 3:
                AddSpellToCast(SPELL_PUNCH, CAST_TANK);
                MainTimer = urand(10000, 30000);
                break;
            case 4:
                AddSpellToCast(SPELL_HEAL, CAST_LOWEST_HP_FRIENDLY);
                MainTimer = urand(5000, 20000);
                break;
            }
        } 
        else
            MainTimer -= diff;

        if(SecondaryTimer < diff)
        {
            switch(Type)
            {
            case 0:
                AddSpellToCast(SPELL_IMMOLATE, CAST_RANDOM);
                SecondaryTimer = urand(7000, 30000);
                break;
            case 1:
                AddSpellToCast(SPELL_IMPALE, CAST_RANDOM);
                SecondaryTimer = urand(5000, 30000);
                break;
            case 2:
                AddSpellToCast(SPELL_THROW_DYNAMITE, CAST_RANDOM);
                SecondaryTimer = urand(15000, 40000);
                break;
            case 3:
                AddSpellToCast(SPELL_CURSE_OF_AGONY, CAST_RANDOM);
                SecondaryTimer = urand(10000, 30000);
                break;
            case 4:
                AddSpellToCast(SPELL_HOLY_NOVA, CAST_SELF);
                SecondaryTimer = urand(10000, 30000);
                break;
            }
        }
        else
            SecondaryTimer -= diff;

        if(Type == 0)
            CheckCasterNoMovementInRange(diff, 30.0);
        else if(Type == 1)
            CheckShooterNoMovementInRange(diff, 30.0);
        CastNextSpellIfAnyAndReady(diff);
        DoMeleeAttackIfReady();
    }    
};

CreatureAI* GetAI_mob_phantom_guest(Creature *_Creature)
{
    return new mob_phantom_guestAI(_Creature);
}

/*######
## mob_skeletal_waiter
######*/

#define PHANTOM_TEXT_TO_WAITER_1 "Waiter, more wine!"
#define PHANTOM_TEXT_TO_WAITER_2 "Waiter, another ale!"
#define PHANTOM_TEXT_TO_WAITER_3 "Waiter, where is my hasenpfeffer?"
#define PHANTOM_TEXT_TO_WAITER_4 "Waiter, another bottle, and be quick!"
#define PHANTOM_TEXT_TO_WAITER_5 "Another drink!" // No support

#define WAITER_TEXT_1 "Gladly."
#define WAITER_TEXT_2 "Of course, sir."
#define WAITER_TEXT_3 "No sooner said than done, sir."
#define WAITER_TEXT_4 "I'll check on that right away!"
#define WAITER_TEXT_5 "Right away!" // No support

#define SPELL_BRITTLE_BONES    32441
#define PHANTOM_GUEST          16409

struct mob_skeletal_waiterAI : public ScriptedAI
{
    mob_skeletal_waiterAI(Creature* creature) : ScriptedAI(creature) {}

    uint32 BrittleBonesTimer;
    uint32 TalkTimer;
    uint32 MoveTimer;

    void Reset()
    {
        BrittleBonesTimer = 15000;
        TalkTimer = urand(5000, 20000);
    }

    void UpdateAI(const uint32 diff)
    {
        if (!me->isInCombat())
        {
            if (TalkTimer <= diff)
            {
                if (Creature *guest = GetClosestCreatureWithEntry(me, PHANTOM_GUEST, 2.0, true))
                {
                    if (roll_chance_i(20))
                    {
                        guest->Say(RAND<const char*>(PHANTOM_TEXT_TO_WAITER_1, PHANTOM_TEXT_TO_WAITER_2, PHANTOM_TEXT_TO_WAITER_3, PHANTOM_TEXT_TO_WAITER_4), 0, 0);
                        me->Say(RAND<const char*>(WAITER_TEXT_1, WAITER_TEXT_2, WAITER_TEXT_3, WAITER_TEXT_4), 0, 0);
                    }
                }
                TalkTimer = urand(40000, 120000);
            }
            else 
                TalkTimer -= diff;
        }

        if (!UpdateVictim())
            return;

        if (BrittleBonesTimer <= diff)
        {
            if (roll_chance_i(40))
                DoCast(me->getVictim(), SPELL_BRITTLE_BONES);

            BrittleBonesTimer = urand(120000, 120000);
        }
        else BrittleBonesTimer -= diff;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_mob_skeletal_waiter(Creature* creature)
{
    return new mob_skeletal_waiterAI(creature);
}

/*######
## mob_spectral_sentry
######*/

#define SPELL_DUAL_WIELD    674
#define SPELL_SHOT          29575
#define SPELL_MULTI_SHOT    29576

#define SENTRY_SAY_AGGRO1   "What is this?"
#define SENTRY_SAY_AGGRO2   "Stop them!"
#define SENTRY_SAY_AGGRO3   "Invaders in the tower!"
#define SENTRY_SAY_DEATH1   "I have failed..." 
#define SENTRY_SAY_RANDOM   "It's great assigment, yeah, but \"all looking and no touching\" gets old after a while."

struct mob_spectral_sentryAI : public ScriptedAI
{
    mob_spectral_sentryAI(Creature* c) : ScriptedAI(c) {}

    uint32 ShotTimer;
    uint32 MultiShotTimer;
    uint32 RandomSayTimer;

    void Reset()
    {
        me->CastSpell(me, SPELL_DUAL_WIELD, true);

        ShotTimer = 0;
        MultiShotTimer = 8000;
        RandomSayTimer = urand(40000, 80000);
    }
    
    void EnterCombat(Unit *who)
    {
        if(roll_chance_i(70))
            me->Say(RAND<const char*>(SENTRY_SAY_AGGRO1, SENTRY_SAY_AGGRO2, SENTRY_SAY_AGGRO3), 0, 0);
    }

    void AttackStart(Unit *who)
    {
        ScriptedAI::AttackStartNoMove(who, CHECK_TYPE_SHOOTER);
    }

    void JustDied(Unit *)
    {
        if(roll_chance_i(30))
            me->Say(SENTRY_SAY_DEATH1, 0, 0);
    }

    void UpdateAI(const uint32 diff)
    {
        if(!UpdateVictim())
        {
            if (RandomSayTimer < diff)
            {
                if(roll_chance_i(30))
                    me->Say(SENTRY_SAY_RANDOM, 0, 0);
                RandomSayTimer = urand(40000, 80000);
            }
            else 
                RandomSayTimer -= diff;
            return;
        }

        if(ShotTimer < diff)
        {
            AddSpellToCast(SPELL_SHOT, CAST_TANK);
            ShotTimer = 2000;
        } 
        else
            ShotTimer -= diff;

        if(MultiShotTimer < diff)
        {
            AddSpellToCast(SPELL_MULTI_SHOT, CAST_RANDOM);
            MultiShotTimer = 8000;
        }
        else
            MultiShotTimer -= diff;

        CheckShooterNoMovementInRange(diff, 20.0);
        CastNextSpellIfAnyAndReady(diff);
        DoMeleeAttackIfReady();
    }    
};

CreatureAI* GetAI_mob_spectral_sentry(Creature *_Creature)
{
    return new mob_spectral_sentryAI(_Creature);
}

/*######
## mob_arcane_protector
######*/

#define SPELL_RETURN_FIRE1  29793
#define SPELL_RETURN_FIRE2  29794
#define SPELL_RETURN_FIRE3  29788
#define SPELL_FIST_OF_STONE 29840
#define SPELL_DETONATE      29876
#define SPELL_SEAR          29864
#define NPC_ASTRAL_SPARK    17283


struct mob_arcane_protectorAI : public ScriptedAI
{
    mob_arcane_protectorAI(Creature* c) : ScriptedAI(c) {}

    uint32 SkillTimer;

    void Reset()
    {
        SkillTimer = urand(10000, 20000);
    }
    
    void EnterCombat(Unit *who)
    {
        if (who->GetTypeId() == TYPEID_PLAYER)
            me->CastSpell(me, RAND(SPELL_RETURN_FIRE1, SPELL_RETURN_FIRE2, SPELL_RETURN_FIRE3), false); 
    }

    void JustSummoned(Creature *c)
    {
        if (c->GetEntry() == NPC_ASTRAL_SPARK)
        {
            c->CastSpell(me, SPELL_DETONATE, true);
            c->CastSpell(me, SPELL_SEAR, true);
        }
    }

    void OnAuraApply(Aura *aur, Unit*, bool stack)
    {
        if(aur->GetEffIndex() == 0)
        {
            switch(aur->GetId())
            {
            case SPELL_RETURN_FIRE1:
                me->Say("Activating defence mode EL-2S.", 0, 0);
                break;
            case SPELL_RETURN_FIRE2:
                me->Say("Activating defence mode EL-5R.", 0, 0);
                break;
            case SPELL_RETURN_FIRE3:
                me->Say("Activating defence mode EL-7M.", 0, 0);
                break;
            }
        }
    }

    void JustDied(Unit *)
    {
        if(roll_chance_i(30))
            me->Say(RAND<const char*>("You will not make it out alive!",
                                      "This... changes nothing. Eternal damnation awaits you!",
                                      "Others will take my place"), 0, 0);
    }

    void UpdateAI(const uint32 diff)
    {
        if(!UpdateVictim())
            return;

        if(SkillTimer < diff)
        {
            if(roll_chance_i(50))
                me->SummonCreature(NPC_ASTRAL_SPARK, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), me->GetOrientation(),
                        TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 10000);
            else
                me->CastSpell(me, SPELL_FIST_OF_STONE, false);
            SkillTimer = urand(15000, 30000);
        }
        else
            SkillTimer -= diff;

        CastNextSpellIfAnyAndReady(diff);
        DoMeleeAttackIfReady();
    }    
};

CreatureAI* GetAI_mob_arcane_protector(Creature *_Creature)
{
    return new mob_arcane_protectorAI(_Creature);
}

/*######
## mob_mana_warp
######*/

#define SPELL_WARP_BREACH_AOE       29919
#define SPELL_WARP_BREACH_VISUAL    37079

struct mob_mana_warpAI : public ScriptedAI
{
    mob_mana_warpAI(Creature* c) : ScriptedAI(c) {}

    bool Exploded;

    void Reset()
    {
        Exploded = false;
    }
    
    void DamageTaken(Unit* pDone_by, uint32& uiDamage)
    {
        if(me->IsNonMeleeSpellCast(true) && uiDamage > me->GetHealth())
            uiDamage = me->GetHealth() - 1;
    }

    void UpdateAI(const uint32 diff)
    {
        if(!UpdateVictim())
            return;

        if(!Exploded && HealthBelowPct(10))
        {
            me->CastSpell(me, SPELL_WARP_BREACH_AOE, false);
            me->CastSpell(me, SPELL_WARP_BREACH_VISUAL, true);
            Exploded = true;
        }

        DoMeleeAttackIfReady();
    }    
};

CreatureAI* GetAI_mob_mana_warp(Creature *_Creature)
{
    return new mob_mana_warpAI(_Creature);
}

bool Spell_charge(const Aura* aura, bool apply)
{
    if(!apply)
    {
        if(Unit* caster = aura->GetCaster())
            caster->CastSpell(aura->GetTarget(), 29321, true);      // trigger fear after charge
    }
    return true;
}

#define SPELL_SEARING_PAIN      29492
#define SPELL_IMMOLATE          29928
#define SPELL_CURSE_OF_AGONY    29930

struct mob_shadow_pillagerAI : public ScriptedAI
{
    mob_shadow_pillagerAI(Creature* c) : ScriptedAI(c) {}

    uint32 DotTimer;

    void Reset()
    {
        SetAutocast(SPELL_SEARING_PAIN, 2500, true);
        DotTimer = urand(2000, 6000);
    }
    
    void AttackStart(Unit *who)
    {
        ScriptedAI::AttackStartNoMove(who, CHECK_TYPE_CASTER);
    }

    void UpdateAI(const uint32 diff)
    {
        if(!UpdateVictim())
            return;
        
        if(DotTimer < diff)
        {
            AddSpellToCast(roll_chance_i(50) ? SPELL_IMMOLATE : SPELL_CURSE_OF_AGONY, CAST_RANDOM);
            DotTimer = urand(2000, 8000);
        } 
        else
            DotTimer -= diff;

        CheckCasterNoMovementInRange(diff, 40.0);
        CastNextSpellIfAnyAndReady(diff);
    }    
};

CreatureAI* GetAI_mob_shadow_pillager(Creature *_Creature)
{
    return new mob_shadow_pillagerAI(_Creature);
}


#define SPELL_FIREBOLT    30180

struct mob_homunculusAI : public ScriptedAI
{
    mob_homunculusAI(Creature* c) : ScriptedAI(c) {}

    void Reset()
    {
        SetAutocast(SPELL_FIREBOLT, 2000, true);
    }
    
    void AttackStart(Unit *who)
    {
        ScriptedAI::AttackStartNoMove(who, CHECK_TYPE_CASTER);
    }

    void UpdateAI(const uint32 diff)
    {
        if(!UpdateVictim())
            return;

        CheckCasterNoMovementInRange(diff, 40.0);
        CastNextSpellIfAnyAndReady(diff);
    }    
};

CreatureAI* GetAI_mob_homunculus(Creature *_Creature)
{
    return new mob_homunculusAI(_Creature);
}


void AddSC_karazhan_trash()
{
    Script* newscript;
    newscript = new Script;
    newscript->Name = "spell_charge_29320";
    newscript->pEffectAuraDummy = &Spell_charge;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_phantom_guest";
    newscript->GetAI = &GetAI_mob_phantom_guest;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_skeletal_waiter";
    newscript->GetAI = &GetAI_mob_skeletal_waiter;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_spectral_sentry";
    newscript->GetAI = &GetAI_mob_spectral_sentry;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_arcane_protector";
    newscript->GetAI = &GetAI_mob_arcane_protector;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_mana_warp";
    newscript->GetAI = &GetAI_mob_mana_warp;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_shadow_pillager";
    newscript->GetAI = &GetAI_mob_shadow_pillager;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_homunculus";
    newscript->GetAI = &GetAI_mob_homunculus;
    newscript->RegisterSelf();
}
