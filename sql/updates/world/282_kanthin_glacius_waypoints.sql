-- Pathing for  Glacius (ID: 19653)
SET @NPC := 70089;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2948.91,`position_y`=2280.35,`position_z`=161.708 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`, `moveflags`, `auras`) VALUES (@NPC,@PATH,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2948.91, 2280.35, 161.708,0,0,0,100,0),
(@PATH,2,2960.25, 2286.11, 161.717,0,0,0,100,0),
(@PATH,3,2968.91, 2290.77, 161.696,0,0,0,100,0),
(@PATH,4,2977.44, 2296.47, 161.706,0,0,0,100,0),
(@PATH,5,2984.3, 2301.52, 161.706,0,0,0,100,0),
(@PATH,6,2990.93, 2297.95, 161.706,0,0,0,100,0),
(@PATH,7,2996.26, 2295.99, 161.706,0,0,0,100,0),
(@PATH,8,3003.49, 2294.72, 161.642,0,0,0,100,0),
(@PATH,9,3009.12, 2293.26, 161.291,0,0,0,100,0),
(@PATH,10,3009.42, 2296.39, 161.387,0,0,0,100,0),
(@PATH,11,3009.26, 2304.12, 161.659,0,0,0,100,0),
(@PATH,12,3009.42, 2296.39, 161.387,0,0,0,100,0),
(@PATH,13,3009.12, 2293.26, 161.291,0,0,0,100,0),
(@PATH,14,3003.49, 2294.72, 161.642,0,0,0,100,0),
(@PATH,15,2996.26, 2295.99, 161.706,0,0,0,100,0),
(@PATH,16,2990.93, 2297.95, 161.706,0,0,0,100,0),
(@PATH,17,2984.3, 2301.52, 161.706,0,0,0,100,0),
(@PATH,18,2977.44, 2296.47, 161.706,0,0,0,100,0),
(@PATH,19,2968.91, 2290.77, 161.696,0,0,0,100,0),
(@PATH,20,2960.25, 2286.11, 161.717,0,0,0,100,0);

-- Pathing for  Summoner Kanthin (ID: 70141)
SET @NPC := 70141;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2952.34,`position_y`=2280.58,`position_z`=161.708 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`, `moveflags`, `auras`) VALUES (@NPC,@PATH,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2952.34, 2280.58, 161.708,0,0,0,100,0),
(@PATH,2,2963.22, 2285.29, 161.715,0,0,0,100,0),
(@PATH,3,2972.13, 2290.53, 161.709,0,0,0,100,0),
(@PATH,4,2981.27, 2296.16, 161.709,0,0,0,100,0),
(@PATH,5,2985.89, 2298.46, 161.709,0,0,0,100,0),
(@PATH,6,2991.7, 2294.17, 161.709,0,0,0,100,0),
(@PATH,7,2998.74, 2293.21, 161.706,0,0,0,100,0),
(@PATH,8,3005.23, 2292.41, 161.537,0,0,0,100,0),
(@PATH,9,3011.54, 2291.28, 160.931,0,0,0,100,0),
(@PATH,10,3012.24, 2298.92, 161.379,0,0,0,100,0),
(@PATH,11,3011.92, 2302.38, 161.554,0,0,0,100,0),
(@PATH,12,3012.24, 2298.92, 161.379,0,0,0,100,0),
(@PATH,13,3011.54, 2291.28, 160.931,0,0,0,100,0),
(@PATH,14,3005.23, 2292.41, 161.537,0,0,0,100,0),
(@PATH,15,2998.74, 2293.21, 161.706,0,0,0,100,0),
(@PATH,16,2991.7, 2294.17, 161.709,0,0,0,100,0),
(@PATH,17,2985.89, 2298.46, 161.709,0,0,0,100,0),
(@PATH,18,2981.27, 2296.16, 161.709,0,0,0,100,0),
(@PATH,19,2972.13, 2290.53, 161.709,0,0,0,100,0),
(@PATH,20,2963.22, 2285.29, 161.715,0,0,0,100,0);