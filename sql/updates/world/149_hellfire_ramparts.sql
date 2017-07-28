-- 1st pack 
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 62023;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 62018;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 200911;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 62023;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 62018;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 200911;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(62023, 62023, 0, 0, 2),
(62023, 62018, 0, 0, 2),
(62023, 200911, 0, 0, 2);

-- 2nd pack 
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 15;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 200912;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 200913;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 15;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 200912;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 200913;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(15, 15, 0, 0, 2),
(15, 200912, 0, 0, 2),
(15, 200913, 0, 0, 2);


-- 3th pack 
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 18;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 200914;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 200915;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 18;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 200914;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 200915;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(18, 18, 0, 0, 2),
(18, 200914, 0, 0, 2),
(18, 200915, 0, 0, 2);

-- 4th pack
-- Random Movement as retail for Bonechewer Hungerer
UPDATE `creature` SET `spawndist`=2,`MovementType`=1 WHERE `guid`= 200917;
UPDATE `creature` SET `spawndist`=2,`MovementType`=1 WHERE `guid`= 200918;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 200917;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(200917, 200917, 0, 0, 2),
(200917, 200918, 0, 0, 2), 
(200917, 200916, 0, 0, 2),
(200917, 23, 0, 0, 2);


-- 5th pack
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85642;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85639;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85641;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85637;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85642;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85639;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85641;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85637;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(85642, 85642, 0, 0, 2),
(85642, 85639, 0, 0, 2),
(85642, 85641, 0, 0, 2),
(85642, 85637, 0, 0, 2);


-- 6th pack 
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 86360;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 99982;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 99983;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 86360;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 99982;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 99983;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(86360, 86360, 0, 0, 2),
(86360, 99982, 0, 0, 2),
(86360, 99983, 0, 0, 2);


-- 7th pack 
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 200919;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 200920;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 99984;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 200921;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 200919;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 200920;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 99984;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 200921;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(200919, 200919, 0, 0, 2),
(200919, 200920, 0, 0, 2),
(200919, 99984, 0, 0, 2),
(200919, 200921, 0, 0, 2);

-- 8th pack 
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 99986;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 99981;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 99980;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 99980;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 99986;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 99981;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 99980;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 99985;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(99986, 99986, 0, 0, 2),
(99986, 99981, 0, 0, 2),
(99986, 99980, 0, 0, 2),
(99986, 99985, 0, 0, 2);

-- 9th pack 
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 200932;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 200925;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 200923;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 200922;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 200924;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 200932;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 200925;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 200923;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 200922;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 200924;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(200932, 200932, 0, 0, 2),
(200932, 200925, 0, 0, 2),
(200932, 200923, 0, 0, 2),
(200932, 200922, 0, 0, 2),
(200932, 200924, 0, 0, 2);

-- 10th pack 
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 200926;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 200927;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 200928;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 200926;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 200927;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 200928;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(200926, 200926, 0, 0, 2),
(200926, 200927, 0, 0, 2),
(200926, 200928, 0, 0, 2);

-- 11th pack 
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 200929;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 200930;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 200929;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 200930;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(200929, 200929, 0, 0, 2),
(200929, 200930, 0, 0, 2);

-- 12th pack 
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 200931;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 200933;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 200934;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 200935;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 200931;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 200933;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 200934;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 200935;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(200931, 200931, 0, 0, 2),
(200931, 200933, 0, 0, 2),
(200931, 200934, 0, 0, 2),
(200931, 200935, 0, 0, 2);

-- 13th pack 
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 200936;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 99987;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 99988;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 200937;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 200936;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 99987;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 99988;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 200937;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(200936, 200936, 0, 0, 2),
(200936, 99987, 0, 0, 2),
(200936, 99988, 0, 0, 2),
(200936, 200937, 0, 0, 2);

-- 14th pack 
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 99900;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 200938;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 99900;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 200938;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(99900, 99900, 0, 0, 2),
(99900, 200938, 0, 0, 2);

