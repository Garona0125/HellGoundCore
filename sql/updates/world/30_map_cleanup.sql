/* delete objects, creatures of test & developer locations */

DELETE FROM `creature` WHERE `creature`.`map` = 13; -- TEST map
DELETE FROM `gameobject` WHERE `gameobject`.`map` = 13; -- TEST map
DELETE FROM `creature` WHERE `creature`.`map` = 451; -- Developers map
DELETE FROM `gameobject` WHERE `gameobject`.`map` = 451; -- Developers map

DELETE FROM `creature_addon` WHERE `creature_addon`.`guid` = 15214;
DELETE FROM `creature_addon` WHERE `creature_addon`.`guid` = 33218;
DELETE FROM `creature_addon` WHERE `creature_addon`.`guid` = 36018;
DELETE FROM `creature_addon` WHERE `creature_addon`.`guid` = 39168;
DELETE FROM `creature_addon` WHERE `creature_addon`.`guid` = 45423;
DELETE FROM `creature_addon` WHERE `creature_addon`.`guid` = 45903;
DELETE FROM `creature_addon` WHERE `creature_addon`.`guid` = 46346;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 320869;