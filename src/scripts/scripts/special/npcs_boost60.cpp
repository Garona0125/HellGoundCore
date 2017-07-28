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
SDName: npcs_boost60
SD%Complete: 100
SDComment: To be used for instant 60 custom quests.
SDCategory: NPCs
EndScriptData
*/

#include "precompiled.h"

const int WarriorSpells[] =
{
    33388,    // Spell ID: 33388 (Riding 75)
    198,      // Spell ID: 198 (1h mace)
    201,      // Spell ID: 201 (2h mace)
    196,      // Spell ID: 196 (1h axe)
    1180,     // Spell ID: 1180 (dagger)
    15590,    // Spell ID: 15590 (fist)
    199,      // Spell ID: 199 (2h mace)
    202,      // Spell ID: 202 (2h sword)
    197,      // Spell ID: 197 (2h axe)
    200,      // Spell ID: 200 (polearm)
    2567,     // Spell ID: 2567 (thrown)
    264,      // Spell ID: 264 (bows)
    5011,     // Spell ID: 5011 (xbows)
    266,      // Spell ID: 266 (guns)
    750,      // Spell ID: 750 (plate)
    71,       // Spell ID: 71 (Defensive Stance)
    2458,     // Spell ID: 2458 (Berserker Stance)
    3127,     // Spell ID: 3127 (Parry)
    674,      // Spell ID: 674 (Dual Wield)
    11578,    // Spell ID: 11578 (Charge, R3)
    7373,     // Spell ID: 7373 (Hamstring, R3)
    25286,    // Spell ID: 25286 (Heroic Strike, R9)
    20560,    // Spell ID: 20560 (Mocking Blow, R5)
    11585,    // Spell ID: 11585 (Overpower, R4)
    11574,    // Spell ID: 11574 (Rend, R7)
    20230,    // Spell ID: 20230 (Retalitation)
    11581,    // Spell ID: 11581 (Thunder Clap, R6)
    2687,     // Spell ID: 2687 (Bloodrage)
    676,      // Spell ID: 676 (Disarm)
    25288,    // Spell ID: 25288 (Revenge, R6)
    1672,     // Spell ID: 1672 (Shield Bash, R3)
    2565,     // Spell ID: 2565 (Shield Block)
    871,      // Spell ID: 871 (Shield Wall)
    12678,    // Spell ID: 12678 (Stance Mastery)
    11597,    // Spell ID: 11597 (Sunder Armor, R5)
    355,      // Spell ID: 355 (Taunt)
    25289,    // Spell ID: 25289 (Battle Shout, R7)
    18499,    // Spell ID: 18499 (Berserker Rage)
    1161,     // Spell ID: 1161 (Challenging Shout)
    20569,    // Spell ID: 20569 (Cleave, R5)
    11556,    // Spell ID: 11556 (Demoralizing Shout, R5)
    20662,    // Spell ID: 20662 (Execute, R5)
    20617,    // Spell ID: 20617 (Intercept, R3)
    5246,     // Spell ID: 5246 (Intimidating Shout)
    6554,     // Spell ID: 6554 (Pummel, R2)
    1719,     // Spell ID: 1719 (Recklessness)
    11605,    // Spell ID: 11605 (Slam, R4)
    1680      // Spell ID: 1680 (Whirlwind)
};

