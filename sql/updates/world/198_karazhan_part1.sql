-- Set emote for Spectral Stable Hand
UPDATE `creature_addon` SET `emote` = '69' WHERE `creature_addon`.`guid` = 85085; 

-- Delete one Spectral Stable Hand
DELETE FROM `creature` WHERE `creature`.`guid` = 84981;
DELETE FROM `creature_linked_respawn` WHERE `creature_linked_respawn`.`guid` = 84981;

-- Correct female model for Spectral Stable Hand
UPDATE `creature_model_info` SET `modelid_other_gender` = '16399' WHERE `creature_model_info`.`modelid` = 16397; 
UPDATE `creature_model_info` SET `modelid_other_gender` = '16399' WHERE `creature_model_info`.`modelid` = 16398; 

-- Correct female model for Ghostly Steward
UPDATE `creature_model_info` SET `modelid_other_gender` = '16537' WHERE `creature_model_info`.`modelid` = 16535; 
UPDATE `creature_model_info` SET `modelid_other_gender` = '16538' WHERE `creature_model_info`.`modelid` = 16536; 

-- Correct female model for Phantom Guests
UPDATE `creature_model_info` SET `modelid_other_gender` = '16467' WHERE `creature_model_info`.`modelid` = 16465; 
UPDATE `creature_model_info` SET `modelid_other_gender` = '16466' WHERE `creature_model_info`.`modelid` = 16464; 

-- Correct ID and creature position for Spectral Stable Hand
DELETE FROM `creature` WHERE `creature`.`guid` = 85055;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(85055, 15551, 532, 1, 16399, 523, -11143.2, -1935.59, 49.8911, 0.625177, 300, 0, 0, 33534, 31550, 0, 0);

DELETE FROM `creature` WHERE `creature`.`guid` = 85010;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(85010, 15548, 532, 1, 0, 0, -11140.802734, -1904.609253, 49.8903, 2.84501, 1800, 0, 0, 68656, 0, 0, 2);

UPDATE `creature` SET `id` = '15551', `curhealth` = '33534', `curmana` = '31550' WHERE `creature`.`guid` = 85083;
UPDATE `creature` SET `spawndist`= 0,`MovementType`= 2,`position_x`= -11139.15,`position_y`= -1958.643,`position_z`= 50.13292,`orientation`= 2.84501 WHERE `guid`= 85083;
UPDATE `creature` SET `spawndist`= 0,`MovementType`= 2,`position_x`= -11135.05,`position_y`= -1959.616,`position_z`= 49.88940,`orientation`= 2.84501 WHERE `guid`= 85010;

