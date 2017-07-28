-- Pathing for  Dreadcalled (ID: 19434)
SET @NPC := 69503;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-497.6553,`position_y`=2131.211,`position_z`=73.99121 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`, `moveflags`, `auras`) VALUES (@NPC,@PATH,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-497.6553,2131.211,73.99121,0,0,0,0,0),
(@PATH,2,-488.9624,2108.254,78.65967,0,0,0,100,0),
(@PATH,3,-496.4763,2076.188,81.04678,0,0,0,100,0),
(@PATH,4,-505.7693,2051.96,81.88232,0,0,0,100,0),
(@PATH,5,-519.3443,2018.681,82.36652,0,0,0,100,0),
(@PATH,6,-523.7676,2008.236,82.4826,0,0,0,100,0),
(@PATH,7,-523.7537,2008.213,82.43176,0,0,0,100,0),
(@PATH,8,-513.3787,2034.204,82.13114,0,0,0,100,0),
(@PATH,9,-501.0954,2063.943,81.4781,0,0,0,100,0), 
(@PATH,10,-490.7603,2098.129,79.50432,0,0,0,100,0),
(@PATH,11,-495.5728,2124.251,75.16753,0,0,0,100,0),
(@PATH,12,-500.0663,2151.922,70.09659,0,0,0,100,0);


SET @NPC := 69504;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-452.9107,`position_y`=2078.308,`position_z`=92.46893 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`, `moveflags`, `auras`) VALUES (@NPC,@PATH,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-452.9107,2078.308,92.46893,0,0,0,100,0),
(@PATH,2,-458.6161,2106.085,91.27255,0,0,0,100,0),
(@PATH,3,-448.5984,2145.199,87.4944,0,0,0,100,0),
(@PATH,4,-462.8719,2123.792,90.46844,0,0,0,100,0),
(@PATH,5,-453.0257,2091.677,91.79364,0,0,0,100,0),
(@PATH,6,-454.65,2067.857,92.86167,0,0,0,100,0),
(@PATH,7,-471.743,2040.343,93.86674,0,0,0,100,0), 
(@PATH,8,-488.9784,2006.913,90.63859,0,0,0,100,0),
(@PATH,9,-506.4532,1982.409,85.04832,0,0,0,100,0),
(@PATH,10,-491.8763,2002.533,90.20009,0,0,0,100,0),
(@PATH,11,-475.6002,2034.374,93.75784,0,0,0,100,0),
(@PATH,12,-459.1931,2057.171,93.22128,0,0,0,100,0);


SET @NPC := 69499;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-559.7568,`position_y`=2056.154,`position_z`=96.38397 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`, `moveflags`, `auras`) VALUES (@NPC,@PATH,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-570.8387,1985.572,92.55026,0,0,0,100,0),
(@PATH,2,-558.5822,2003.227,98.30606,0,0,0,100,0),
(@PATH,3,-557.4242,2005.145,98.96458,0,0,0,100,0),
(@PATH,4,-559.7556,2056.249,96.38509,0,0,0,100,0),
(@PATH,5,-540.7804,2062.677,104.1211,0,0,0,100,0), 
(@PATH,6,-538.1013,2083.768,102.8957,0,0,0,100,0),
(@PATH,7,-532.1565,2100.455,104.2636,0,0,0,100,0), 
(@PATH,8,-540.6248,2121.428,97.45301,0,0,0,100,0),
(@PATH,9,-542.6255,2139.09,94.2785,0,0,0,100,0),
(@PATH,10,-542.0955,2125.005,96.38588,0,0,0,100,0), 
(@PATH,11,-531.0196,2105.797,103.8728,0,0,0,100,0),
(@PATH,12,-533.3827,2097.108,103.4456,0,0,0,100,0),
(@PATH,13,-539.9424,2066.114,103.8822,0,0,0,100,0),
(@PATH,14,-559.4271,2057.736,96.45336,0,0,0,100,0), 
(@PATH,15,-557.9282,2041.927,98.16533,0,0,0,100,0),
(@PATH,16,-557.3496,2036.365,98.81108,0,0,0,100,0);