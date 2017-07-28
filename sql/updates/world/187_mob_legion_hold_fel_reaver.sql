DELETE FROM `spell_script_target` WHERE `spell_script_target`.`entry` = 36804;
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES ('36804', '1', '21404'); 

UPDATE `creature_template` SET `ScriptName` = 'npc_invis_legion_hold_caster' WHERE `creature_template`.`entry` = 21403;
UPDATE `creature_template` SET `flags_extra` = '2', `ScriptName` = 'mob_legion_hold_fel_reaver' WHERE `creature_template`.`entry` = 21404; 