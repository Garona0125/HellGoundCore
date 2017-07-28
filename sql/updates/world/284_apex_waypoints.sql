DELETE FROM `creature_addon` WHERE `creature_addon`.`guid` = '71046';
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes0`, `bytes1`, `bytes2`, `emote`, `moveflags`, `auras`) VALUES ('71046', '710460', NULL, NULL, NULL, NULL, NULL, NULL, NULL); 

UPDATE `creature` SET `spawndist` = '0', `MovementType` = '2' WHERE `creature`.`guid` = 71046; 

DELETE FROM `waypoint_data` WHERE `waypoint_data`.`id` = '710460';
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(710460, 1, 2863.66, 2591.46, 108.774, 0, 0, 0, 100, 0),
(710460, 2, 2895.66, 2580.6, 117.43, 0, 0, 0, 100, 0),
(710460, 3, 2912.98, 2571.8, 117.759, 0, 0, 0, 100, 0),
(710460, 4, 2919.08, 2568.54, 122.444, 0, 0, 0, 100, 0),
(710460, 5, 2961.7, 2562.74, 124.545, 0, 0, 0, 100, 0),
(710460, 6, 3006.12, 2555.67, 116.328, 0, 0, 0, 100, 0),
(710460, 7, 3050.63, 2538.97, 113.552, 0, 0, 0, 100, 0),
(710460, 8, 3006.12, 2555.67, 116.328, 0, 0, 0, 100, 0),
(710460, 9, 2961.7, 2562.74, 124.545, 0, 0, 0, 100, 0),
(710460, 10, 2919.08, 2568.54, 122.444, 0, 0, 0, 100, 0),
(710460, 11, 2912.98, 2571.8, 117.759, 0, 0, 0, 100, 0),
(710460, 12, 2895.66, 2580.6, 117.43, 0, 0, 0, 100, 0);
