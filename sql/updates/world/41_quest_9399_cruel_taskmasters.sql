DELETE FROM `creature_template` WHERE `creature_template`.`entry` = 30000;
INSERT INTO `creature_template` (`entry`, `heroic_entry`, `KillCredit`, `modelid_A`, `modelid_A2`, `modelid_H`, `modelid_H2`, `name`, `subname`, `IconName`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `xp_modifier`, `faction_A`, `faction_H`, `npcflag`, `speed`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `baseattacktime`, `rangeattacktime`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `class`, `race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `RacialLeader`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES
(30000, 0, NULL, 16480, 0, 21072, 0, 'PlayTBC - Quest 9399 Trigger', '', '', 1, 1, 1, 1, 0, 0, 0, 1, 35, 35, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, '', 0, 1, 0, 1, 0, 0, 128, '');

UPDATE `creature_template` SET `ScriptName` = 'npc_dreghood_geomancer' WHERE `creature_template`.`entry` = 16937; 
UPDATE `creature_template` SET `ScriptName` = 'npc_dreghood_brute' WHERE `creature_template`.`entry` = 16938;
UPDATE `creature_template` SET `ScriptName` = 'npc_illidari_taskmaster' WHERE `creature_template`.`entry` = 17058;

DELETE FROM `creature_ai_scripts` WHERE `creature_ai_scripts`.`entryOrGUID` = 16937;
DELETE FROM `creature_ai_scripts` WHERE `creature_ai_scripts`.`entryOrGUID` = 16938;

DELETE FROM `creature` WHERE `creature`.`id` = 19477;
DELETE FROM `creature` WHERE `creature`.`id` = 30000;

INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(NULL, 30000, 530, 1, 0, 0, -529.613, 4801.46, 33.3968, 3.1503, 300, 0, 0, 1, 0, 0, 0),
(NULL, 30000, 530, 1, 0, 0, -609.145, 4801.16, 37.913, 3.11417, 300, 0, 0, 1, 0, 0, 0),
(NULL, 30000, 530, 1, 0, 0, -671.302, 4798.13, 49.2937, 3.11595, 300, 0, 0, 1, 0, 0, 0),
(NULL, 30000, 530, 1, 0, 0, -478.306, 4903.73, 37.4631, 3.91135, 300, 0, 0, 1, 0, 0, 0),
(NULL, 30000, 530, 1, 0, 0, -422.823, 4713.28, 25.9511, 3.40869, 300, 0, 0, 1, 0, 0, 0),
(NULL, 30000, 530, 1, 0, 0, -409.089, 4872.96, 26.2605, 3.31681, 300, 0, 0, 1, 0, 0, 0),
(NULL, 30000, 530, 1, 0, 0, -443.921, 4792.04, 21.167, 3.13066, 300, 0, 0, 1, 0, 0, 0),
(NULL, 30000, 530, 1, 0, 0, -565.443, 4719.18, 39.1382, 4.85775, 300, 0, 0, 1, 0, 0, 0),
(NULL, 30000, 530, 1, 0, 0, -531.425, 4922.88, 39.5125, 1.62191, 300, 0, 0, 1, 0, 0, 0),
(NULL, 30000, 530, 1, 0, 0, -492.572, 4684.74, 33.2579, 4.26714, 300, 0, 0, 1, 0, 0, 0);