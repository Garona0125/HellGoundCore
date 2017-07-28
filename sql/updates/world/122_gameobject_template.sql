UPDATE `gameobject_template` SET `ScriptName`='go_arcanocontroller' WHERE  `entry`=185010;
UPDATE `gameobject_template` SET `ScriptName`='go_arcanocontroller' WHERE  `entry`=185009;
UPDATE `gameobject_template` SET `ScriptName`='go_arcanocontroller' WHERE  `entry`=185008;

UPDATE `creature_template` SET `spell1` = '37918', `spell2` = '37919', `spell3` = '37851' WHERE `creature_template`.`entry` = 21909; 

DELETE FROM `spell_script_target` WHERE `spell_script_target`.`entry` = 37918;
DELETE FROM `spell_script_target` WHERE `spell_script_target`.`entry` = 37919;
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES ('37918', '1', '21909'); 
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES ('37919', '1', '21909'); 

DELETE FROM `creature` WHERE `creature`.`id` = 21924;
DELETE FROM `creature` WHERE `creature`.`id` = 21909;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(NULL, 21909, 530, 1, 0, 0, -3409.24, 821.119, -31.3089, 3.08733, 300, 0, 0, 2800, 0, 0, 0),
(NULL, 21909, 530, 1, 0, 0, -3409.08, 806.668, -31.1008, 3.08733, 300, 0, 0, 2800, 0, 0, 0),
(NULL, 21909, 530, 1, 0, 0, -3409.52, 792.183, -31.489, 3.08733, 300, 0, 0, 2800, 0, 0, 0);
 
UPDATE `creature_template` SET `ScriptName` = 'npc_greater_felfire' WHERE `creature_template`.`entry` = 21462;

DELETE FROM `spell_cooldown` WHERE `spell_cooldown`.`spellid` = 37918;
DELETE FROM `spell_cooldown` WHERE `spell_cooldown`.`spellid` = 37919;
DELETE FROM `spell_cooldown` WHERE `spell_cooldown`.`spellid` = 37851;
INSERT INTO `spell_cooldown` (`spellid`, `cooldown`, `comment`) VALUES ('37918', '3000', 'Arcano-Scorp - Arcano-pince'); 
INSERT INTO `spell_cooldown` (`spellid`, `cooldown`, `comment`) VALUES ('37919', '3000', 'Arcano-Scorp - Arcano-dismantle'); 
INSERT INTO `spell_cooldown` (`spellid`, `cooldown`, `comment`) VALUES ('37851', '5000', 'Arcano-Scorp - Tag Greater Felfire Diemetradon'); 