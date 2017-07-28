DELETE FROM `creature_involvedrelation` WHERE `creature_involvedrelation`.`id` = 90000;
DELETE FROM `creature_involvedrelation` WHERE `creature_involvedrelation`.`id` = 90001;
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES
(90000, 90000),
(90000, 90001),
(90001, 90002),
(90001, 91000),
(90001, 91001),
(90001, 91002),
(90001, 91003),
(90001, 91004),
(90001, 91005),
(90001, 92000),
(90001, 92001),
(90001, 92002),
(90001, 93000),
(90001, 93001),
(90001, 93002),
(90001, 94000),
(90001, 94001),
(90001, 94002),
(90001, 95000),
(90001, 95001),
(90001, 95002),
(90001, 95003),
(90001, 95004),
(90001, 95005),
(90001, 95006),
(90001, 95007),
(90001, 95008),
(90001, 96000),
(90001, 96001),
(90001, 96002),
(90001, 96003),
(90001, 96004),
(90001, 96005),
(90001, 97000),
(90001, 97001),
(90001, 97002),
(90001, 97003),
(90001, 98000),
(90001, 98001),
(90001, 98002),
(90001, 98003),
(90001, 98004),
(90001, 98005),
(90001, 98006),
(90001, 98007),
(90001, 98008),
(90001, 99000),
(90001, 99001),
(90001, 99002),
(90001, 99003),
(90001, 99004),
(90001, 99005),
(90001, 99006),
(90001, 99007),
(90001, 99008),
(90001, 99009),
(90001, 99900),
(90001, 99901),
(90001, 99902),
(90001, 99903),
(90001, 99904),
(90001, 99905),
(90001, 99906),
(90001, 99907),
(90001, 99908),
(90001, 99909);

DELETE FROM `creature_questrelation` WHERE `creature_questrelation`.`id` = 90000;
DELETE FROM `creature_questrelation` WHERE `creature_questrelation`.`id` = 90001;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES
(90000, 90000),
(90000, 90001),
(90000, 90002),
(90001, 91000),
(90001, 91001),
(90001, 91002),
(90001, 91003),
(90001, 91004),
(90001, 91005),
(90001, 92000),
(90001, 92001),
(90001, 92002),
(90001, 93000),
(90001, 93001),
(90001, 93002),
(90001, 94000),
(90001, 94001),
(90001, 94002),
(90001, 95000),
(90001, 95001),
(90001, 95002),
(90001, 95003),
(90001, 95004),
(90001, 95005),
(90001, 95006),
(90001, 95007),
(90001, 95008),
(90001, 96000),
(90001, 96001),
(90001, 96002),
(90001, 96003),
(90001, 96004),
(90001, 96005),
(90001, 97000),
(90001, 97001),
(90001, 97002),
(90001, 97003),
(90001, 98000),
(90001, 98001),
(90001, 98002),
(90001, 98003),
(90001, 98004),
(90001, 98005),
(90001, 98006),
(90001, 98007),
(90001, 98008),
(90001, 99000),
(90001, 99001),
(90001, 99002),
(90001, 99003),
(90001, 99004),
(90001, 99005),
(90001, 99006),
(90001, 99007),
(90001, 99008),
(90001, 99009),
(90001, 99900),
(90001, 99901),
(90001, 99902),
(90001, 99903),
(90001, 99904),
(90001, 99905),
(90001, 99906),
(90001, 99907),
(90001, 99908),
(90001, 99909);

