UPDATE `creature_template` SET `ScriptName` = 'npc_lieutenant_general_orion' WHERE `creature_template`.`entry` = 19253;
UPDATE `creature_template` SET `ScriptName` = 'npc_commander_duron' WHERE `creature_template`.`entry` = 19229;

-- Corrections for commander duron and lieutenant orion npc assits
UPDATE `creature_template` SET `unit_flags` = '768' WHERE `creature_template`.`entry` = 16831;
UPDATE `creature_template` SET `unit_flags` = '768' WHERE `creature_template`.`entry` = 16580;
UPDATE `creature_template` SET `unit_flags` = '768' WHERE `creature_template`.`entry` = 16582;