const int PaladinSpells[] =
{
    33388,    // Spell ID: 33388 (Riding 75)
    198,      // Spell ID: 198 (1h mace)
    201,      // Spell ID: 201 (1h sword)
    196,      // Spell ID: 196 (1h axe)
    199,      // Spell ID: 199 (2h mace)
    202,      // Spell ID: 202 (2h sword)
    197,      // Spell ID: 197 (2h axe)
    200,      // Spell ID: 200 (polearm)
    750,      // Spell ID: 750 (plate)
    3127,     // Spell ID: 3127 (Parry)
    19979,    // Spell ID: 19979 (Blessing of Light, R3)
    25290,    // Spell ID: 25290 (Blessing of Wisdom, R6)
    4987,     // Spell ID: 4987 (Cleanse)
    20924,    // Spell ID: 20924 (Consecration, R5)
    10314,    // Spell ID: 10314 (Exorcism, R6)
    19943,    // Spell ID: 19943 (Flash of Light, R6)
    25890,    // Spell ID: 25890 (Greater Blessing of Light, R1)
    25918,    // Spell ID: 25918 (Greater Blessing of Wisdom, R2)
    24239,    // Spell ID: 24239 (Hammer of Wrath, R3)
    25292,    // Spell ID: 25292 (Holy Light, R9)
    10318,    // Spell ID: 10318 (Holy Wrath, R2)
    10310,    // Spell ID: 10310 (Lay on Hands, R3)
    1152,     // Spell ID: 1152 (Purify)
    20773,    // Spell ID: 20773 (Redemption, R5)
    20349,    // Spell ID: 20349 (Seal of Light, R4)
    20293,    // Spell ID: 20293 (Seal of Righteousness, R8)
    20357,    // Spell ID: 20357 (Seal of Wisdom, R3)
    34769,    // Spell ID: 34769 (Summon Warhorse)
    10326,    // Spell ID: 10326 (Turn Evil, R1)
    5627,     // Spell ID: 5627 (Turn Undead, R2)
    1044,     // Spell ID: 1044 (Blessing of Freedom)
    5599,     // Spell ID: 5599 (Blessing of Protection, R2)
    10278,    // Spell ID: 10278 (Blessing of Protection, R3)
    20729,    // Spell ID: 20729 (Blessing of Sacrifice, R2)
    1038,     // Spell ID: 1038 (Blessing of Salvation)
    19746,    // Spell ID: 19746 (Concentration Aura)
    10293,    // Spell ID: 10293 (Devotion Aura)
    19752,    // Spell ID: 19752 (Divine Intervenion)
    5573,     // Spell ID: 5573 (Divine Protection, R2)
    1020,     // Spell ID: 1020 (Divine Shield, R2)
    19900,    // Spell ID: 19900 (Fire Resistance Aura, R3)
    19898,    // Spell ID: 19898 (Frost Resistance Aura, R3)
    25895,    // Spell ID: 25895 (Greater Blessing of Salvation)
    10308,    // Spell ID: 10308 (Hammer of Justice, R4)
    31789,    // Spell ID: 31789 (Righteous Defense)
    25780,    // Spell ID: 25780 (Righteous Fury)
    31895,    // Spell ID: 31895 (Seal of Justice, R2)
    19896,    // Spell ID: 19896 (Shadow Resistance Aura, R3)
    31785,    // Spell ID: 31785 (Spiritual Attunement)
    25291,    // Spell ID: 25291 (Blessing of Might, R7)
    25916,    // Spell ID: 25916 (Greater Blessing of Might, R2)
    20271,    // Spell ID: 20271 (Judgement)
    10301,    // Spell ID: 10301 (Retribution Aura, R5)
    20308     // Spell ID: 20308 (Seal of the Crusader, R6)
};

const int HunterSpells[] =
{
    33388,    // Spell ID: 33388 (Riding 75)
    201,      // Spell ID: 201 (1h sword)
    196,      // Spell ID: 196 (1h axe)
    1180,     // Spell ID: 1180 (dagger)
    15590,    // Spell ID: 15590 (fist)
    202,      // Spell ID: 202 (2h sword)
    197,      // Spell ID: 197 (2h axe)
    200,      // Spell ID: 200 (polearm)
    2567,     // Spell ID: 2567 (thrown)
    264,      // Spell ID: 264 (bows)
    5011,     // Spell ID: 5011 (xbows)
    266,      // Spell ID: 266 (guns)
    227,      // Spell ID: 227 (staves)
    3127,     // Spell ID: 3127 (Parry)
    674,      // Spell ID: 674 (Dual Wield)
    8737,     // Spell ID: 8737 (mail)
    5149,     // Spell ID: 5149 (Beast Training)
    13161,    // Spell ID: 13161 (A. of the Beast)
    5118,     // Spell ID: 5118 (A. of the Cheetah)
    25296,    // Spell ID: 25296 (A. of the Hawk, R7)
    13163,    // Spell ID: 13163 (A. of the Monkey)
    13159,    // Spell ID: 13159 (A. of the Pack)
    20190,    // Spell ID: 20190 (A. of the Wild, R2)
    1462,     // Spell ID: 1462 (Beast Lore)
    883,      // Spell ID: 883 (Call Pet)
    6991,     // Spell ID: 6991 (Feed Pet)
    2641,     // Spell ID: 2641 (Dismiss Pet)
    6197,     // Spell ID: 6197 (Eagle Eye)
    1002,     // Spell ID: 1002 (Eyes of the Beast)
    6691,     // Spell ID: 6691 (Feed Pet)
    13544,    // Spell ID: 13544 (Mend Pet, R7)
    982,      // Spell ID: 982 (Revive Pet)
    1513,    // Spell ID: 1513 (Scare Beast, R1)
    14327,    // Spell ID: 14327 (Scare Beast, R3)
    1515,     // Spell ID: 1515 (Tame Beast)
    14287,    // Spell ID: 14287 (Arcane Shot, R8)
    75,       // Spell ID: 75 (Autoshot)
    5116,     // Spell ID: 5116 (Concussive Shot)
    15632,    // Spell ID: 15632 (Distracting Shot, R6)
    1543,     // Spell ID: 1543 (Flare)
    14325,    // Spell ID: 14325 (Hunter's Mark, R4)
    25294,    // Spell ID: 25294 (Multi-Shot, R5)
    3045,     // Spell ID: 3045 (Rapid Fire)
    3043,     // Spell ID: 3043 (Scorpid Sting)
    25295,    // Spell ID: 25295 (Serpent Sting, R9)
    19801,    // Spell ID: 19801 (Tranquilizing Shot)
    14280,    // Spell ID: 14280 (Viper Sting, R3)
    14295,    // Spell ID: 14295 (Volley, R3)
    14273,    // Spell ID: 14273 (Disengage, R3)
    14317,    // Spell ID: 14317 (Explosive Trap, R3)
    5384,     // Spell ID: 5384 (Feign Death)
    14311,    // Spell ID: 14311 (Freezing Trap, R3)
    13809,    // Spell ID: 13809 (Frost Trap)
    14305,    // Spell ID: 14305 (Immolation Trap, R5)
    14271,    // Spell ID: 14271 (Mongoose Bite, R4)
    14266,    // Spell ID: 14266 (Raptor Strike, R8)
    1494,     // Spell ID: 1494 (T. Beasts)
    19878,    // Spell ID: 19878 (T. Demons)
    19879,    // Spell ID: 19879 (T. Dragonkins)
    19880,    // Spell ID: 19880 (T. Elementals)
    19882,    // Spell ID: 19882 (T. Giants)
    19885,    // Spell ID: 19885 (T. Hidden)
    19883,    // Spell ID: 19883 (T. Humanoids)
    19884,    // Spell ID: 19884 (T. Undeads)
    14268,    // Spell ID: 14268 (Wing Clip, R3)
    14927     // Spell ID: 14927 (Growl, R7)
};

