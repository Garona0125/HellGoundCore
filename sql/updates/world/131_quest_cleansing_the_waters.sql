UPDATE `creature_template` SET `ScriptName` = 'npc_aggonis' WHERE `creature_template`.`entry` = 17000;

DELETE FROM `script_texts` WHERE `script_texts`.`entry` = -1000007;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
(-1000007, 'Fools!  You seek to abjure my father\'s presence?  Death awaits you, mortals!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 'Aggonis to Player');