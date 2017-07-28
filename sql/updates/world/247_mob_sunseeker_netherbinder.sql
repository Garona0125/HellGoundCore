DELETE FROM `creature_ai_scripts` WHERE `entryOrGUID` = 20059;
UPDATE `creature_template` SET `ScriptName` = 'mob_sunseeker_netherbinder' WHERE `creature_template`.`entry` = 20059;
UPDATE `creature_template` SET `ScriptName` = 'mob_arcane_servant' WHERE `creature_template`.`entry` = 20478;