const int RogueSpells[] =
{
    33388,    // Spell ID: 33388 (Riding 75)
    198,      // Spell ID: 198 (1h mace)
    201,      // Spell ID: 201 (1h sword)
    1180,     // Spell ID: 1180 (dagger)
    15590,    // Spell ID: 15590 (fist
    200,      // Spell ID: 200 (polearm)
    2567,     // Spell ID: 2567 (thrown)
    264,      // Spell ID: 264 (bows)
    5011,     // Spell ID: 5011 (xbow)
    266,      // Spell ID: 266 (guns)
    2842,     // Spell ID: 2842 (Poison Making)
    674,      // Spell ID: 674 (Dual Wield)
    3127,     // Spell ID: 1804 (Parry)
    11269,    // Spell ID: 11269 (Ambush R6)
    1833,     // Spell ID: 1833 (Cheap shot)
    31016,    // Spell ID: 31016 (Eviscerate R9)
    11198,    // Spell ID: 11198 (Expose Armor R5)
    11290,    // Spell ID: 11290 (Garrote R6)
    8643,     // Spell ID: 8643 (Kidney Shot R2)
    11275,    // Spell ID: 11275 (Rupture R6)
    6774,     // Spell ID: 6774 (Slice and Dice R2)
    25300,    // Spell ID: 25300 (Backstab R9)
    26669,    // Spell ID: 26669 (Evasion R2)
    25302,    // Spell ID: 25302 (Feint R5)
    11286,    // Spell ID: 11286 (Gouge R5)
    1769,     // Spell ID: 1769 (Kick R4)
    11294,    // Spell ID: 11294 (Sinister Strike R8)
    11305,    // Spell ID: 11305 (Sprint R3)
    2094,     // Spell ID: 2094 (Blind)
    2836,     // Spell ID: 2836 (Detect Traps)
    1842,     // Spell ID: 1842 (Disarm Trap)
    1725,     // Spell ID: 1725 (Distract)
    921,      // Spell ID: 921 (Pick Pocket)
    1860,     // Spell ID: 1860 (Safe Fall)
    11297,    // Spell ID: 11297 (Sap R3)
    1787,     // Spell ID: 1787 (Stealth R4)
    1857,     // Spell ID: 1857 (Vanish R2)
    11343,    // Spell ID: 11343 (Instant Posion R6)
    13230,    // Spell ID: 13230 (Wound Poison R4)
    25347,    // Spell ID: 25347 (Deadly Poison R5)
    11400,    // Spell ID: 11400 (Mind-numbing Poison R3)
    3421      // Spell ID: 3421 (Crippling Poison R2)
};

const int PriestSpells[] =
{
    33388,    // Spell ID: 33388 (Riding 75)
    198,      // Spell ID: 198 (1h mace)
    1180,     // Spell ID: 1180 (dagger)
    227,      // Spell ID: 227 (staff)
    988,      // Spell ID: 988 (Dispel Magic R2)
    6346,     // Spell ID: 6346 (Fear Ward)
    10952,    // Spell ID: 10952 (Inner Fire R6)
    1706,     // Spell ID: 1706 (Levitate)
    10876,    // Spell ID: 10876 (Mana Burn)
    10938,    // Spell ID: 10938 (Power Word: Fortitude R6)
    10901,    // Spell ID: 10901 (Power Word: Shield R10)
    21564,    // Spell ID: 21564 (Prayer of Fortitude R2)
    10955,    // Spell ID: 10955 (Shackle Undead R3)
    552,      // Spell ID: 552 (Abolish Disease)
    528,      // Spell ID: 528 (Cure Disease)
    10917,    // Spell ID: 10917 (Flash Heal R7)
    25314,    // Spell ID: 25314 (Greater Heal R5)
    6064,     // Spell ID: 6064 (Heal R4)
    15261,    // Spell ID: 15261 (Holy Fire R8)
    2053,     // Spell ID: 2053 (Lesser Heal R3)
    25316,    // Spell ID: 25316 (Prayer of Healing R5)
    25315,    // Spell ID: 25315 (Renew R10)
    20770,    // Spell ID: 20770 (Resurrection R5)
    10934,    // Spell ID: 10934 (Smite R8)
    10942,    // Spell ID: 10942 (Fade R6)
    10947,    // Spell ID: 10947 (Mind Blast R9)
    10912,    // Spell ID: 10912 (Mind Control R3)
    10953,    // Spell ID: 10953 (Mind Soothe R3)
    10909,    // Spell ID: 10909 (Mind Vision R2)
    27683,    // Spell ID: 27683 (Prayer of Shadow Protection R1)
    10890,    // Spell ID: 10890 (Psychic Scream R4)
    10958,    // Spell ID: 10958 (Shadow Protection R3)
    10894     // Spell ID: 10894 (Shadow Word: Pain R8)
};

