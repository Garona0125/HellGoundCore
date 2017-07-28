-- Romulo Weapon model
UPDATE `creature_template` SET `equipment_id` = '4002' WHERE `creature_template`.`entry` = 17533;

DELETE FROM `creature_equip_template` WHERE `creature_equip_template`.`entry` = 4002;
INSERT INTO `creature_equip_template` (`entry`, `equipmodel1`, `equipmodel2`, `equipmodel3`, `equipinfo1`, `equipinfo2`, `equipinfo3`, `equipslot1`, `equipslot2`, `equipslot3`) VALUES
(4002, 3213, 2704, 0, 50267138, 50267138, 0, 781, 781, 0); 

-- Julianne Weapon model
UPDATE `creature_template` SET `equipment_id` = '4003' WHERE `creature_template`.`entry` = 17534;

DELETE FROM `creature_equip_template` WHERE `creature_equip_template`.`entry` = 4003;
INSERT INTO `creature_equip_template` (`entry`, `equipmodel1`, `equipmodel2`, `equipmodel3`, `equipinfo1`, `equipinfo2`, `equipinfo3`, `equipslot1`, `equipslot2`, `equipslot3`) VALUES
(4003, 19555, 0, 0, 50267138, 0, 0, 781, 0, 0);

-- Temporary move loot from Romulo to Julianne
UPDATE `creature_template` SET `lootid` = '0' WHERE `creature_template`.`entry` = 17533; 

DELETE FROM `creature_loot_template` WHERE `creature_loot_template`.`entry` = 17533;
DELETE FROM `creature_loot_template` WHERE `creature_loot_template`.`entry` = 17534;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
(17534, 28572, 25, 1, 1, 1, 0, 0, 0),
(17534, 28573, 25, 1, 1, 1, 0, 0, 0),
(17534, 28578, 25, 1, 1, 1, 0, 0, 0),
(17534, 28579, 25, 1, 1, 1, 0, 0, 0),
(17534, 29434, 100, 0, 2, 2, 0, 0, 0),
(17534, 28589, 16.6667, 2, 1, 1, 0, 0, 0),
(17534, 28590, 16.6667, 2, 1, 1, 0, 0, 0),
(17534, 28591, 16.6667, 2, 1, 1, 0, 0, 0),
(17534, 28592, 16.6667, 2, 1, 1, 0, 0, 0),
(17534, 28593, 16.6667, 2, 1, 1, 0, 0, 0),
(17534, 28594, 16.6667, 2, 1, 1, 0, 0, 0);