DELETE FROM `creature_template` WHERE `creature_template`.`entry` = 90000;
DELETE FROM `creature_template` WHERE `creature_template`.`entry` = 90001;
INSERT INTO `creature_template` (`entry`, `heroic_entry`, `KillCredit`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `xp_modifier`, `faction_A`, `faction_H`, `npcflag`, `speed`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `baseattacktime`, `rangeattacktime`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `class`, `race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `RacialLeader`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES
(90000, NULL, NULL, 4321, 4321, 4321, 4321, 'The Journey Headmaster', 'Choose Your Path', NULL, 70, 70, 1337, 1337, 1337, 1337, 8000, 1, 1779, 1779, 3, 1, 1, 0, 1337, 1337, 0, 0, 200, 200, 256, NULL, NULL, NULL, NULL, NULL, NULL, 1337, 1337, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1073741823, NULL, NULL),
(90001, NULL, NULL, 4323, 4323, 4323, 4323, 'The Journey Quartermaster', 'Choose Your Path', NULL, 70, 70, 1337, 1337, 1337, 1337, 8000, 1, 1779, 1779, 3, 1, 1, 0, 1337, 1337, 0, 0, 200, 200, 256, NULL, NULL, NULL, NULL, NULL, NULL, 1337, 1337, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1073741823, NULL, NULL);


DELETE FROM `quest_template` WHERE `quest_template`.`entry` >= 90000;
INSERT INTO `quest_template` (`entry`, `Method`, `ZoneOrSort`, `SkillOrClass`, `MinLevel`, `QuestLevel`, `Type`, `RequiredRaces`, `RequiredSkillValue`, `RepObjectiveFaction`, `RepObjectiveValue`, `RequiredMinRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepFaction`, `RequiredMaxRepValue`, `SuggestedPlayers`, `LimitTime`, `QuestFlags`, `SpecialFlags`, `CharTitleId`, `PrevQuestId`, `NextQuestId`, `ExclusiveGroup`, `NextQuestInChain`, `SrcItemId`, `SrcItemCount`, `SrcSpell`, `Name`, `Details`, `Objectives`, `OfferRewardText`, `RequestItemsText`, `EndText`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `ReqItemId1`, `ReqItemId2`, `ReqItemId3`, `ReqItemId4`, `ReqItemCount1`, `ReqItemCount2`, `ReqItemCount3`, `ReqItemCount4`, `ReqSourceId1`, `ReqSourceId2`, `ReqSourceId3`, `ReqSourceId4`, `ReqSourceCount1`, `ReqSourceCount2`, `ReqSourceCount3`, `ReqSourceCount4`, `ReqSourceRef1`, `ReqSourceRef2`, `ReqSourceRef3`, `ReqSourceRef4`, `ReqCreatureOrGOId1`, `ReqCreatureOrGOId2`, `ReqCreatureOrGOId3`, `ReqCreatureOrGOId4`, `ReqCreatureOrGOCount1`, `ReqCreatureOrGOCount2`, `ReqCreatureOrGOCount3`, `ReqCreatureOrGOCount4`, `ReqSpellCast1`, `ReqSpellCast2`, `ReqSpellCast3`, `ReqSpellCast4`, `RewChoiceItemId1`, `RewChoiceItemId2`, `RewChoiceItemId3`, `RewChoiceItemId4`, `RewChoiceItemId5`, `RewChoiceItemId6`, `RewChoiceItemCount1`, `RewChoiceItemCount2`, `RewChoiceItemCount3`, `RewChoiceItemCount4`, `RewChoiceItemCount5`, `RewChoiceItemCount6`, `RewItemId1`, `RewItemId2`, `RewItemId3`, `RewItemId4`, `RewItemCount1`, `RewItemCount2`, `RewItemCount3`, `RewItemCount4`, `RewRepFaction1`, `RewRepFaction2`, `RewRepFaction3`, `RewRepFaction4`, `RewRepFaction5`, `RewRepValue1`, `RewRepValue2`, `RewRepValue3`, `RewRepValue4`, `RewRepValue5`, `RewHonorableKills`, `RewOrReqMoney`, `RewMoneyMaxLevel`, `RewSpell`, `RewSpellCast`, `RewMailTemplateId`, `RewMailDelaySecs`, `PointMapId`, `PointX`, `PointY`, `PointOpt`, `DetailsEmote1`, `DetailsEmote2`, `DetailsEmote3`, `DetailsEmote4`, `IncompleteEmote`, `CompleteEmote`, `OfferRewardEmote1`, `OfferRewardEmote2`, `OfferRewardEmote3`, `OfferRewardEmote4`, `StartScript`, `CompleteScript`) VALUES
(90000, 1, 1941, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90000, 0, 0, 0, 0, 'Show me Azeroth! (Start at level 1)', 'Hello, $N! So, if you''re not ready to conquer Outland yet, let it be. Remember, that this decision can''t be changed in the future.', 'Choose where do you want to start.', 'Please remember that your decision will be impossible to revoke on this character after completing this quest.', NULL, 'Start in Azeroth!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 39656, 13582, 13584, 13583, 0, 0, 1, 1, 1, 1, 0, 0, 28788, 23162, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(90001, 1, 1941, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90000, 0, 0, 0, 0, 'Send me to Outland! (Start at level 60)', 'Hello, $N! So, if you want to go straight to Outland, let it be. Remember, that this decision can''t be changed in the future.', 'Choose where do you want to start.', 'Please remember that your decision will be impossible to revoke on this character after completing this quest.', NULL, 'Start in Outland!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(90002, 1, 1941, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90001, 0, 0, 0, 0, 0, 0, 'Collect ordnance (Equip received bags immediately)', 'You will need equipment to survive in Outland. Luckily for you, we are going to provide you with it.\n\nEQUIP THE BAGS IMMEDIATELY, BEFORE STARTING THE NEXT QUEST.', 'Report to the Journey Quartermaster.', 'Take these bags, so you can carry the equipment with you. Make sure to put them on immediately, so I can continue the distribution of goods.\n\nEQUIP THE BAGS BEFORE STARTING THE NEXT QUEST!', NULL, 'Let the adventure begin!', '', NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23852, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(91000, 1, 1941, -1, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90002, 0, 91000, 0, 0, 0, 0, 'Path of Arms and Fury', 'The Path of Arms and Fury is for those, who want to be aggresive.', 'Choose specialization.', 'Take the armor!', NULL, 'Path of Arms and Fury!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 22411, 16733, 11926, 18380, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(91001, 1, 1941, -1, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90002, 0, 91000, 0, 0, 0, 0, 'Path of Protection', 'The Path of Protection is for those, who want to be defensive.', 'Choose specialization.', 'Take the armor!', NULL, 'Path of Protection!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11746, 13405, 13394, 22328, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(91002, 1, 1941, -1, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 91000, 0, 0, 0, 0, 0, 0, 'Next pieces of armor', 'More items...', 'Collect next pieces of armor.', 'Take the armor!', NULL, 'Armor taken!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13400, 12637, 13959, 22270, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(91003, 1, 1941, -1, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 91001, 0, 0, 0, 0, 0, 0, 'Next pieces of armor', 'More items...', 'Collect next pieces of armor.', 'Take the armor!', NULL, 'Armor taken!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18754, 18383, 11703, 20710, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(91004, 1, 1941, -1, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 91002, 0, 0, 0, 0, 0, 0, 'Take some steel with you', 'More items...', 'Collect weapons.', 'Take the weapons!', NULL, 'Weapons taken!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15806, 18520, 0, 0, 0, 0, 2, 1, 0, 0, 0, 0, 18738, 18042, 0, 0, 1, 200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(91005, 1, 1941, -1, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 91003, 0, 0, 0, 0, 0, 0, 'Take some steel with you', 'More items...', 'Collect weapons.', 'Take the weapons!', NULL, 'Weapons taken!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18376, 18499, 18738, 18042, 1, 1, 1, 200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(92000, 1, 1941, -4, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90002, 0, 0, 0, 0, 0, 0, 'Into the shadows', 'Stab and chop and hide and run!', 'Get prepared to go to Outland.', 'Take the armor!', NULL, 'Let the adventure begin!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13404, 16708, 12603, 16709, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(92001, 1, 1941, -4, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 92000, 0, 0, 0, 0, 0, 0, 'Next pieces of armor', 'More items...', 'Collect next pieces of armor.', 'Take the armor!', NULL, 'Armor taken!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18375, 13395, 14636, 13210, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(92002, 1, 1941, -4, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 92001, 0, 0, 0, 0, 0, 0, 'Take some steel with you', 'More items...', 'Collect weapons.', 'Take the weapons!', NULL, 'Weapons taken!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18484, 12651, 18042, 0, 2, 1, 200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(93000, 1, 1941, -8, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90002, 0, 0, 0, 0, 0, 0, 'The hunger of magic', 'Freeze and burn and blink and blaze!', 'Get prepared to go to Outland.', 'Take the armor!', NULL, 'Let the adventure begin!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18727, 22412, 11924, 13170, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(93001, 1, 1941, -8, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 93000, 0, 0, 0, 0, 0, 0, 'Next pieces of armor', 'More items...', 'Collect next pieces of armor.', 'Take the armor!', NULL, 'Armor taken!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12626, 22256, 11662, 11822, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(93002, 1, 1941, -8, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 93001, 0, 0, 0, 0, 0, 0, 'Take some steel with you', 'More items...', 'Collect weapons.', 'Take the weapons!', NULL, 'Weapons taken!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13964, 22329, 22408, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(94000, 1, 1941, -9, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90002, 0, 0, 0, 0, 0, 0, 'Demons from my closet', 'Summon and annihilate and curse and drain!', 'Get prepared to go to Outland.', 'Take the armor!', NULL, 'Let the adventure begin!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18727, 22412, 11924, 13170, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(94001, 1, 1941, -9, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 94000, 0, 0, 0, 0, 0, 0, 'Next pieces of armor', 'More items...', 'Collect next pieces of armor.', 'Take the armor!', NULL, 'Armor taken!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12626, 22256, 11662, 11822, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(94002, 1, 1941, -9, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 94001, 0, 0, 0, 0, 0, 0, 'Take some steel with you', 'More items...', 'Collect weapons.', 'Take the weapons!', NULL, 'Weapons taken!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13964, 22329, 22408, 22243, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(95000, 1, 1941, -11, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90002, 0, 95000, 0, 0, 0, 0, 'Path of Restoration', 'The Path of Restoration is for those, who want to heal wounds.', 'Choose specialization.', 'Take the armor!', NULL, 'The Path of Restoration!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18490, 22405, 13346, 11841, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(95001, 1, 1941, -11, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90002, 0, 95000, 0, 0, 0, 0, 'Path of Balance', 'The Path of Balance is for those, who want to unleash fury of the stars upon their foes.', 'Choose specialization.', 'Take the armor!', NULL, 'The Path of Balance!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 22407, 22412, 22409, 11823, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(95002, 1, 1941, -11, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90002, 0, 95000, 0, 0, 0, 0, 'Path of Feral Combat', 'The Path of Feral Combat is for those, who want to combine the power of the cat and bear to ravage their enemies.', 'Choose specialization.', 'Take the armor!', NULL, 'The Path of Feral Combat!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11735, 16708, 13944, 14638, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(95003, 1, 1941, -11, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 95000, 0, 0, 0, 0, 0, 0, 'Next pieces of armor', 'More items...', 'Collect next pieces of armor.', 'Take the armor!', NULL, 'Armor taken!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23129, 12554, 18327, 22275, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(95004, 1, 1941, -11, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 95001, 0, 0, 0, 0, 0, 0, 'Next pieces of armor', 'More items...', 'Collect next pieces of armor.', 'Take the armor!', NULL, 'Armor taken!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12626, 22256, 11662, 11822, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(95005, 1, 1941, -11, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 95002, 0, 0, 0, 0, 0, 0, 'Next pieces of armor', 'More items...', 'Collect next pieces of armor.', 'Take the armor!', NULL, 'Armor taken!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18375, 13395, 11686, 14641, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(95006, 1, 1941, -11, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 95003, 0, 0, 0, 0, 0, 0, 'Take some steel with you', 'More items...', 'Collect weapons.', 'Take the weapons!', NULL, 'Weapons taken!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 22380, 18523, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(95007, 1, 1941, -11, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 95004, 0, 0, 0, 0, 0, 0, 'Take some steel with you', 'More items...', 'Collect weapons.', 'Take the weapons!', NULL, 'Weapons taken!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13964, 22329, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(95008, 1, 1941, -11, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 95005, 0, 0, 0, 0, 0, 0, 'Take some steel with you', 'More items...', 'Collect weapons.', 'Take the weapons!', NULL, 'Weapons taken!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 22348, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(96000, 1, 1941, -5, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90002, 0, 96000, 0, 0, 0, 0, 'Path of Holy', 'The Path of Holy is chosen by those, who want to heal and follow discipline.', 'Choose specialization.', 'Take the armor!', NULL, 'The Path of Holy!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12604, 22405, 13346, 11841, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(96001, 1, 1941, -5, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90002, 0, 96000, 0, 0, 0, 0, 'Path of Shadow', 'The Path of Shadow is chosen by those, who want to destroy and blaspheme.', 'Choose specialization.', 'Take the armor!', NULL, 'The Path of Shadow!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18727, 22412, 11924, 13170, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(96002, 1, 1941, -5, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 96000, 0, 0, 0, 0, 0, 0, 'Next pieces of armor', 'More items...', 'Collect next pieces of armor.', 'Take the armor!', NULL, 'Armor taken!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23129, 12554, 18327, 22275, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(96003, 1, 1941, -5, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 96001, 0, 0, 0, 0, 0, 0, 'Next pieces of armor', 'More items...', 'Collect next pieces of armor.', 'Take the armor!', NULL, 'Armor taken!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12626, 22256, 11662, 11822, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(96004, 1, 1941, -5, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 96002, 0, 0, 0, 0, 0, 0, 'Take some steel with you', 'More items...', 'Collect weapons.', 'Take the weapons!', NULL, 'Weapons taken!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 22380, 18523, 22254, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(96005, 1, 1941, -5, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 96003, 0, 0, 0, 0, 0, 0, 'Take some steel with you', 'More items...', 'Collect weapons.', 'Take the weapons!', NULL, 'Weapons taken!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13349, 22329, 22408, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(97000, 1, 1941, -3, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90002, 0, 0, 0, 0, 0, 0, 'The beast within you', 'Tame and aim and track and shoot!', 'Get prepared to go to Outland.', 'Take the armor!', NULL, 'Let the adventure begin!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13359, 22016, 18530, 18524, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(97001, 1, 1941, -3, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 97000, 0, 0, 0, 0, 0, 0, 'Next pieces of armor', 'More items...', 'Collect next pieces of armor.', 'Take the armor!', NULL, 'Armor taken!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13211, 11730, 22207, 11731, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(97002, 1, 1941, -3, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 97001, 0, 0, 0, 0, 0, 0, 'Take some steel with you', 'More items...', 'Collect weapons.', 'Take the weapons!', NULL, 'Weapons taken!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18759, 12651, 3605, 19316, 1, 1, 1, 200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(97003, 1, 1941, -3, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 97002, 0, 0, 0, 0, 0, 0, 'Take some more arrows', 'You may need them...', 'Collect arrows.', 'Take the arrows!', NULL, 'Arrows taken!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19316, 19316, 19316, 19316, 200, 200, 200, 200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(98000, 1, 1941, -2, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90002, 0, 98000, 0, 0, 0, 0, 'Path of Protection', 'The Path of Protection is for those, who want to protect.', 'Choose specialization.', 'Take the armor!', NULL, 'The Path of Protection!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11746, 13405, 13394, 22328, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(98001, 1, 1941, -2, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90002, 0, 98000, 0, 0, 0, 0, 'Path of Retribution', 'The Path of Retribution is for those, who want to strike their enemies with a great holy hammer, axe, sword or polearm.', 'Choose specialization.', 'Take the armor!', NULL, 'The Path of Retribution!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 22411, 16733, 11926, 18380, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(98002, 1, 1941, -2, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90002, 0, 98000, 0, 0, 0, 0, 'Path of Holy', 'The Path of Holy is for those, who want to heal their allies with holy power.', 'Choose specialization.', 'Take the armor!', NULL, 'The Path of Holy!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12960, 11722, 22272, 18386, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(98003, 1, 1941, -2, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 98000, 0, 0, 0, 0, 0, 0, 'Next pieces of armor', 'More items...', 'Collect next pieces of armor.', 'Take the armor!', NULL, 'Armor taken!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18754, 18383, 11703, 20710, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(98004, 1, 1941, -2, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 98001, 0, 0, 0, 0, 0, 0, 'Next pieces of armor', 'More items...', 'Collect next pieces of armor.', 'Take the armor!', NULL, 'Armor taken!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13400, 12637, 13959, 22270, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(98005, 1, 1941, -2, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 98002, 0, 0, 0, 0, 0, 0, 'Next pieces of armor', 'More items...', 'Collect next pieces of armor.', 'Take the armor!', NULL, 'Armor taken!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13969, 18527, 11783, 20265, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(98006, 1, 1941, -2, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 98003, 0, 0, 0, 0, 0, 0, 'Take some steel with you', 'More items...', 'Collect weapons.', 'Take the weapons!', NULL, 'Weapons taken!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18376, 18499, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(98007, 1, 1941, -2, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 98004, 0, 0, 0, 0, 0, 0, 'Take some steel with you', 'More items...', 'Collect weapons.', 'Take the weapons!', NULL, 'Weapons taken!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18520, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(98008, 1, 1941, -2, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 98005, 0, 0, 0, 0, 0, 0, 'Take some steel with you', 'More items...', 'Collect weapons.', 'Take the weapons!', NULL, 'Weapons taken!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11923, 22336, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(99000, 1, 1941, -7, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90002, 0, 99000, 0, 0, 0, 0, 'Path of Enhancement', 'The Path of Enhancement is for those, who want to fight with melee weapons.', 'Choose specialization.', 'Take the armor!', NULL, 'The Path of Enhancement!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13359, 18686, 11926, 12964, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(99001, 1, 1941, -7, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90002, 0, 99000, 0, 0, 0, 0, 'Path of Elements', 'The Path of Elements is for those, who want to strike their enemies with powers of the elements.', 'Choose specialization.', 'Take the armor!', NULL, 'The Path of Elements!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18807, 11842, 22409, 18378, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(99002, 1, 1941, -7, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90002, 0, 99000, 0, 0, 0, 0, 'Path of Restoration', 'The Path of Restoration is for those, who want to heal their allies with the powers of nature.', 'Choose specialization.', 'Take the armor!', NULL, 'The Path of Restoration!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12960, 11722, 22272, 18386, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(99003, 1, 1941, -7, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 99000, 0, 0, 0, 0, 0, 0, 'Next pieces of armor', 'More items...', 'Collect next pieces of armor.', 'Take the armor!', NULL, 'Armor taken!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13211, 11730, 22207, 11731, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(99004, 1, 1941, -7, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 99001, 0, 0, 0, 0, 0, 0, 'Next pieces of armor', 'More items...', 'Collect next pieces of armor.', 'Take the armor!', NULL, 'Armor taken!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 22095, 13344, 18721, 11822, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(99005, 1, 1941, -7, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 99002, 0, 0, 0, 0, 0, 0, 'Next pieces of armor', 'More items...', 'Collect next pieces of armor.', 'Take the armor!', NULL, 'Armor taken!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13969, 18527, 11783, 18318, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(99006, 1, 1941, -7, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 99003, 0, 0, 0, 0, 0, 0, 'Take some steel with you', 'More items...', 'Collect weapons.', 'Take the weapons!', NULL, 'Weapons taken!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18376, 18683, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(99007, 1, 1941, -7, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 99004, 0, 0, 0, 0, 0, 0, 'Take some steel with you', 'More items...', 'Collect weapons.', 'Take the weapons!', NULL, 'Weapons taken!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11923, 22336, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(99008, 1, 1941, -7, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 99005, 0, 0, 0, 0, 0, 0, 'Take some steel with you', 'More items...', 'Collect weapons.', 'Take the weapons!', NULL, 'Weapons taken!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11923, 22336, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(99009, 1, 1941, -7, 60, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90002, 0, 0, 0, 0, 0, 0, 'Magic pieces of wood', 'You will need the totems, to be able to fight what awaits you behind the Dark Portal.', 'Collect totems..', 'Use them wisely.', NULL, 'Totems collected!', '', NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5175, 5176, 5177, 5178, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(99900, 1, 1941, 0, 60, 60, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90002, 0, 0, 0, 0, 0, 0, 'Need something to ride!', 'You definately need something to ride. Take this brave steed to assist your travel through Outland!', 'Collect mount.', 'This is a mount for you.', NULL, 'Ride the mount!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5656, 20031, 0, 0, 1, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(99901, 1, 1941, 0, 60, 60, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90002, 0, 0, 0, 0, 0, 0, 'Need something to ride!', 'You definately need something to ride. Take this brave steed to assist your travel through Outland!', 'Collect mount.', 'This is a mount for you.', NULL, 'Ride the mount!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5668, 20031, 0, 0, 1, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(99902, 1, 1941, 0, 60, 60, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90002, 0, 0, 0, 0, 0, 0, 'Need something to ride!', 'You definately need something to ride. Take this brave steed to assist your travel through Outland!', 'Collect mount.', 'This is a mount for you.', NULL, 'Ride the mount!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5872, 20031, 0, 0, 1, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(99903, 1, 1941, 0, 60, 60, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90002, 0, 0, 0, 0, 0, 0, 'Need something to ride!', 'You definately need something to ride. Take this brave steed to assist your travel through Outland!', 'Collect mount.', 'This is a mount for you.', NULL, 'Ride the mount!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8629, 20031, 0, 0, 1, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(99904, 1, 1941, 0, 60, 60, 0, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90002, 0, 0, 0, 0, 0, 0, 'Need something to ride!', 'You definately need something to ride. Take this brave steed to assist your travel through Outland!', 'Collect mount.', 'This is a mount for you.', NULL, 'Ride the mount!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13333, 20031, 0, 0, 1, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(99905, 1, 1941, 0, 60, 60, 0, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90002, 0, 0, 0, 0, 0, 0, 'Need something to ride!', 'You definately need something to ride. Take this brave steed to assist your travel through Outland!', 'Collect mount.', 'This is a mount for you.', NULL, 'Ride the mount!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15290, 20031, 0, 0, 1, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(99906, 1, 1941, 0, 60, 60, 0, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90002, 0, 0, 0, 0, 0, 0, 'Need something to ride!', 'You definately need something to ride. Take this brave steed to assist your travel through Outland!', 'Collect mount.', 'This is a mount for you.', NULL, 'Ride the mount!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13322, 20031, 0, 0, 1, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(99907, 1, 1941, 0, 60, 60, 0, 128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90002, 0, 0, 0, 0, 0, 0, 'Need something to ride!', 'You definately need something to ride. Take this brave steed to assist your travel through Outland!', 'Collect mount.', 'This is a mount for you.', NULL, 'Ride the mount!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8588, 20031, 0, 0, 1, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(99908, 1, 1941, 0, 60, 60, 0, 512, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90002, 0, 0, 0, 0, 0, 0, 'Need something to ride!', 'You definately need something to ride. Take this brave steed to assist your travel through Outland!', 'Collect mount.', 'This is a mount for you.', NULL, 'Ride the mount!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 29221, 20031, 0, 0, 1, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(99909, 1, 1941, 0, 60, 60, 0, 1024, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90002, 0, 0, 0, 0, 0, 0, 'Need something to ride!', 'You definately need something to ride. Take this brave steed to assist your travel through Outland!\n\nYou will definately need something to eat, too.', 'Collect mount.', 'This is a mount for you.', NULL, 'Ride the mount!', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 28481, 20031, 0, 0, 1, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

UPDATE `creature_template` SET `scale` = '1.5', `ScriptName` = 'npc_journey_headmaster' WHERE `creature_template`.`entry` = 90000;
UPDATE `creature_template` SET `scale` = '1.5', `ScriptName` = 'npc_journey_quartermaster' WHERE `creature_template`.`entry` = 90001;

UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 23852;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 22411;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 11926;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 18380;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 11746;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 13405;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 13394;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 22328;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 13400;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 12637;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 13959;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 22270;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 18754;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 18383;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 11703;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 20710;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 18738;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 18376;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 18499;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 13404;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 16708;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 12603;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 16709;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 18375;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 13395;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 14636;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 13210;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 18484;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 12651;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 18727;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 22412;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 11924;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 13170;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 12626;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 22256;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 11662;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 11822;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 13964;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 22329;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 22408;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 22243;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 18490;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 22405;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 13346;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 11841;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 22407;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 22409;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 11823;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 11735;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 12554;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 18327;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 22275;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 11686;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 14641;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 18523;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 22348;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 12604;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 22254;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 13349;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 13359;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 22016;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 18530;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 18524;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 13211;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 11730;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 22207;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 11731;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 18759;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 3605;
UPDATE `item_template` SET `BuyPrice` = '0', `SellPrice` = '0' WHERE `item_template`.`entry` = 19316;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 12960;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 11722;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 22272;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 18386;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 13969;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 18527;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 11783;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 20265;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 18520;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 11923;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 22336;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 18686;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 12964;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 18807;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 11842;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 18378;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 22095;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 13344;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 18721;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 18318;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 18683;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 15806;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 18375;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 13944;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 16733;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 23129;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 22247;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 22380;
UPDATE `item_template` SET `BuyPrice` = '1', `SellPrice` = '1' WHERE `item_template`.`entry` = 14638;
   
UPDATE `quest_template` SET `RewItemId2` = '19316' WHERE `quest_template`.`entry` = 91004;
UPDATE `quest_template` SET `RewItemId4` = '19316' WHERE `quest_template`.`entry` = 91005;
UPDATE `quest_template` SET `RewItemId3` = '19316' WHERE `quest_template`.`entry` = 92002;
UPDATE `quest_template` SET `RewItemId4` = '22247' WHERE `quest_template`.`entry` = 96002;
UPDATE `quest_template` SET `RewItemId4` = '5140', `RewItemCount4` = '5' WHERE `quest_template`.`entry` = 92002;

DELETE FROM `creature` WHERE `creature`.`id` = 90000;
DELETE FROM `creature` WHERE `creature`.`id` = 90001;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(NULL, 90000, 1, 1, 0, 0, 10325.6, 837.986, 1326.35, 4.30621, 300, 0, 0, 1337, 1337, 0, 0),
(NULL, 90000, 530, 1, 0, 0, -3963.3, -13910.4, 100.429, 3.17355, 300, 0, 0, 1337, 1337, 0, 0),
(NULL, 90000, 0, 1, 0, 0, 1656.52, 1682.24, 120.719, 6.27843, 300, 0, 0, 1337, 1337, 0, 0),
(NULL, 90000, 1, 1, 0, 0, -2907.65, -266.377, 53.2495, 1.17643, 300, 0, 0, 1337, 1337, 0, 0),
(NULL, 90000, 0, 1, 0, 0, -6229.56, 348.376, 383.868, 4.76975, 300, 0, 0, 1337, 1337, 0, 0),
(NULL, 90000, 530, 1, 0, 0, 10360.4, -6366.82, 35.8027, 2.32186, 300, 0, 0, 1337, 1337, 0, 0),
(NULL, 90000, 0, 1, 0, 0, -8926.46, -140.879, 81.5718, 2.66456, 300, 0, 0, 1337, 1337, 0, 0),
(NULL, 90000, 1, 1, 0, 0, -600.502, -4246.47, 38.9562, 2.59293, 300, 0, 0, 1337, 1337, 0, 0),
(NULL, 90001, 1, 1, 0, 0, 10321.2, 839.903, 1326.47, 4.36118, 300, 0, 0, 1337, 1337, 0, 0),
(NULL, 90001, 530, 1, 0, 0, -3963.82, -13906.1, 99.7494, 3.33849, 300, 0, 0, 1337, 1337, 0, 0),
(NULL, 90001, 0, 1, 0, 0, -6233.85, 348.163, 383.955, 4.73362, 300, 0, 0, 1337, 1337, 0, 0),
(NULL, 90001, 530, 1, 0, 0, 10362.9, -6363.43, 35.0979, 2.37291, 300, 0, 0, 1337, 1337, 0, 0),
(NULL, 90001, 0, 1, 0, 0, -8924.54, -136.194, 81.1246, 2.69991, 300, 0, 0, 1337, 1337, 0, 0),
(NULL, 90001, 0, 1, 0, 0, 1656.5, 1686.99, 120.719, 6.2392, 300, 0, 0, 1337, 1337, 0, 0),
(NULL, 90001, 1, 1, 0, 0, -597.039, -4243.3, 38.9563, 2.75394, 300, 0, 0, 1337, 1337, 0, 0),
(NULL, 90001, 1, 1, 0, 0, -2902.57, -267.318, 53.2704, 1.65125, 300, 0, 0, 1337, 1337, 0, 0);

UPDATE `creature_template` SET `npcflag` = '131' WHERE `creature_template`.`entry` = 90001; -- 90001 is now vendor too

INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES ('90001', '16320', '0', '0', '0'), ('90001', '16325', '0', '0', '0'), ('90001', '16331', '0', '0', '0'), ('90001', '16330', '0', '0', '0'), ('90001', '16350', '0', '0', '0'), ('90001', '16356', '0', '0', '0'), ('90001', '16362', '0', '0', '0'), ('90001', '16366', '0', '0', '0'), ('90001', '16374', '0', '0', '0'), ('90001', '16378', '0', '0', '0'), ('90001', '16379', '0', '0', '0'), ('90001', '16380', '0', '0', '0'), ('90001', '16383', '0', '0', '0'), ('90001', '16387', '0', '0', '0'), ('90001', '16389', '0', '0', '0'), ('90001', '16390', '0', '0', '0'), ('90001', '23745', '0', '0', '0'), ('90001', '28072', '0', '0', '0'), ('90001', '23711', '0', '0', '0'), ('90001', '25900', '0', '0', '0'), ('90001', '25469', '0', '0', '0');

-- Instant 60 Feature - Grimoires cost = 1
UPDATE `item_template` SET `BuyPrice` = '0', `SellPrice` = '0' WHERE `item_template`.`entry` = 16320;
UPDATE `item_template` SET `BuyPrice` = '0', `SellPrice` = '0' WHERE `item_template`.`entry` = 16325;
UPDATE `item_template` SET `BuyPrice` = '0', `SellPrice` = '0' WHERE `item_template`.`entry` = 16331;
UPDATE `item_template` SET `BuyPrice` = '0', `SellPrice` = '0' WHERE `item_template`.`entry` = 16330;
UPDATE `item_template` SET `BuyPrice` = '0', `SellPrice` = '0' WHERE `item_template`.`entry` = 16350;
UPDATE `item_template` SET `BuyPrice` = '0', `SellPrice` = '0' WHERE `item_template`.`entry` = 16356;
UPDATE `item_template` SET `BuyPrice` = '0', `SellPrice` = '0' WHERE `item_template`.`entry` = 16362;
UPDATE `item_template` SET `BuyPrice` = '0', `SellPrice` = '0' WHERE `item_template`.`entry` = 16366;
UPDATE `item_template` SET `BuyPrice` = '0', `SellPrice` = '0' WHERE `item_template`.`entry` = 16374;
UPDATE `item_template` SET `BuyPrice` = '0', `SellPrice` = '0' WHERE `item_template`.`entry` = 16378;
UPDATE `item_template` SET `BuyPrice` = '0', `SellPrice` = '0' WHERE `item_template`.`entry` = 16379;
UPDATE `item_template` SET `BuyPrice` = '0', `SellPrice` = '0' WHERE `item_template`.`entry` = 16380;
UPDATE `item_template` SET `BuyPrice` = '0', `SellPrice` = '0' WHERE `item_template`.`entry` = 16383;
UPDATE `item_template` SET `BuyPrice` = '0', `SellPrice` = '0' WHERE `item_template`.`entry` = 16387;
UPDATE `item_template` SET `BuyPrice` = '0', `SellPrice` = '0' WHERE `item_template`.`entry` = 16389;
UPDATE `item_template` SET `BuyPrice` = '0', `SellPrice` = '0' WHERE `item_template`.`entry` = 16390;
UPDATE `item_template` SET `BuyPrice` = '0', `SellPrice` = '0' WHERE `item_template`.`entry` = 23745;
UPDATE `item_template` SET `BuyPrice` = '0', `SellPrice` = '0' WHERE `item_template`.`entry` = 28072;
UPDATE `item_template` SET `BuyPrice` = '0', `SellPrice` = '0' WHERE `item_template`.`entry` = 23711;
UPDATE `item_template` SET `BuyPrice` = '0', `SellPrice` = '0' WHERE `item_template`.`entry` = 25900;
UPDATE `item_template` SET `BuyPrice` = '0', `SellPrice` = '0' WHERE `item_template`.`entry` = 25469;
