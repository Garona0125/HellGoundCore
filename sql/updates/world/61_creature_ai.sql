DELETE FROM `creature_ai_scripts` WHERE `creature_ai_scripts`.`id` = 1741401;
DELETE FROM `creature_ai_scripts` WHERE `creature_ai_scripts`.`id` = 1741402;

INSERT INTO `creature_ai_scripts` (`id`, `entryOrGUID`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
(1741401, 17414, 0, 0, 100, 3, 2800, 4700, 1400, 23400, 11, 30846, 4, 1, 1, -155, 0, 0, 0, 0, 0, 0, 'Shadowmoon Technician (Normal) - Throw Proximity Bomb'),
(1741402, 17414, 0, 0, 100, 5, 2800, 4700, 17700, 23400, 11, 32784, 4, 1, 1, -155, 0, 0, 0, 0, 0, 0, 'Shadowmoon Technician (Heroic) - Throw Proximity Bomb');

DELETE FROM `creature_ai_texts` WHERE `creature_ai_texts`.`entry` = -155;
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
(-155, '%s begins to arm the Proximity Bomb!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 0, 0, '17414');