UPDATE `gameobject_template` SET `data0` = '12' WHERE `gameobject_template`.`entry` = 181877;
DELETE FROM `spell_cooldown` WHERE `spell_cooldown`.`spellid` = 30844;
INSERT INTO `spell_cooldown` (`spellid`, `cooldown`, `comment`) VALUES ('30844', '1000', 'Shadowmoon Technician - Proximity Bomb Explode'); 