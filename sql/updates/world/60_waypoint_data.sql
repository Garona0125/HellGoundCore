DELETE FROM `waypoint_data` WHERE `waypoint_data`.`id` = 69051;
INSERT INTO waypoint_data (id, point, position_x, position_y, position_z, move_type, delay) VALUES ('69051','1','-635.300293', '4800.250977', '43.941566', '0', '0');
INSERT INTO waypoint_data (id, point, position_x, position_y, position_z, move_type, delay) VALUES ('69051','2','-621.757263', '4800.482422', '39.212627', '0', '0');
INSERT INTO waypoint_data (id, point, position_x, position_y, position_z, move_type, delay) VALUES ('69051','3','-576.257263', '4800.502441', '34.665798', '0', '0');
INSERT INTO waypoint_data (id, point, position_x, position_y, position_z, move_type, delay) VALUES ('69051','4','-544.757263', '4800.516113', '33.825012', '0', '0');
INSERT INTO waypoint_data (id, point, position_x, position_y, position_z, move_type, delay) VALUES ('69051','5','-523.757263', '4800.524902', '32.803524', '0', '0');
INSERT INTO waypoint_data (id, point, position_x, position_y, position_z, move_type, delay) VALUES ('69051','6','-505.452271', '4800.533203', '31.253120', '0', '0');
INSERT INTO waypoint_data (id, point, position_x, position_y, position_z, move_type, delay) VALUES ('69051','7','-510.225403', '4800.625000', '31.714615', '0', '10000');
INSERT INTO waypoint_data (id, point, position_x, position_y, position_z, move_type, delay) VALUES ('69051','8','-531.116028', '4800.697754', '33.572254', '0', '0');
INSERT INTO waypoint_data (id, point, position_x, position_y, position_z, move_type, delay) VALUES ('69051','9','-564.630554', '4800.814453', '34.332420', '0', '0');
INSERT INTO waypoint_data (id, point, position_x, position_y, position_z, move_type, delay) VALUES ('69051','10','-621.026611', '4801.011230', '39.133530', '0', '0');
INSERT INTO waypoint_data (id, point, position_x, position_y, position_z, move_type, delay) VALUES ('69051','11','-635.087158', '4801.097656', '43.940880', '0', '0');
INSERT INTO waypoint_data (id, point, position_x, position_y, position_z, move_type, delay) VALUES ('69051','12','-649.094116', '4801.146484', '48.681808', '0', '0');
INSERT INTO waypoint_data (id, point, position_x, position_y, position_z, move_type, delay) VALUES ('69051','13','-659.411987', '4799.819824', '49.074047', '0', '10000');

UPDATE `creature` SET `MovementType` = '2' WHERE `creature`.`guid` = 69051; 
UPDATE `creature_template` SET `MovementType` = '2' WHERE `creature_template`.`entry` = 19354;

DELETE FROM `creature_addon` WHERE `creature_addon`.`guid` = 69051;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes0`, `bytes1`, `bytes2`, `emote`, `moveflags`, `auras`) VALUES ('69051', '69051', NULL, NULL, NULL, NULL, NULL, NULL, NULL);