DELETE FROM `creature_addon` WHERE `creature_addon`.`guid` = 85010;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes0`, `bytes1`, `bytes2`, `emote`, `moveflags`, `auras`) VALUES
(85010, 551781, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- Correction for Spectral Stable Hand waypoints
SET @PATH := 551781;
DELETE FROM `waypoint_data` WHERE `id`= @PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-11139.15,-1958.643,50.13292,0,0,0,100,0),
(@PATH,2,-11140.99,-1958.73,50.13834,0,0,0,100,0), 
(@PATH,3,-11150.01,-1954.026,50.13877,0,0,0,100,0),
(@PATH,4,-11153.39,-1949.873,50.14286,0,0,0,100,0),
(@PATH,5,-11155.59,-1944.217,50.1403,0,0,0,100,0), 
(@PATH,6,-11154.45,-1933.669,50.14048,0,0,0,100,0), 
(@PATH,7,-11149.63,-1924.214,50.13697,0,0,0,100,0),
(@PATH,8,-11148.29,-1921.983,50.1355,0,0,0,100,0), 
(@PATH,9,-11143.91,-1914.227,50.1435,0,0,0,100,0), 
(@PATH,10,-11138.04,-1896.702,50.14161,0,0,0,100,0),
(@PATH,11,-11137.91,-1896.528,50.13779,0,0,0,100,0),
(@PATH,12,-11143.54,-1913.79,50.13785,0,0,0,100,0), 
(@PATH,13,-11143.98,-1914.482,50.14283,0,0,0,100,0),
(@PATH,14,-11150.31,-1925.25,50.13745,0,0,0,100,0), 
(@PATH,15,-11155.36,-1936.238,50.13684,0,0,0,100,0),
(@PATH,16,-11155.38,-1944.396,50.14186,0,0,0,100,0),
(@PATH,17,-11153.61,-1949.67,50.1403,0,0,0,100,0),
(@PATH,18,-11150,-1953.846,50.1419,0,0,0,100,0), 
(@PATH,19,-11146.95,-1956.661,50.13744,0,0,0,100,0), 
(@PATH,20,-11139.23,-1958.734,50.13474,0,0,0,100,0), 
(@PATH,21,-11128.54,-1957.49,50.1328,0,0,0,100,0),
(@PATH,22,-11119.98,-1955.745,50.13598,0,0,0,100,0), 
(@PATH,23,-11118.78,-1955.239,50.13552,0,0,0,100,0), 
(@PATH,24,-11106.93,-1950.351,50.13303,0,0,0,100,0), 
(@PATH,25,-11108.34,-1950.953,50.13321,0,0,0,100,0), 
(@PATH,26,-11111.54,-1952.779,50.13732,0,0,0,100,0), 
(@PATH,27,-11120.17,-1955.572,50.13478,0,0,0,100,0), 
(@PATH,28,-11133.77,-1958.44,50.13371,0,0,0,100,0); 

-- Correction for Calliard waypoints
SET @NPC := 56752;
SET @PATH := 1359;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-11137.99,`position_y`=-1945.277,`position_z`=49.89039 WHERE `guid`=@NPC;
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-11137.99,-1945.277,49.89039,0,0,0,100,0),
(@PATH,2,-11129.64,-1948.63,50.14034,0,0,0,100,0), 
(@PATH,3,-11125.21,-1949.558,50.13778,0,0,0,100,0), 
(@PATH,4,-11110.95,-1946.991,50.13663,0,0,0,100,0),
(@PATH,5,-11102.87,-1942.1,50.13157,0,0,0,100,0), 
(@PATH,6,-11099.54,-1937.292,50.13352,0,0,0,100,0), 
(@PATH,7,-11097.69,-1933.512,50.13876,0,0,0,100,0), 
(@PATH,8,-11097.51,-1933.438,50.13683,0,0,0,100,0),
(@PATH,9,-11099.44,-1937.166,50.13335,0,0,0,100,0), 
(@PATH,10,-11102.06,-1941.6,50.13267,0,0,0,100,0), 
(@PATH,11,-11110.1,-1946.833,50.13472,0,0,0,100,0), 
(@PATH,12,-11124.7,-1949.601,50.13889,0,0,0,100,0),
(@PATH,13,-11135.64,-1946.267,50.13834,0,0,0,100,0);

/* Formations */

DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85083;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85010;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85083;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85010;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(85083, 85083, 0, 0, 2),
(85083, 85010, 0, 0, 2);

DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 84978;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85182;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 84978;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85182;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(84978, 84978, 0, 0, 2),
(84978, 85182, 0, 0, 2);

DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 84979;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 84980;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 84979;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 84980;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(84979, 84979, 0, 0, 2),
(84979, 84980, 0, 0, 2);

DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85001;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85181;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85001;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85181;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(85001, 85001, 0, 0, 2),
(85001, 85181, 0, 0, 2);

DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85082;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85084;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85082;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85084;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(85082, 85082, 0, 0, 2),
(85082, 85084, 0, 0, 2);

DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 84973;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 84974;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85035;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85036;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 84973;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 84974;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85035;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85036;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(84973, 84973, 0, 0, 2),
(84973, 84974, 0, 0, 2),
(84973, 85035, 0, 0, 2),
(84973, 85036, 0, 0, 2);

DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 306606;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 306554;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 306005;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 305961;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 306725;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 306606;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 306554;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 306005;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 305961;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 306725;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(306606, 306606, 0, 0, 2),
(306606, 306554, 0, 0, 2),
(306606, 306005, 0, 0, 2),
(306606, 305961, 0, 0, 2),
(306606, 306725, 0, 0, 2);

DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 311744;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 312876;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85376;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85377;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 310980;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 311744;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 312876;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85376;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85377;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 310980;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(311744, 311744, 0, 0, 2),
(311744, 312876, 0, 0, 2),
(311744, 85376, 0, 0, 2),
(311744, 85377, 0, 0, 2),
(311744, 310980, 0, 0, 2);
 
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 315677;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 315147;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 315229;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 315930;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 315427;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 315677;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 315147;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 315229;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 315930;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 315427;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(315677, 315677, 0, 0, 2),
(315677, 315147, 0, 0, 2),
(315677, 315229, 0, 0, 2),
(315677, 315930, 0, 0, 2),
(315677, 315427, 0, 0, 2);
 
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 352535;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 352721;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 352535;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 352721;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(352535, 352535, 0, 0, 2),
(352535, 352721, 0, 0, 2);

DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 353909;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 353950;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 353909;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 353950;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(353909, 353909, 0, 0, 2),
(353909, 353950, 0, 0, 2);

DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 379841;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 379950;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 381165;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 379841;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 379950;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 381165;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(379841, 379841, 0, 0, 2),
(379841, 379950, 0, 0, 2),
(379841, 381165, 0, 0, 2);

DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 381053;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 380123;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 380082;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 381053;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 380123;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 380082;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(381053, 381053, 0, 0, 2),
(381053, 380123, 0, 0, 2),
(381053, 380082, 0, 0, 2);

DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 368275;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 361773;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 362303;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 368393;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 368275;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 361773;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 362303;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 368393;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(368275, 368275, 0, 0, 2),
(368275, 361773, 0, 0, 2),
(368275, 362303, 0, 0, 2),
(368275, 368393, 0, 0, 2);

DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 362544;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 368129;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 362730;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 367972;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 362544;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 368129;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 362730;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 367972;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(362544, 362544, 0, 0, 2),
(362544, 368129, 0, 0, 2),
(362544, 362730, 0, 0, 2),
(362544, 367972, 0, 0, 2);
 
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 367568;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 363280;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 367568;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 363280;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(367568, 367568, 0, 0, 2),
(367568, 363280, 0, 0, 2);

DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 367717;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 363149;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 367717;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 363149;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(367717, 367717, 0, 0, 2),
(367717, 363149, 0, 0, 2);

DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 384686;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 384131;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 384191;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 384589;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 384686;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 384131;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 384191;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 384589;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(384686, 384686, 0, 0, 2),
(384686, 384131, 0, 0, 2),
(384686, 384191, 0, 0, 2),
(384686, 384589, 0, 0, 2);

DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 396271;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 393119;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 392984;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 396271;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 393119;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 392984;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(396271, 396271, 0, 0, 2),
(396271, 393119, 0, 0, 2),
(396271, 392984, 0, 0, 2);

DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 81433;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 81434;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 81433;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 81434;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(81433, 81433, 0, 0, 2),
(81433, 81434, 0, 0, 2);

DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 399809;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 392343;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 392630;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 399809;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 392343;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 392630;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(399809, 399809, 0, 0, 2),
(399809, 392343, 0, 0, 2),
(399809, 392630, 0, 0, 2);

DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 400697;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 400574;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 400697;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 400574;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(400697, 400697, 0, 0, 2),
(400697, 400574, 0, 0, 2);

DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 401214;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 401334;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 401214;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 401334;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(401214, 401214, 0, 0, 2),
(401214, 401334, 0, 0, 2);

DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 398744;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 392058;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 391887;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 398744;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 392058;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 391887;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(398744, 398744, 0, 0, 2),
(398744, 392058, 0, 0, 2),
(398744, 391887, 0, 0, 2);

DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85135;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85136;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85135;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85136;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(85135, 85135, 0, 0, 2),
(85135, 85136, 0, 0, 2);

DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85146;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85145;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85144;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85143;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85142;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85141;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85140;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85139;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85147;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85146;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85145;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85144;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85143;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85142;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85141;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85140;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85139;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85147;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(85146, 85146, 0, 0, 2),
(85146, 85145, 0, 0, 2),
(85146, 85144, 0, 0, 2),
(85146, 85143, 0, 0, 2),
(85146, 85142, 0, 0, 2),
(85146, 85141, 0, 0, 2),
(85146, 85140, 0, 0, 2),
(85146, 85139, 0, 0, 2),
(85146, 85147, 0, 0, 2);

DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85152;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85153;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85154;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85155;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85156;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85162;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85163;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85161;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85160;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85152;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85153;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85154;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85155;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85156;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85162;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85163;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85161;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85160;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(85152, 85152, 0, 0, 2),
(85152, 85153, 0, 0, 2),
(85152, 85154, 0, 0, 2),
(85152, 85155, 0, 0, 2),
(85152, 85156, 0, 0, 2),
(85152, 85162, 0, 0, 2),
(85152, 85163, 0, 0, 2),
(85152, 85161, 0, 0, 2),
(85152, 85160, 0, 0, 2);

DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85159;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85158;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85157;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85148;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85149;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85150;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85212;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85213;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85214;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85159;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85158;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85157;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85148;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85149;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85150;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85212;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85213;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85214;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(85159, 85159, 0, 0, 2),
(85159, 85158, 0, 0, 2),
(85159, 85157, 0, 0, 2),
(85159, 85148, 0, 0, 2),
(85159, 85149, 0, 0, 2),
(85159, 85150, 0, 0, 2),
(85159, 85212, 0, 0, 2),
(85159, 85213, 0, 0, 2),
(85159, 85214, 0, 0, 2);

DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85166;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85167;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85168;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85169;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85170;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85171;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85172;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85173;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85174;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85166;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85167;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85168;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85169;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85170;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85171;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85172;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85173;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85174;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(85166, 85166, 0, 0, 2),
(85166, 85167, 0, 0, 2),
(85166, 85168, 0, 0, 2),
(85166, 85169, 0, 0, 2),
(85166, 85170, 0, 0, 2),
(85166, 85171, 0, 0, 2),
(85166, 85172, 0, 0, 2),
(85166, 85173, 0, 0, 2),
(85166, 85174, 0, 0, 2);

DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85164;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85165;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85164;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85165;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(85164, 85164, 0, 0, 2),
(85164, 85165, 0, 0, 2);

UPDATE `creature` SET `id` = '16425', `equipment_id` = '580', `position_x` = '-11132.8', `position_y` = '-1891.704', `position_z` = '74.66624', `orientation`= '3.38349', `curhealth` = '43034' WHERE `creature`.`guid` = 353909;
UPDATE `creature` SET `position_x` = '-11131.19', `position_y` = '-1891.304', `position_z` = '74.40656', `orientation`= '3.38349', `MovementType` = '2' WHERE `creature`.`guid` = 353950; 

DELETE FROM `creature_addon` WHERE `creature_addon`.`guid` = 353950;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes0`, `bytes1`, `bytes2`, `emote`, `moveflags`, `auras`) VALUES
(353950, 47443212, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- New waypoint for Spectral Sentry and Phantom Guardsman pack
SET @PATH := 47443212;
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-11132.8,-1891.704,74.66624,0,0,0,100,0),
(@PATH,2,-11136.46,-1893.55,74.65557,0,0,0,100,0), 
(@PATH,3,-11149.42,-1904.153,74.64162,0,0,0,100,0),
(@PATH,4,-11156.4,-1913.151,74.63856,0,0,0,100,0), 
(@PATH,5,-11157.86,-1915.049,74.65456,0,0,0,100,0),
(@PATH,6,-11159.97,-1924.596,74.65793,0,0,0,100,0),
(@PATH,7,-11160.39,-1927.727,74.66109,0,0,0,100,0),
(@PATH,8,-11157.85,-1939.597,74.65792,0,0,0,100,0),
(@PATH,9,-11146.22,-1951.103,74.66293,0,0,0,100,0),
(@PATH,10,-11135.17,-1956.816,74.66072,0,0,0,100,0),
(@PATH,11,-11125.12,-1959.343,74.65315,0,0,0,100,0), 
(@PATH,12,-11117.17,-1958.865,74.65308,0,0,0,100,0), 
(@PATH,13,-11107.3,-1950.776,74.64825,0,0,0,100,0), 
(@PATH,14,-11102.3,-1945.252,74.68752,0,0,0,100,0), 
(@PATH,15,-11093.51,-1932.747,74.68961,0,0,0,100,0), 
(@PATH,16,-11092.4,-1922.099,74.67129,0,0,0,100,0), 
(@PATH,17,-11096.22,-1910.553,74.64828,0,0,0,100,0), 
(@PATH,18,-11104.8,-1903.495,74.65073,0,0,0,100,0),
(@PATH,19,-11115.08,-1896.715,74.65324,0,0,0,100,0), 
(@PATH,20,-11120.06,-1894.332,74.65387,0,0,0,100,0); 

