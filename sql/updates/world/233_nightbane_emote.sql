DELETE FROM `script_texts` WHERE `script_texts`.`entry` = -1000009;

INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
(-1000009, 'An ancient being awakens in the distance...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 7, 0, 0, 'nightbane SUMMON_EMOTE');

-- Correct the position of summon object
UPDATE `gameobject` SET `position_x` = '-11161.8', `position_y` = '-1904.68' WHERE `gameobject`.`guid` = 99912; 