-- 15th pack 
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85652;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85646;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85650;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85649;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 85648;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85652;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85646;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85650;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85649;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 85648;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(85652, 85652, 0, 0, 2),
(85652, 85646, 0, 0, 2),
(85652, 85650, 0, 0, 2),
(85652, 85649, 0, 0, 2),
(85652, 85648, 0, 0, 2);

-- 16th pack 
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 200939;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 200940;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 200939;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 200940;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(200939, 200939, 0, 0, 2),
(200939, 200940, 0, 0, 2);

-- 17th pack 
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 200945;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 200943;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 200944;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 200946;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 200947;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 200945;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 200943;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 200944;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 200946;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 200947;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(200945, 200945, 0, 0, 2),
(200945, 200943, 0, 0, 2),
(200945, 200944, 0, 0, 2),
(200945, 200946, 0, 0, 2),
(200945, 200947, 0, 0, 2);

-- 18th pack 
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 62022;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 62021;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 62020;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 62022;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 62021;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 62020;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(62022, 62022, 0, 0, 2),
(62022, 62021, 0, 0, 2),
(62022, 62020, 0, 0, 2);

-- 19th pack 
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 200948;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 62017;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 62064;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 62067;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 62016;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 200948;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 62017;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 62064;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 62067;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 62016;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(200948, 200948, 0, 0, 2),
(200948, 62017, 0, 0, 2),
(200948, 62064, 0, 0, 2),
(200948, 62067, 0, 0, 2),
(200948, 62016, 0, 0, 2);

-- 20th pack 
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 200941;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 62019;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 200942;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 200941;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 62019;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 200942;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(200941, 200941, 0, 0, 2),
(200941, 62019, 0, 0, 2),
(200941, 200942, 0, 0, 2);

-- 21th pack @Todo - Need check Waypoints! 
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 61994;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 61995;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 61994;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 61995;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(61994, 61994, 0, 0, 2),
(61994, 61995, 0, 0, 2);

-- 22th pack 
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 99977;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 99978;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 99977;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 99978;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(99977, 99977, 0, 0, 2),
(99977, 99978, 0, 0, 2);

-- 23th pack @Todo - Need check Waypoints! 
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 61996;
DELETE FROM `creature_formations` WHERE `creature_formations`.`leaderGUID` = 61997;

DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 61996;
DELETE FROM `creature_formations` WHERE `creature_formations`.`memberGUID` = 61997;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(61996, 61996, 0, 0, 2),
(61996, 61997, 0, 0, 2);

-- Bleeding Hollow Scryer: Stop casting channeling at Aggro (Force that on spell cast action)
UPDATE `creature_ai_scripts` SET `action1_param3` = '1' WHERE `creature_ai_scripts`.`id` = 1747803; 
UPDATE `creature_ai_scripts` SET `action1_param3` = '1' WHERE `creature_ai_scripts`.`id` = 1747805; 

