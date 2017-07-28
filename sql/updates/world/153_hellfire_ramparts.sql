-- Corrected language of aggro trash texts
UPDATE `creature_ai_texts` SET `language` = '0' WHERE `creature_ai_texts`.`entry` = -156; -- language correction
UPDATE `creature_ai_texts` SET `language` = '0' WHERE `creature_ai_texts`.`entry` = -181; -- language correction 
UPDATE `creature_ai_texts` SET `language` = '0' WHERE `creature_ai_texts`.`entry` = -672; -- language correction

UPDATE `creature_template` SET `speed` = '1.1' WHERE `creature_template`.`entry` = 17264; -- speed correction
UPDATE `creature_template` SET `speed` = '1.1' WHERE `creature_template`.`entry` = 17280; -- speed correction
 
UPDATE `waypoint_data` SET `delay` = '1000' WHERE `waypoint_data`.`id` = 1411 AND `waypoint_data`.`point` = 6; -- 1 sec stop at 6 point
UPDATE `waypoint_data` SET `delay` = '0' WHERE `waypoint_data`.`id` = 1410 AND `waypoint_data`.`point` = 1;  -- no stop at all

UPDATE `creature` SET `spawndist`=2,`MovementType`=1 WHERE `guid`= 200941; -- random movement