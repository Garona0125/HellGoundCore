UPDATE `quest_template` SET `CompleteScript` = '0' WHERE `quest_template`.`entry` = 10919; 
UPDATE `creature_template` SET `ScriptName` = 'npc_fei_fei' WHERE `creature_template`.`entry` = 20206;

DELETE FROM `quest_end_scripts` WHERE `quest_end_scripts`.`id` = 10919;

DELETE FROM `spell_script_target` WHERE `spell_script_target`.`entry` = 39216;
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES ('39216', '1', '22467'); 