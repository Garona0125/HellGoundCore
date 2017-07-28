UPDATE `creature_template` SET `AIName`="EventAI" WHERE `entry` IN (25134,25135,25136,25137);
DELETE FROM `creature_ai_scripts` WHERE `entryorguid` IN (-96595,-96596,-96600,-96603,-96604,-96610,-96611,-96612);
INSERT INTO `creature_ai_scripts` (`id`, `entryOrGUID`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
(965950, -96595,1,0,100,1,0,3000,3000,3000,10,36,43,54,0,0,0,0,0,0,0,0,"Shattered Sun Trainee - Out of Combat - Emote OneShotAttack1H or OneShotParryShield"),
(965960, -96596,1,0,100,1,0,3000,3000,3000,10,36,43,54,0,0,0,0,0,0,0,0,"Shattered Sun Trainee - Out of Combat - Emote OneShotAttack1H or OneShotParryShield"),
(966000, -96600,1,0,100,1,0,3000,3000,3000,10,36,43,54,0,0,0,0,0,0,0,0,"Shattered Sun Trainee - Out of Combat - Emote OneShotAttack1H or OneShotParryShield"),
(966030, -96603,1,0,100,1,0,3000,3000,3000,10,36,43,54,0,0,0,0,0,0,0,0,"Shattered Sun Trainee - Out of Combat - Emote OneShotAttack1H or OneShotParryShield"),
(966040, -96604,1,0,100,1,0,3000,3000,3000,10,36,43,54,0,0,0,0,0,0,0,0,"Shattered Sun Trainee - Out of Combat - Emote OneShotAttack1H or OneShotParryShield"),
(966100, -96610,1,0,100,1,0,3000,3000,3000,10,36,43,54,0,0,0,0,0,0,0,0,"Shattered Sun Trainee - Out of Combat - Emote OneShotAttack1H or OneShotParryShield"),
(966110, -96611,1,0,100,1,0,3000,3000,3000,10,36,43,54,0,0,0,0,0,0,0,0,"Shattered Sun Trainee - Out of Combat - Emote OneShotAttack1H or OneShotParryShield"),
(966120, -96612,1,0,100,1,0,3000,3000,3000,10,36,43,54,0,0,0,0,0,0,0,0,"Shattered Sun Trainee - Out of Combat - Emote OneShotAttack1H or OneShotParryShield");

-- Missing one Trainee O.o
DELETE FROM `creature` WHERE `creature`.`guid` = 96600;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(96600, 25135, 530, 1, 22937, 0, -1847.88, 5316.36, -12.3448, 4.86947, 180, 0, 0, 9700, 0, 0, 0);