const int ShamanSpells[] =
{
    33388,    // Spell ID: 33388 (Riding 75)
    1180,     // Spell ID: 1180 (dagger)
    15590,    // Spell ID: 15590 (fist)
    198,      // Spell ID: 198 (1h mace)
    196,      // Spell ID: 196 (1h axe)
    199,      // Spell ID: 199 (2h mace)
    197,      // Spell ID: 197 (2h axe)
    227,      // Spell ID: 227 (staff)
    8737,     // Spell ID: 8737 (mail)
    10605,    // Spell ID: 10605 (Chain Lightning, R4)
    10414,    // Spell ID: 10414 (Earth Shock, R7)
    2484,     // Spell ID: 2484 (Earthbind T.)
    11315,    // Spell ID: 11315 (Fire Nova T., R5)
    29228,    // Spell ID: 29228 (Flame Shock, R6)
    10473,    // Spell ID: 10473 (Frost Shock, R4)
    15208,    // Spell ID: 15208 (Lightening Bolt, R10)
    10587,    // Spell ID: 10587 (Magma T., R4)
    8012,     // Spell ID: 8012 (Purge, R2)
    10438,    // Spell ID: 10438 (Searing T., R6)
    10428,    // Spell ID: 10428 (Stoneclaw T., R6)
    556,      // Spell ID: 556 (Astral Recall)
    6196,     // Spell ID: 6196 (Far Sight)
    10538,    // Spell ID: 10538 (Fire Resistance T., R3)
    16387,    // Spell ID: 16387 (Flametongue T., R4)
    16342,    // Spell ID: 16342 (Flametongue Weapon, R6)
    10479,    // Spell ID: 10479 (Frost Resistance T., R3)
    16356,    // Spell ID: 16356 (Frostbrand Weapon)
    2645,     // Spell ID: 2645 (Ghost Wolf)
    25359,    // Spell ID: 25359 (Grace of Air T., R3)
    8177,     // Spell ID: 8177 (Grounding T.)
    10432,    // Spell ID: 10432 (Lightening Shield, R7)
    10601,    // Spell ID: 10601 (Nature Resistance T., R3)
    16316,    // Spell ID: 16316 (Rockbitter Weapon, R7)
    6495,     // Spell ID: 6495 (Sentry T.)
    10408,    // Spell ID: 10408 (Stoneskin T., R6)
    25361,    // Spell ID: 25361 (Strenght of Earth T., R5)
    131,      // Spell ID: 131 (Water Breathing)
    546,      // Spell ID: 546 (Water Walking)
    10614,    // Spell ID: 10614 (Windfury T., R3)
    16362,    // Spell ID: 16362 (Windfury Weapon, R4)
    15112,    // Spell ID: 15112 (Windwall T., R3)
    20777,    // Spell ID: 20777 (Ancestral Spirit, T5)
    10623,    // Spell ID: 10623 (Chain Heal, R3)
    2870,     // Spell ID: 2870 (Cure Disease)
    526,      // Spell ID: 526 (Cure Poison)
    8170,     // Spell ID: 8170 (Disease Cleansing T.)
    10463,    // Spell ID: 10463 (Healing Stream T., R5)
    25357,    // Spell ID: 25357 (Healing Wave, R10)
    10468,    // Spell ID: 10468 (Lesser Healing Wave, R6)
    10497,    // Spell ID: 10497 (Mana Spring T., R4)
    8166,     // Spell ID: 8166 (Poison Cleansing T.)
    20608,    // Spell ID: 20608 (Reincarnation)
    36936,    // Spell ID: 36936 (Totemic Call)
    25908,    // Spell ID: 25908 (Tranquil Air T.)
    8143      // Spell ID: 8143 (Tremor T.)
};