-- Bennett waypoints
SET @NPC := 57036;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-11091.21,`position_y`=-1895.91,`position_z`=74.38682 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes0`, `bytes1`, `bytes2`, `emote`, `moveflags`, `auras`) VALUES
(@NPC, @PATH, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-11091.21,-1895.91,74.38682,0,0,0,100,0), -- when orientation support : 3.787364
(@PATH,2,-11093.95,-1896.696,74.64124,0,0,0,100,0),
(@PATH,3,-11098.31,-1896.238,74.64204,0,0,0,100,0),
(@PATH,4,-11101.07,-1894.101,74.63479,0,0,0,100,0), 
(@PATH,5,-11101.28,-1893.677,74.63275,0,0,0,100,0), 
(@PATH,6,-11107.03,-1888.539,74.38156,0,0,0,100,0), 
(@PATH,7,-11106.94,-1888.505,74.63261,0,0,0,100,0),
(@PATH,8,-11112.82,-1888.331,74.64198,0,0,0,100,0), 
(@PATH,9,-11113.2,-1888.443,74.64694,0,0,0,100,0),
(@PATH,10,-11115.24,-1893.177,74.65703,0,0,0,100,0),
(@PATH,11,-11115.37,-1894.182,74.65796,0,0,0,100,0), 
(@PATH,12,-11115.62,-1897.085,74.66112,0,0,0,100,0), 
(@PATH,13,-11111.63,-1899.599,74.64792,0,0,0,100,0),
(@PATH,14,-11109.47,-1900.453,74.64299,0,0,0,100,0),
(@PATH,15,-11107.84,-1901.783,74.64146,0,0,0,100,0), 
(@PATH,16,-11105.64,-1904.142,74.64281,0,0,0,100,0),
(@PATH,17,-11103.85,-1907.212,74.6451,0,0,0,100,0), 
(@PATH,18,-11101.47,-1911.317,74.64999,0,0,0,100,0), 
(@PATH,19,-11096.39,-1913.412,74.40684,0,0,0,100,0),
(@PATH,20,-11094.92,-1912.488,74.66272,0,0,0,100,0),
(@PATH,21,-11093.35,-1911.852,74.66039,0,0,0,100,0),
(@PATH,22,-11090.83,-1908.129,74.65559,0,0,0,100,0),
(@PATH,23,-11090.8,-1906.15,74.65286,0,0,0,100,0), 
(@PATH,24,-11091.12,-1903.362,74.64458,0,0,0,100,0),
(@PATH,25,-11092.55,-1900.16,74.64207,0,0,0,100,0), 
(@PATH,26,-11092.35,-1898.028,74.64039,0,0,0,100,0),
(@PATH,27,-11091.21,-1895.91,74.38682,30000,0,0,100,0); -- when orientation support : 3.787364


DELETE FROM `creature_ai_scripts` WHERE `id` = 40121401;
DELETE FROM `creature_ai_scripts` WHERE `id` = 40133401;
INSERT INTO `creature_ai_scripts` (`id`, `entryOrGUID`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
(40121401, -401214, 1, 0, 100, 3, 2000, 6000, 6000, 8000, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ghostly Steward - Talk Emote OOC'),
(40133401, -401334, 1, 0, 100, 3, 2000, 6000, 6000, 8000, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ghostly Steward - Talk Emote OOC');


DELETE FROM `creature_ai_scripts` WHERE `id` = 37984101;
DELETE FROM `creature_ai_scripts` WHERE `id` = 38116501;
DELETE FROM `creature_ai_scripts` WHERE `id` = 37995001;
INSERT INTO `creature_ai_scripts` (`id`, `entryOrGUID`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
(37984101, -379841, 1, 0, 100, 3, 2000, 6000, 6000, 15000, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spectral Sentry - Talk Emote OOC'),
(38116501, -381165, 1, 0, 100, 3, 2000, 6000, 6000, 15000, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Phantom Guardsman - Talk Emote OOC'),
(37995001, -379950, 1, 0, 100, 3, 2000, 6000, 6000, 15000, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spectral Sentry - Talk Emote OOC');

DELETE FROM `creature_ai_scripts` WHERE `id` = 38012301;
DELETE FROM `creature_ai_scripts` WHERE `id` = 38008201;
DELETE FROM `creature_ai_scripts` WHERE `id` = 38105301;
INSERT INTO `creature_ai_scripts` (`id`, `entryOrGUID`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
(38012301, -380123, 1, 0, 100, 3, 2000, 6000, 6000, 15000, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spectral Sentry - Talk Emote OOC'),
(38008201, -380082, 1, 0, 100, 3, 2000, 6000, 6000, 15000, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spectral Sentry - Talk Emote OOC'),
(38105301, -381053, 1, 0, 100, 3, 2000, 6000, 6000, 15000, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Phantom Guardsman - Talk Emote OOC');

DELETE FROM `creature_ai_scripts` WHERE `id` = 38458901;
DELETE FROM `creature_ai_scripts` WHERE `id` = 38468601;
DELETE FROM `creature_ai_scripts` WHERE `id` = 38419101;
DELETE FROM `creature_ai_scripts` WHERE `id` = 38413101;
INSERT INTO `creature_ai_scripts` (`id`, `entryOrGUID`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
(38458901, -384589, 1, 0, 100, 3, 2000, 6000, 6000, 15000, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spectral Sentry - Talk Emote OOC'),
(38468601, -384686, 1, 0, 100, 3, 2000, 6000, 6000, 15000, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Spectral Sentry - Talk Emote OOC'),
(38419101, -384191, 1, 0, 100, 3, 2000, 6000, 6000, 15000, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Phantom Guardsman - Talk Emote OOC'),
(38413101, -384131, 1, 0, 100, 3, 2000, 6000, 6000, 15000, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Phantom Guardsman - Talk Emote OOC');

UPDATE `creature` SET `position_x`=-11024, `position_y`=-1907.74, `position_z`=78.8692 WHERE `guid`= 85135;
UPDATE `creature` SET `position_x`=-11023.075, `position_y`=-1899.950, `position_z`=78.8684 WHERE `guid`= 85136;


DELETE FROM `creature_ai_scripts` WHERE `creature_ai_scripts`.`id` = 1641501;
UPDATE `creature_template` SET `ScriptName` = 'mob_skeletal_waiter' WHERE `creature_template`.`entry` = 16415; 

DELETE FROM `creature` WHERE `creature`.`guid` = 85151;
DELETE FROM `creature_linked_respawn` WHERE `creature_linked_respawn`.`guid` = 85151;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85151;

DELETE FROM `creature` WHERE `creature`.`guid` = 85212;
DELETE FROM `creature` WHERE `creature`.`guid` = 85213;
DELETE FROM `creature` WHERE `creature`.`guid` = 85214;

INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(85212, 16409, 532, 1, 16466, 16409, -10998.5, -1918.98, 78.8696, 5.69528, 300, 0, 0, 10676, 15775, 0, 0),
(85213, 16409, 532, 1, 0, 16409, -10995.5, -1919.37, 79.1282, 5.73098, 300, 0, 0, 10676, 15775, 0, 0),
(85214, 16409, 532, 1, 16466, 16409, -10992.5, -1919.39, 78.8684, 5.62102, 300, 0, 0, 10676, 15775, 0, 0);

DELETE FROM `creature_linked_respawn` WHERE `creature_linked_respawn`.`guid` = 85212;
DELETE FROM `creature_linked_respawn` WHERE `creature_linked_respawn`.`guid` = 85213;
DELETE FROM `creature_linked_respawn` WHERE `creature_linked_respawn`.`guid` = 85214;
INSERT INTO `creature_linked_respawn` (`guid`, `linkedGuid`) VALUES ('85212', '10999101');
INSERT INTO `creature_linked_respawn` (`guid`, `linkedGuid`) VALUES ('85213', '10999101');
INSERT INTO `creature_linked_respawn` (`guid`, `linkedGuid`) VALUES ('85214', '10999101');

-- Special Dance for Phantom Guests
UPDATE `creature_addon` SET `emote` = '400' WHERE `creature_addon`.`emote` = '10' AND `creature_addon`.`guid` >= '83000' AND `creature_addon`.`guid` <= '86000'; 

-- Phantom Guests correct positions up to Moroes hall
UPDATE creature SET position_x = '-11023.992188', position_y = '-1907.744263', position_z = '78.869179', orientation = '6.250698' WHERE guid = '85135';
UPDATE creature SET position_x = '-11023.075195', position_y = '-1899.950195', position_z = '78.867668', orientation = '6.250700' WHERE guid = '85136';
UPDATE creature SET position_x = '-11011.291992', position_y = '-1901.396240', position_z = '78.867668', orientation = '1.009889' WHERE guid = '85146';
UPDATE creature SET position_x = '-11015.700195', position_y = '-1894.599976', position_z = '78.830002', orientation = '-0.722301' WHERE guid = '85144';
UPDATE creature SET position_x = '-11015.500000', position_y = '-1898.209961', position_z = '78.830002', orientation = '0.281313' WHERE guid = '85145';
UPDATE creature SET position_x = '-11010.917969', position_y = '-1889.982178', position_z = '78.868935', orientation = '5.001554' WHERE guid = '85143';
UPDATE creature SET position_x = '-11006.000977', position_y = '-1890.122314', position_z = '78.867805', orientation = '4.681420' WHERE guid = '85142';
UPDATE creature SET position_x = '-10999.799805', position_y = '-1891.469971', position_z = '78.830002', orientation = '-1.439710' WHERE guid = '85141';
UPDATE creature SET position_x = '-10996.606445', position_y = '-1893.923950', position_z = '78.812965', orientation = '3.581340' WHERE guid = '85140';
UPDATE creature SET position_x = '-10997.162109', position_y = '-1900.151367', position_z = '78.811768', orientation = '2.283863' WHERE guid = '85139';
UPDATE creature SET position_x = '-11003.234375', position_y = '-1902.312500', position_z = '78.844475', orientation = '1.476473' WHERE guid = '85147';
UPDATE creature SET position_x = '-11004.302734', position_y = '-1928.339844', position_z = '78.868767', orientation = '1.192155' WHERE guid = '85152';
UPDATE creature SET position_x = '-10997.041016', position_y = '-1930.759277', position_z = '78.868774', orientation = '1.953520' WHERE guid = '85153';
UPDATE creature SET position_x = '-10993.700195', position_y = '-1931.189941', position_z = '78.862000', orientation = '1.560820' WHERE guid = '85154';
UPDATE creature SET position_x = '-10986.500000', position_y = '-1932.150024', position_z = '78.862000', orientation = '1.077100' WHERE guid = '85155';
UPDATE creature SET position_x = '-10982.279297', position_y = '-1931.846558', position_z = '78.867935', orientation = '1.447023' WHERE guid = '85156';
UPDATE creature SET position_x = '-10980.140625', position_y = '-1932.923218', position_z = '78.869118', orientation = '1.538112' WHERE guid = '85162';
UPDATE creature SET position_x = '-10977.495117', position_y = '-1933.213745', position_z = '78.867897', orientation = '1.991287' WHERE guid = '85163';
UPDATE creature SET position_x = '-10971.998047', position_y = '-1933.050659', position_z = '78.862213', orientation = '1.633204' WHERE guid = '85161';
UPDATE creature SET position_x = '-10965.829102', position_y = '-1930.400513', position_z = '78.869911', orientation = '2.422530' WHERE guid = '85160';
UPDATE creature SET position_x = '-10974.026367', position_y = '-1921.552612', position_z = '78.868317', orientation = '3.889039' WHERE guid = '85159';
UPDATE creature SET position_x = '-10976.785156', position_y = '-1921.044434', position_z = '78.868683', orientation = '3.414658' WHERE guid = '85158';
UPDATE creature SET position_x = '-10979.614258', position_y = '-1920.967285', position_z = '78.869331', orientation = '3.728818' WHERE guid = '85157';
UPDATE creature SET position_x = '-10982.877930', position_y = '-1921.050415', position_z = '78.890106', orientation = '3.881186' WHERE guid = '85148';
UPDATE creature SET position_x = '-10985.383789', position_y = '-1919.798706', position_z = '78.868698', orientation = '4.058686' WHERE guid = '85149';
UPDATE creature SET position_x = '-10989.830078', position_y = '-1919.632446', position_z = '78.885521', orientation = '5.127613' WHERE guid = '85150';
UPDATE creature SET position_x = '-10965.000000', position_y = '-1906.880005', position_z = '78.862000', orientation = '2.007411' WHERE guid = '85166';
UPDATE creature SET position_x = '-10959.158203', position_y = '-1906.850830', position_z = '78.887001', orientation = '2.172113' WHERE guid = '85167';
UPDATE creature SET position_x = '-10954.200195', position_y = '-1902.949951', position_z = '78.862000', orientation = '2.799940' WHERE guid = '85168';
UPDATE creature SET position_x = '-10955.599609', position_y = '-1898.339966', position_z = '78.862000', orientation = '-2.671660' WHERE guid = '85169';
UPDATE creature SET position_x = '-10959.299805', position_y = '-1896.079956', position_z = '78.862000', orientation = '-1.998660' WHERE guid = '85170';
UPDATE creature SET position_x = '-10963.900391', position_y = '-1894.619995', position_z = '78.862000', orientation = '-1.511560' WHERE guid = '85171';
UPDATE creature SET position_x = '-10969.736328', position_y = '-1894.401123', position_z = '78.916374', orientation = '4.803825' WHERE guid = '85172';
UPDATE creature SET position_x = '-10973.370117', position_y = '-1897.146118', position_z = '78.930779', orientation = '5.078719' WHERE guid = '85173';
UPDATE creature SET position_x = '-10974.316406', position_y = '-1901.749756', position_z = '78.933128', orientation = '6.164270' WHERE guid = '85174';