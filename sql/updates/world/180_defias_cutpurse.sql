DELETE FROM `creature_ai_scripts` WHERE `creature_ai_scripts`.`id` = 9402;
INSERT INTO `creature_ai_scripts` (`id`, `entryOrGUID`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
(9402, 94, 4, 0, 25, 0, 0, 0, 0, 0, 1, -1200, -1201, -1202, 0, 0, 0, 0, 0, 0, 0, 0, 'Defias Cutpurse - Random Yell on Aggro');

DELETE FROM `creature_ai_texts` WHERE `creature_ai_texts`.`entry` = -1200;
DELETE FROM `creature_ai_texts` WHERE `creature_ai_texts`.`entry` = -1201;
DELETE FROM `creature_ai_texts` WHERE `creature_ai_texts`.`entry` = -1202;
INSERT INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
(-1200, 'Give me all your gold!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, '94'),
(-1201, 'No one here gets out alive!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, '94'),
(-1202, 'You\'re in the wrong place at the wrong time, $G pal:missy;!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, '94');

/* Fix selection of character gender  */
UPDATE `creature_ai_texts` SET `content_default` = 'Hey, $G man:lady;? Got some money? I got five kids to feed!' WHERE `creature_ai_texts`.`entry` = -837; 