DELETE FROM `creature_addon` WHERE `creature_addon`.`guid` = 23467;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes0`, `bytes1`, `bytes2`, `emote`, `moveflags`, `auras`) VALUES
(23467, 514, 0, 16843008, 131072, 4097, 0, 0, '30831 0');

DELETE FROM `creature` WHERE `creature`.`guid` = 23467;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(23467, 5615, 1, 1, 5572, 193, -7633.77, -4473.08, 9.89368, 5.18744, 300, 15, 0, 2100, 1253, 0, 2);

UPDATE `creature` SET `spawntimesecs` = '300' WHERE `creature`.`guid` = 92063; 
UPDATE `creature` SET `spawntimesecs` = '300' WHERE `creature`.`guid` = 92413; 