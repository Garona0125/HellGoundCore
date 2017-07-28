DELETE FROM `creature_template_addon` WHERE `creature_template_addon`.`entry` = 18035;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes0`, `bytes1`, `bytes2`, `emote`, `moveflags`, `auras`) VALUES
(18035, 0, 0, 16777472, 7, 4097, 65, 0, '29266 0 29266 1');

UPDATE `creature_template` SET `dynamicflags` = '32' WHERE `creature_template`.`entry` = 18035;