const int MageSpells[] =
{
    33388,    // Spell ID: 33388 (Riding 75)
    201,      // Spell ID: 201 (1h sword)
    1180,     // Spell ID: 1180 (dagger)
    227,      // Spell ID: 227 (staff)
    130,      // Spell ID: 130 (Slow Fall)
    10170,    // Spell ID: 10170 (Amplify Magic R4)
    23028,    // Spell ID: 23028 (Arcane Brilliance R1)
    10202,    // Spell ID: 10202 (Arcane Explosion R6)
    10157,    // Spell ID: 10157 (Arcane Intellect R5)
    25345,    // Spell ID: 25345 (Arcane Missiles R8)
    1953,     // Spell ID: 1953 (Blink)
    28612,    // Spell ID: 28612 (Conjure Food)
    759,      // Spell ID: 759 (Conjure Mana Agate)
    10053,    // Spell ID: 10053 (Conjure Mana Citrine)
    3552,     // Spell ID: 3552 (Conjure Mana Jade)
    10054,    // Spell ID: 10054 (Conjure Mana Ruby)
    10140,    // Spell ID: 10140 (Conjure Water)
    2139,     // Spell ID: 2139 (Counterspell)
    10174,    // Spell ID: 10174 (Dampen Magic R5)
    12051,    // Spell ID: 12051 (Evocation)
    22783,    // Spell ID: 22783 (Mage Armor R3)
    10193,    // Spell ID: 10193 (Mana Shield R6)
    12826,    // Spell ID: 12826 (Polymorph R4)
    475,      // Spell ID: 475 (Remove Lesser Curse)
    10199,    // Spell ID: 10199 (Fire Blast R7)
    10225,    // Spell ID: 10225 (Fire Ward R5)
    10151,    // Spell ID: 10151 (Fireball R11)
    10216,    // Spell ID: 10216 (Flamestrike R6)
    10207,    // Spell ID: 10207 (Scorch R7)
    10187,    // Spell ID: 10187 (Blizzard R6)
    10161,    // Spell ID: 10161 (Cone of Cold R5)
    7301,     // Spell ID: 7301 (Frost Armor R3)
    10230,    // Spell ID: 10230 (Frost Nova R4)
    28609,    // Spell ID: 28609 (Frost Ward R5)
    25304,    // Spell ID: 25304 (Frostbolt R11)
    10220,    // Spell ID: 10220 (Ice Armor 10220)
    45438     // Spell ID: 45438 (Ice Block)
};

const int WarlockSpells[] =
{
    33388,    // Spell ID: 33388 (Riding 75)
    201,      // Spell ID: 201 (1h sword)
    1180,     // Spell ID: 1180 (dagger)
    227,      // Spell ID: 227 (staff)
    25311,    // Spell ID: 25311 (Corruption R7)
    11713,    // Spell ID: 11713 (Curse of Agony R6)
    603,      // Spell ID: 603 (Curse of Doom R1)
    11717,    // Spell ID: 11717 (Curse of Recklessness R4)
    11722,    // Spell ID: 11722 (Curse of Elements R4)
    11719,    // Spell ID: 11719 (Curse of Tongues R2)
    11708,    // Spell ID: 11708 (Curse of Weakness R6)
    17926,    // Spell ID: 17926 (Death Coil R3)
    11700,    // Spell ID: 11700 (Drain Life R6)
    11704,    // Spell ID: 11704 (Drain Mana R4)
    11675,    // Spell ID: 11675 (Drain Soul R4)
    6215,     // Spell ID: 6215 (Fear R3)
    17928,    // Spell ID: 17928 (Howl of Terror R2)
    11689,    // Spell ID: 11689 (Life Tap R6)
    18647,    // Spell ID: 18647 (Banish R2)
    17953,    // Spell ID: 17953 (Create Firestone R4)
    11730,    // Spell ID: 11730 (Create Healthstone R5)
    20757,    // Spell ID: 20757 (Create Soulstone R5)
    17728,    // Spell ID: 17728 (Create Spellstone R3)
    11735,    // Spell ID: 11735 (Demon Armor R5)
    696,      // Spell ID: 696 (Demon Skin R2)
    132,      // Spell ID: 132 (Detect Invisibility)
    11726,    // Spell ID: 11726 (Enslave Demon R3)
    126,      // Spell ID: 126 (Eye of Kilrogg)
    11695,    // Spell ID: 11695 (Health Funnel R7)
    1122,     // Spell ID: 1122 (Inferno)
    18540,    // Spell ID: 18540 (Ritual of Doom)
    698,      // Spell ID: 698 (Ritual of Summoning)
    5500,     // Spell ID: 5500 (Sense Demons)
    28610,    // Spell ID: 28610 (Shadow Ward R4)
    691,      // Spell ID: 691 (Summon Felhunter)
    5784,     // Spell ID: 5784 (Summon Felsteed)
    688,      // Spell ID: 688 (Summon Imp)
    712,      // Spell ID: 712 (Summon Succubus)
    697,      // Spell ID: 697 (Summon Voidwalker)
    5697,     // Spell ID: 5697 (Unending Breath)
    11684,    // Spell ID: 11684 (Hellfire R3)
    25309,    // Spell ID: 25309 (Immolate R8)
    11678,    // Spell ID: 11678 (Rain of Fire R4)
    17923,    // Spell ID: 17923 (Searing Pain R6)
    11661,    // Spell ID: 11661 (Shadow Bolt R9)
    27211     // Spell ID: 27211 (Soul Fire R2)
};

