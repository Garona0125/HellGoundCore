UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `guid`= 75414;
UPDATE `creature_template` SET `ScriptName` = 'mob_sunfury_warlock' WHERE `creature_template`.`entry` = 21503;

UPDATE creature SET position_x = '-3821.350098', position_y = '388.109009', position_z = '120.563004', orientation = '3.462162' WHERE guid = '75409';
UPDATE creature SET position_x = '-3824.939941', position_y = '374.354004', position_z = '120.572998', orientation = '2.276190' WHERE guid = '75408';
UPDATE creature SET position_x = '-3841.300049', position_y = '376.158997', position_z = '120.410004', orientation = '0.783461' WHERE guid = '75414';
UPDATE creature SET position_x = '-3844.830078', position_y = '388.716003', position_z = '120.417999', orientation = '5.906568' WHERE guid = '75411';
UPDATE creature SET position_x = '-3840.110107', position_y = '403.463989', position_z = '120.544998', orientation = '5.052265' WHERE guid = '75410';
UPDATE creature SET position_x = '-3833.280029', position_y = '384.148010', position_z = '120.570999', orientation = '4.680910' WHERE guid = '28167';