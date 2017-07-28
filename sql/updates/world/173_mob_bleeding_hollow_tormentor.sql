DELETE FROM `creature_ai_scripts` WHERE `creature_ai_scripts`.`entryOrGUID` = 19424;
UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'mob_bleeding_hollow_tormentor' WHERE `creature_template`.`entry` = 19424;

DELETE FROM `script_texts` WHERE `script_texts`.`entry` = -1000008;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
('-1000008', 'attempts to run away in fear!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', '2', '0', '0', 'Common Text'); 