const int DruidSpells[] =
{
    33388,    // Spell ID: 33388 (Riding 75)
    1180,     // Spell ID: 1180 (dagger)
    15590,    // Spell ID: 15590 (fist)
    227,      // Spell ID: 227 (staff)
    198,      // Spell ID: 198 (1h mace)
    199,      // Spell ID: 199 (2h mace)
    22812,    // Spell ID: 22812 (Barkskin)
    9853,     // Spell ID: 9853 (Entangling Roots R6)
    9907,     // Spell ID: 9907 (Fearie Fire R4)
    18658,    // Spell ID: 18658 (Hibernate R3)
    17402,    // Spell ID: 17402 (Hurricane R3)
    21966,    // Spell ID: 21966 (Innervate)
    9835,     // Spell ID: 9835 (moonfire R 10)
    9901,     // Spell ID: 9901 (Soothe Animal R3)
    25298,    // Spell ID: 25298 (Starfire R7)
    18960,    // Spell ID: 18960 (Tp Moonglade)
    9910,     // Spell ID: 9910 (Thorns R8)
    9912,     // Spell ID: 9912 (Wrath R8)
    1066,     // Spell ID: 1066 (Aquatic Form)
    8983,     // Spell ID: 8983 (Bash R3)
    768,      // Spell ID: 768 (Cat Form)
    5209,     // Spell ID: 5209 (Challenging roar)
    9850,     // Spell ID: 9850 (Claw R5)
    31709,    // Spell ID: 31709 (Cower R4)
    9821,     // Spell ID: 9821 (Dash R3)
    9898,     // Spell ID: 9898 (Demoralizing Roar R5)
    9634,     // Spell ID: 9634 (Dire Bear Form)
    5229,     // Spell ID: 5229 (Enrage)
    20719,    // Spell ID: 20719 (Feline Grace)
    31018,    // Spell ID: 31018 (Fericious Bite R5)
    22896,    // Spell ID: 22896 (Frenzied Regeneration R3)
    6795,     // Spell ID: 6795 (Growl)
    9881,     // Spell ID: 9881 (Maul R7)
    9827,     // Spell ID: 9827 (Pounce R3)
    9913,     // Spell ID: 9913 (Prowl R3)
    9904,     // Spell ID: 9904 (Rake R4)
    9867,     // Spell ID: 9867 (Ravage R4)
    9896,     // Spell ID: 9896 (Rip R6)
    9830,     // Spell ID: 9830 (Shred R5)
    9908,     // Spell ID: 9908 (Swipe R5)
    9846,     // Spell ID: 9846 (Tigers Fury R4)
    5225,     // Spell ID: 5225 (Track Humanoids)
    783,      // Spell ID: 783 (Travel Form)
    2893,     // Spell ID: 2893 (abolish poison)
    8946,     // Spell ID: 8946 (cure poison)
    21850,    // Spell ID: 21850 (Gift of the Wild R3)
    25297,    // Spell ID: 25297 (Healing Touch R11)
    9885,     // Spell ID: 9885 (Mark of the Wild R7)
    20748,    // Spell ID: 20748 (Rebirth R5)
    9858,     // Spell ID: 9858 (Regrowth R9)
    25299,    // Spell ID: 25299 (Rejuvenation R11)
    2782,     // Spell ID: 2782 (Remove Curse)
    29166,     // Spell ID: 29166 (Innervate)
    9863      // Spell ID: 9863 (Tranquility R4)
};

#define BOOST_60_QUEST     90001
#define SPELL_KNOCKBACK    10689

/*######
## npc_journey_headmaster
######*/

struct npc_journey_headmasterAI : public ScriptedAI
{
    npc_journey_headmasterAI(Creature* creature) : ScriptedAI(creature) {}

    uint32 TalkTimer;

    void Reset() { TalkTimer = urand(3000, 12000); }

    void MoveInLineOfSight(Unit* who) 
    {
        if (who->GetTypeId() == TYPEID_PLAYER && who->IsInRange2d(me->GetPositionX(), me->GetPositionY(), 0, 0))
        {
            DoCast(who, SPELL_KNOCKBACK);
            me->Say("Get off my face $N!", 0, who->GetGUID());
        }
    }

