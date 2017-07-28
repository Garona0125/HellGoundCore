-- Pathing for  Bimble Longberry (ID: 7978)
SET @NPC := 1768;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-4659.261,`position_y`=-995.3508,`position_z`=501.6378 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`, `moveflags`, `auras`) VALUES (@NPC,@PATH,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-4659.261,-995.3508,501.6378,0,0,0,100,0),
(@PATH,2,-4677.434,-973.3391,501.8968,0,0,0,100,0),
(@PATH,3,-4684.893,-960.5851,501.8922,0,0,0,100,0),
(@PATH,4,-4697.897,-939.4717,501.9109,0,0,0,100,0),
(@PATH,5,-4705.558,-929.8637,501.9129,0,0,0,100,0),
(@PATH,6,-4707.912,-907.4204,501.9085,0,0,0,100,0),
(@PATH,7,-4689.154,-903.1816,501.9113,0,0,0,100,0),
(@PATH,8,-4675.62,-911.438,501.9084,0,0,0,100,0),
(@PATH,9,-4663.188,-923.0353,501.9057,0,0,0,100,0), 
(@PATH,10,-4650.564,-937.4604,501.9083,0,0,0,100,0), 
(@PATH,11,-4629.639,-967.0663,501.9085,0,0,0,100,0),
(@PATH,12,-4618.573,-995.5828,501.9068,0,0,0,100,0),
(@PATH,13,-4622.797,-1007.233,501.9088,0,0,0,100,0), 
(@PATH,14,-4639.608,-1014.383,501.9022,0,0,0,100,0),
(@PATH,15,-4650.747,-1004.798,501.8931,0,0,0,100,0); 