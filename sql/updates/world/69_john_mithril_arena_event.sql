UPDATE `creature_template` SET `ScriptName` = 'npc_john_mithril' WHERE `creature_template`.`entry` = 14508; 

DELETE FROM `game_event_gameobject` WHERE  `guid` = 12029 AND `event` = 16;
DELETE FROM `gameobject` WHERE  `guid` = 12029;

DELETE FROM `script_waypoint` WHERE `entry` = 14508;
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `waittime`, `point_comment`) VALUES
(14508, 1, -13187.14, 319.7746, 33.2346, 0, 'Short John Mithril'),
(14508, 2, -13215.14, 322.7813, 33.24456, 0, 'Short John Mithril'),
(14508, 3, -13234.32, 314.1292, 33.20762, 0, 'Short John Mithril'),
(14508, 4, -13248.82, 299.0459, 33.22644, 0, 'Short John Mithril'),
(14508, 5, -13254.88, 284.0705, 33.24255, 0, 'Short John Mithril'),
(14508, 6, -13255.58, 264.5797, 33.24498, 0, 'Short John Mithril'),
(14508, 7, -13247.58, 243.589, 33.20824, 0, 'Short John Mithril'),
(14508, 8, -13237.57, 231.7462, 33.23737, 0, 'Short John Mithril'),
(14508, 9, -13233.31, 231.8894, 33.2352, 0, 'Short John Mithril'),
(14508, 10, -13235.35, 231.8208, 33.23225, 0, 'Short John Mithril'),
(14508, 11, -13234.51, 239.4648, 33.36068, 0, 'Short John Mithril'),
(14508, 12, -13239.65, 247.5611, 29.29738, 0, 'Short John Mithril'),
(14508, 13, -13244.49, 256.3933, 22.63047, 0, 'Short John Mithril'),
(14508, 14, -13241.24, 261.35, 21.93297, 0, 'Short John Mithril'),
(14508, 15, -13204.08, 277.1676, 21.98207, 0, 'Short John Mithril'),
(14508, 16, -13219.24, 275.4513, 21.98207, 0, 'Short John Mithril'),
(14508, 17, -13240.61, 268.921, 21.93298, 0, 'Short John Mithril'),
(14508, 18, -13240.61, 268.921, 21.93298, 0, 'Short John Mithril'),
(14508, 19, -13244.04, 261.8775, 21.93297, 0, 'Short John Mithril'),
(14508, 20, -13243.42, 254.9109, 23.88685, 0, 'Short John Mithril'),
(14508, 21, -13239.03, 245.3709, 29.23729, 0, 'Short John Mithril'),
(14508, 22, -13233.62, 238.1597, 33.35011, 0, 'Short John Mithril'),
(14508, 23, -13237.55, 232.776, 33.23082, 0, 'Short John Mithril'),
(14508, 24, -13250.02, 248.9038, 33.23286, 0, 'Short John Mithril'),
(14508, 25, -13255.25, 264.0384, 33.24439, 0, 'Short John Mithril'),
(14508, 26, -13255.29, 282.6273, 33.24288, 0, 'Short John Mithril'),
(14508, 27, -13248.91, 298.4456, 33.24187, 0, 'Short John Mithril'),
(14508, 28, -13233.84, 314.3157, 33.20814, 0, 'Short John Mithril'),
(14508, 29, -13215.96, 322.7598, 33.24435, 0, 'Short John Mithril'),
(14508, 30, -13199.4, 323.3979, 33.24255, 0, 'Short John Mithril'),
(14508, 31, -13188.29, 320.0755, 33.23479, 0, 'Short John Mithril'),
(14508, 32, -13184.82, 329.8854, 37.95504, 0, 'Short John Mithril'),
(14508, 33, -13184.48, 332.6711, 40.32992, 0, 'Short John Mithril');