    void UpdateAI(const uint32 diff)
    {
        if (!me->isInCombat())
        {
            if (TalkTimer <= diff)
            {
                me->Say("Talk to me to start your journey!" , 0, 0);
                TalkTimer = urand(60000, 300000);
            }
            else TalkTimer -= diff;
        }

        if (!UpdateVictim())
            return;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_npc_journey_headmaster(Creature* creature)
{
    return new npc_journey_headmasterAI(creature);
}

bool GossipHello_npc_journey_headmaster(Player *player, Creature *creature)
{
    if (player->getLevel() == 1 || player->GetQuestRewardStatus(BOOST_60_QUEST))
    {
        if (creature->isQuestGiver())
            player->PrepareQuestMenu(creature->GetGUID());

        player->SEND_GOSSIP_MENU(creature->GetNpcTextId(), creature->GetGUID());
    }
    else
        player->GetSession()->SendNotification("You can talk to this NPC only on level 1 or after activating instant level 60 feature.");

    return true;
}

/*######
## npc_journey_quartermaster
######*/

#define GOSSIP_BOOST60_MENU_1      "Train me!"
#define GOSSIP_BOOST60_MENU_2_A    "Take me to Nethergrade Keep!"
#define GOSSIP_BOOST60_MENU_2_H    "Take me to Stonard!"
#define GOSSIP_SHOW_GRIMORIES      "Purchase grimoires."

struct npc_journey_quartermasterAI : public ScriptedAI
{
    npc_journey_quartermasterAI(Creature* creature) : ScriptedAI(creature) {}

    void MoveInLineOfSight(Unit* who) 
    {
        if (who->GetTypeId() == TYPEID_PLAYER && who->IsInRange2d(me->GetPositionX(), me->GetPositionY(), 0, 0))
        {
            DoCast(who, SPELL_KNOCKBACK);
            me->Say("Get off my face $N!", 0, who->GetGUID());
        }
    }
};

CreatureAI* GetAI_npc_journey_quartermaster(Creature* creature)
{
    return new npc_journey_quartermasterAI(creature);
}

bool GossipHello_npc_journey_quartermaster(Player *player, Creature *creature)
{
    if (player->GetQuestRewardStatus(BOOST_60_QUEST))
    {
        if (creature->isQuestGiver())
            player->PrepareQuestMenu(creature->GetGUID());

        // Level under 60 so only train option
        if (player->getLevel() < 60)
        {
            player->ADD_GOSSIP_ITEM(0, GOSSIP_BOOST60_MENU_1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
            player->SEND_GOSSIP_MENU(creature->GetNpcTextId(), creature->GetGUID());
        } 
        // Level 60 so is trained already, unlock teleport option
        else if (player->getLevel() == 60)
        {
            if (player->GetTeam() == ALLIANCE)
                player->ADD_GOSSIP_ITEM(0, GOSSIP_BOOST60_MENU_2_A, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
            else
                player->ADD_GOSSIP_ITEM(0, GOSSIP_BOOST60_MENU_2_H, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);

            if (player->getClass() == CLASS_WARLOCK)
                player->ADD_GOSSIP_ITEM(0, GOSSIP_SHOW_GRIMORIES, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4);

            player->SEND_GOSSIP_MENU(creature->GetNpcTextId(), creature->GetGUID());
        } 
        // Above 60 level so only notification
        else 
            player->GetSession()->SendNotification("The teleport option is available only for level 60 characters.");
	}
    else
        player->GetSession()->SendNotification("You can talk to this NPC only after activating instant level 60 feature.");

    return true;
}

bool GossipSelect_npc_journey_quartermaster(Player *player, Creature *creature, uint32 sender, uint32 action)
{
    switch(action)
    {
        case GOSSIP_ACTION_INFO_DEF + 1:
        {
            player->CLOSE_GOSSIP_MENU();
            switch (player->getClass())
            {
                case CLASS_WARRIOR: // Warrior
                {
                    // Learn spells
                    for (int i = 0 ; i < 48; i++)
                    {
                        if (!player->HasSpell(WarriorSpells[i]))
                            player->learnSpell(WarriorSpells[i]);
                    }
                    // Set level
                    player->SetDifficulty(DIFFICULTY_NORMAL);
                    player->GiveLevel(60);
                    player->InitTalentForLevel();
                    player->SetUInt32Value(PLAYER_XP,0);
                    // Maxout skills
                    player->UpdateSkillsToMaxSkillsForLevel();
                } break;
                case CLASS_PALADIN: // Paladin
                {
                    // Learn spells
                    for (int i = 0 ; i < 54; i++)
                    {
                        if (!player->HasSpell(PaladinSpells[i]))
                            player->learnSpell(PaladinSpells[i]);
                    }
                    // Set level
                    player->SetDifficulty(DIFFICULTY_NORMAL);
                    player->GiveLevel(60);
                    player->InitTalentForLevel();
                    player->SetUInt32Value(PLAYER_XP,0);
                    // Maxout skills
                    player->UpdateSkillsToMaxSkillsForLevel();
                } break;
                case CLASS_HUNTER: // Hunter
                {
                    // Learn spells
                    for (int i = 0 ; i < 66; i++)
                    {
                        if (!player->HasSpell(HunterSpells[i]))
                            player->learnSpell(HunterSpells[i]);
                    }
                    // Set level
                    player->SetDifficulty(DIFFICULTY_NORMAL);
                    player->GiveLevel(60);
                    player->InitTalentForLevel();
                    player->SetUInt32Value(PLAYER_XP,0);
                    // Maxout skills
                    player->UpdateSkillsToMaxSkillsForLevel();
                } break;
                case CLASS_ROGUE: // Rogue
                {
                    // Learn spells
                    for (int i = 0 ; i < 43; i++)
                    {
                        if (!player->HasSpell(RogueSpells[i]))
                            player->learnSpell(RogueSpells[i]);
                    }
                    // Set level
                    player->SetDifficulty(DIFFICULTY_NORMAL);
                    player->GiveLevel(60);
                    player->InitTalentForLevel();
                    player->SetUInt32Value(PLAYER_XP,0);
                    // Maxout skills
                    player->UpdateSkillsToMaxSkillsForLevel();
                } break;
                case CLASS_PRIEST: // Priest
                {
                    // Learn spells
                    for (int i = 0 ; i < 33; i++)
                    {
                        if (!player->HasSpell(PriestSpells[i]))
                            player->learnSpell(PriestSpells[i]);
                    }
                    // Set level
                    player->SetDifficulty(DIFFICULTY_NORMAL);
                    player->GiveLevel(60);
                    player->InitTalentForLevel();
                    player->SetUInt32Value(PLAYER_XP,0);
                    // Maxout skills
                    player->UpdateSkillsToMaxSkillsForLevel();
                } break;
                case CLASS_SHAMAN: // Shaman
                {
                    // Learn spells
                    for (int i = 0 ; i < 55; i++)
                    {
                        if (!player->HasSpell(ShamanSpells[i]))
                            player->learnSpell(ShamanSpells[i]);
                    }
                    // Set level
                    player->SetDifficulty(DIFFICULTY_NORMAL);
                    player->GiveLevel(60);
                    player->InitTalentForLevel();
                    player->SetUInt32Value(PLAYER_XP,0);
                    // Maxout skills
                    player->UpdateSkillsToMaxSkillsForLevel();
                } break;
                case CLASS_MAGE: // Mage
                {
                    // Learn spells
                    for (int i = 0 ; i < 37; i++)
                    {
                        if (!player->HasSpell(MageSpells[i]))
                            player->learnSpell(MageSpells[i]);
                    }
                    // Set level
                    player->SetDifficulty(DIFFICULTY_NORMAL);
                    player->GiveLevel(60);
                    player->InitTalentForLevel();
                    player->SetUInt32Value(PLAYER_XP,0);
                    // Maxout skills
                    player->UpdateSkillsToMaxSkillsForLevel();
                } break;
                case CLASS_WARLOCK: // Warlock
                {
                    // Learn spells
                    for (int i = 0 ; i < 46; i++)
                    {
                        if (!player->HasSpell(WarlockSpells[i]))
                            player->learnSpell(WarlockSpells[i]);
                    }
                    // Set level
                    player->SetDifficulty(DIFFICULTY_NORMAL);
                    player->GiveLevel(60);
                    player->InitTalentForLevel();
                    player->SetUInt32Value(PLAYER_XP,0);
                    // Maxout skills
                    player->UpdateSkillsToMaxSkillsForLevel();
                } break;
                case CLASS_DRUID: // Druid
                {
                    // Learn spells
                    for (int i = 0 ; i < 54; i++)
                    {
                        if (!player->HasSpell(DruidSpells[i]))
                            player->learnSpell(DruidSpells[i]);
                    }
                    // Set level
                    player->SetDifficulty(DIFFICULTY_NORMAL);
                    player->GiveLevel(60);
                    player->InitTalentForLevel();
                    player->SetUInt32Value(PLAYER_XP,0);
                    // Maxout skills
                    player->UpdateSkillsToMaxSkillsForLevel();
                }
            }
        } 
        break;
        // Alliance Teleport
        case GOSSIP_ACTION_INFO_DEF + 2:
        {
             player->CLOSE_GOSSIP_MENU();
             player->TeleportTo(0, -11012.531250, -3452.083984, 64.969795, 1.265645);
        }
        break;
        // Horde Teleport
        case GOSSIP_ACTION_INFO_DEF + 3:
        {
             player->CLOSE_GOSSIP_MENU();
             player->TeleportTo(0, -10438.488281, -3280.45008, 20.178223, 1.736098);
        }
        break;
			// Warlock books
        case GOSSIP_ACTION_INFO_DEF + 4:
        {
            player->SEND_VENDORLIST( creature->GetGUID() );
        }
        break;
	}
	return true;
}

void AddSC_npcs_boost60()
{
    Script *newscript;

    newscript = new Script;
    newscript->Name="npc_journey_headmaster";
    newscript->pGossipHello =   &GossipHello_npc_journey_headmaster;
    newscript->GetAI = &GetAI_npc_journey_headmaster;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name="npc_journey_quartermaster";
    newscript->pGossipHello =   &GossipHello_npc_journey_quartermaster;
    newscript->pGossipSelect =  &GossipSelect_npc_journey_quartermaster;
    newscript->GetAI = &GetAI_npc_journey_quartermaster;
    newscript->RegisterSelf();
}