-- Bleeding Hollow Scryer: Missing channeling set as on Retail
DELETE FROM `creature_ai_scripts` WHERE `creature_ai_scripts`.`id` = 1747815;
INSERT INTO `creature_ai_scripts` (`id`, `entryOrGUID`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
(1747815, 17478, 1, 0, 100, 1, 1000, 1000, 0, 0, 11, 31059, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bleeding Hollow Scryer - Cast Warlock Channeling OOC');

-- Bleeding Hollow Scryer: Missing spell cast on Bonechewer Ripper (Fel Infusion) set as on Retail
DELETE FROM `creature_ai_scripts` WHERE `creature_ai_scripts`.`id` = 1747816;
INSERT INTO `creature_ai_scripts` (`id`, `entryOrGUID`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
(1747816, -85637, 6, 0, 100, 0, 0, 0, 0, 0, 44, 30659, 85642, 5, 0, 0, 0, 0, 0, 0, 0, 0, 'Bleeding Hollow Scryer - Cast Fel Infusion on Bonechewer Ripper at death');
DELETE FROM `creature_ai_scripts` WHERE `creature_ai_scripts`.`id` = 1747817;
INSERT INTO `creature_ai_scripts` (`id`, `entryOrGUID`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
(1747817, -85639, 6, 0, 100, 0, 0, 0, 0, 0, 44, 30659, 85642, 5, 0, 0, 0, 0, 0, 0, 0, 0, 'Bleeding Hollow Scryer - Cast Fel Infusion on Bonechewer Ripper at death');
DELETE FROM `creature_ai_scripts` WHERE `creature_ai_scripts`.`id` = 1747818;
INSERT INTO `creature_ai_scripts` (`id`, `entryOrGUID`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
(1747818, -85641, 6, 0, 100, 0, 0, 0, 0, 0, 44, 30659, 85642, 5, 0, 0, 0, 0, 0, 0, 0, 0, 'Bleeding Hollow Scryer - Cast Fel Infusion on Bonechewer Ripper at death');

DELETE FROM `creature_ai_scripts` WHERE `creature_ai_scripts`.`id` = 1747819;
INSERT INTO `creature_ai_scripts` (`id`, `entryOrGUID`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
(1747819, -85646, 6, 0, 100, 0, 0, 0, 0, 0, 44, 30659, 85652, 5, 0, 0, 0, 0, 0, 0, 0, 0, 'Bleeding Hollow Scryer - Cast Fel Infusion on Bonechewer Ripper at death');

DELETE FROM `creature_ai_scripts` WHERE `creature_ai_scripts`.`id` = 1747820;
INSERT INTO `creature_ai_scripts` (`id`, `entryOrGUID`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
(1747820, -85650, 6, 0, 100, 0, 0, 0, 0, 0, 44, 30659, 85652, 5, 0, 0, 0, 0, 0, 0, 0, 0, 'Bleeding Hollow Scryer - Cast Fel Infusion on Bonechewer Ripper at death');

DELETE FROM `creature_ai_scripts` WHERE `creature_ai_scripts`.`id` = 1747821;
INSERT INTO `creature_ai_scripts` (`id`, `entryOrGUID`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
(1747821, -85649, 6, 0, 100, 0, 0, 0, 0, 0, 44, 30659, 85652, 5, 0, 0, 0, 0, 0, 0, 0, 0, 'Bleeding Hollow Scryer - Cast Fel Infusion on Bonechewer Ripper at death');

DELETE FROM `creature_ai_scripts` WHERE `creature_ai_scripts`.`id` = 1747822;
INSERT INTO `creature_ai_scripts` (`id`, `entryOrGUID`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
(1747822, -85648, 6, 0, 100, 0, 0, 0, 0, 0, 44, 30659, 85652, 5, 0, 0, 0, 0, 0, 0, 0, 0, 'Bleeding Hollow Scryer - Cast Fel Infusion on Bonechewer Ripper at death');

-- Bleeding Hollow Scryer: Missing weapon set as on Retail
UPDATE `creature_template` SET `equipment_id` = '4001' WHERE `creature_template`.`entry` = 17478;
DELETE FROM `creature_equip_template` WHERE `creature_equip_template`.`entry` = 4001;
INSERT INTO `creature_equip_template` (`entry`, `equipmodel1`, `equipmodel2`, `equipmodel3`, `equipinfo1`, `equipinfo2`, `equipinfo3`, `equipslot1`, `equipslot2`, `equipslot3`) VALUES
(4001, 45947, 0, 0, 50268674, 0, 0, 529, 0, 0);

-- Bonechewer Ripper: Emote Cheer set as on Retail
DELETE FROM `creature_ai_scripts` WHERE `creature_ai_scripts`.`id` = 1728102;
INSERT INTO `creature_ai_scripts` (`id`, `entryOrGUID`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
(1728102, 17281, 1, 0, 100, 1, 3000, 3000, 3000, 12000, 5, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bonechewer Ripper - Cast emote cheer OOC');

-- Issue #243 » Omor the Unscarred - Hellfire Ramparts
UPDATE `creature_ai_scripts` SET `event_flags` = '5', `comment` = 'Fiendish Hound (Heroic) - Cast Mana Burn' WHERE `creature_ai_scripts`.`id` = 1754001; 