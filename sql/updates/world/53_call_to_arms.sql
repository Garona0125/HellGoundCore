-- ================================
-- ===== CALL TO ARMS SPAWNS =====
-- ================================

ALTER TABLE `creature` ADD `phaseMask` TINYINT(3) NOT NULL DEFAULT '0' AFTER `spawnMask`;
ALTER TABLE `gameobject` ADD `phaseMask` TINYINT(3) NOT NULL DEFAULT '0' AFTER `spawnMask`;
ALTER TABLE `game_event_npc_vendor` ADD `slot` TINYINT(3) NOT NULL DEFAULT '0' AFTER `guid`;
ALTER TABLE `waypoint_data` ADD `move_flag` TINYINT(3) NOT NULL DEFAULT '0' AFTER `delay`;

-- Remove unused game_event (Unknown Holiday PVP) and their GOs
DELETE FROM `game_event` WHERE `entry`=24; -- Unknown Holiday PVP Event
DELETE FROM `gameobject` WHERE `guid` IN (29296,29298,29303,29594,29596,29598,29826,29830,29832,29834,29836,29838,29967,29969,30654,30689,30728,30730,30732,30734,30736,29295,29297,29302,29593,29595,29597,29825,29829,29831,29833,29835,29837,29897,29909,29910,29911,29968,30653,30688,30690,30727,30729,30731,30733,30735,21104,21105,21106,21107,21108,29839);
DELETE FROM `game_event_gameobject` WHERE `event`=24;
DELETE FROM `game_event` WHERE `entry`=25; -- Call to Arms: Unknown Event
DELETE FROM `gameobject` WHERE `guid` IN (34070,34073,34074,34076,34079,34080,34216,34217,34305,34796,34807,34860,34861,35029,35287);
DELETE FROM `game_event_gameobject` WHERE `event`=25;

/* FULL DELETES */
DELETE FROM `game_event_creature` WHERE `event` IN (18,19,20,21);
DELETE FROM `npc_gossip` WHERE `npc_guid` IN (SELECT `guid` FROM `creature` WHERE `id` IN (14991,14990,15102,15105,22013,22015,15103,15106)); -- Emissaries and Envoys
DELETE FROM `creature_addon` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id` IN (14991,14990,15102,15105,22013,22015,15103,15106)); -- Emissaries and Envoys
DELETE FROM `creature` WHERE `id` IN (14991,14990,15102,15105,22013,22015,15103,15106); -- Emissaries and Envoys
DELETE FROM `game_event_gameobject` WHERE `event` IN (18,19,20,21);
DELETE FROM `gameobject` WHERE `id` IN (180397,180398,180396,180394,180400,185106,185107,180399,180395); -- Banners

SET @TCGUID:=(select max(guid) from `creature`)+1; -- Set by TDB Team (need 923 - creature.guid)
SET @TGGUID:=(select max(guid) from `gameobject`)+1; -- Set by TDB team (need 396 - gameobject.guid)

/* Template updates */
-- Arathi Basin
SET @EnvoyH:=14990; -- Defilers Emissary                 /* Horde */
SET @EnvoyA:=14991; -- League of Arathor Emissary        /* Alliance */
SET @Battlemaster:=15008;  -- Lady Hoteshem              /* Stormwind */
SET @Battlemaster1:=857;   -- Donal Osgood               /* Ironforge */
SET @Battlemaster2:=907;   -- Keras Wolfheart            /* Darnassus */
SET @Battlemaster3:=20120; -- Tolo                       /* Exodar */
SET @Battlemaster4:=15006; -- Deze Snowbane              /* Orgrimmar */
SET @Battlemaster5:=15007; -- Sir Malory Wheeler         /* Undercity */
SET @Battlemaster6:=16694; -- Karen Wentworth            /* Silvermoon */
SET @Battlemaster7:=20274; -- Keldor the Lost            /* Shattarth - Horde */
SET @Battlemaster8:=20273; -- Adam Eternum               /* Shattrath - Alliance */
SET @Battlemaster9:=12198; -- Martin Lindsey             /* Thunder Bluff */
UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~4096,`MovementType`=0 WHERE `entry`=@Battlemaster3;
UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~4096,`npcflag`=`npcflag`&~128 WHERE `entry`=@Battlemaster4;
UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~4096 WHERE `entry`=@Battlemaster5;
UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~4096,`npcflag`=`npcflag`|1,`equipment_id`=2064,`MovementType`=0 WHERE `entry`=@Battlemaster6;
UPDATE `creature_template` SET `MovementType`=0 WHERE `entry`=@Battlemaster7;
UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~4096,`InhabitType`=3 WHERE `entry`=@Battlemaster9;

-- Warsong Gulch
SET @EnvoyH:=15102; -- Warsong Emissary             /* Horde */
SET @EnvoyA:=15105; -- Silverwing Emissary          /* Alliance */
SET @Battlemaster:=3890; -- Brakgul Deathbringer    /* Orgrimmar */
SET @Battlemaster1:=16696; -- Krukk                 /* Silvermoon */
SET @Battlemaster2:=10360; -- Kergul Bloodaxe       /* Thunder Bluff */
SET @Battlemaster3:=2804; -- Kruden Bloodclaw       /* Undercity */
SET @Battlemaster4:=20269; -- Montok Redhands       /* Shattarth - Horde */
SET @Battlemaster5:=2302; -- Aethalas               /* Darnassus */
SET @Battlemaster6:=14981; -- Elfarran              /* Stormwind */
SET @Battlemaster7:=14982; -- Lylandris             /* Ironforge */
SET @Battlemaster8:=20272; -- Lylandor              /* Shattrath - Alliance */
SET @Battlemaster9:=20118; -- Jihi                  /* Exodar */
UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~4096 WHERE `entry`=@Battlemaster;
UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~4096,`npcflag`=`npcflag`|1,`MovementType`=0 WHERE `entry`=@Battlemaster1;
UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~4096,`InhabitType`=3 WHERE `entry`=@Battlemaster2;
UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~4096 WHERE `entry`=@Battlemaster3;
UPDATE `creature_template` SET `MovementType`=0 WHERE `entry`=@Battlemaster9;

-- Eye of the Storm
SET @EnvoyH:=22015; -- Eye of the Storm Envoy               /* Horde */
SET @EnvoyA:=22013; -- Eye of the Storm Emissary            /* Alliance */
SET @Battlemaster:=20385; -- Andrissa Heartspear            /* Orgrimmar */
SET @Battlemaster1:=20390; -- Duyash the Cruel              /* Silvermoon */
SET @Battlemaster2:=20388; -- Althallen Brightblade         /* Thunder Bluff */
SET @Battlemaster3:=20386; -- Lyrlia Blackshield            /* Undercity */
SET @Battlemaster4:=20384; -- Yula the Fair                 /* Shattarth - Horde */
SET @Battlemaster5:=20383; -- Enlae                         /* Darnassus */
SET @Battlemaster6:=20381; -- Jovil                         /* Stormwind */
SET @Battlemaster7:=20374; -- Kandaar                       /* Ironforge */
SET @Battlemaster8:=20362; -- Iravar                        /* Shattrath - Alliance */
SET @Battlemaster9:=20382; -- Mitia                         /* Exodar */
UPDATE `creature_template` SET `MovementType`=0,`AIName`='' WHERE `entry`=@EnvoyA;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=@EnvoyH;
UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~4096 WHERE `entry`=@Battlemaster;
UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~4096,`MovementType`=0,`npcflag`=`npcflag`|1 WHERE `entry`=@Battlemaster1;
UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~4096,`MovementType`=0,`InhabitType`=3 WHERE `entry`=@Battlemaster2;
UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~4096,`MovementType`=0 WHERE `entry`=@Battlemaster3;
UPDATE `creature_template` SET `MovementType`=0 WHERE `entry`=@Battlemaster6;
UPDATE `creature_template` SET `MovementType`=0 WHERE `entry`=@Battlemaster7;
UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~4096,`MovementType`=0 WHERE `entry`=@Battlemaster9;

-- Alterac Valley
SET @EnvoyH:=15106; -- Frostwolf Emissary                   /* Horde */
SET @EnvoyA:=15103; -- Stormpike Emissary                   /* Alliance */
SET @Battlemaster:=14942; -- Kartra Bloodsnarl              /* Orgrimmar */
SET @Battlemaster1:=16695; -- Gurak                         /* Silvermoon */
SET @Battlemaster2:=7427; -- Taim Ragetotem                 /* Thunder Bluff */
SET @Battlemaster3:=347; -- Grizzle Halfmane                /* Undercity */
SET @Battlemaster4:=20276; -- Wolf-Sister Maka              /* Shattarth - Horde */
SET @Battlemaster5:=5118; -- Brogun Stoneshield             /* Darnassus */
SET @Battlemaster6:=7410; -- Thelman Slatefist              /* Stormwind */
SET @Battlemaster7:=12197; -- Glordrum Steelbeard           /* Ironforge */
SET @Battlemaster8:=20271; -- Haelga Slatefist              /* Shattrath - Alliance */
SET @Battlemaster9:=20119; -- Mahul                         /* Exodar */
UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~4096 WHERE `entry`=@EnvoyA;
UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~4096 WHERE `entry`=@Battlemaster;
UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~4096,`npcflag`=`npcflag`|1,`MovementType`=0 WHERE `entry`=@Battlemaster1;
UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~4096,`InhabitType`=3 WHERE `entry`=@Battlemaster2;
UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~4096 WHERE `entry`=@Battlemaster3;
UPDATE `creature_template` SET `MovementType`=0 WHERE `entry`=@Battlemaster6;
UPDATE `creature_template` SET `MovementType`=0 WHERE `entry`=@Battlemaster7;
UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~4096,`MovementType`=0 WHERE `entry`=@Battlemaster9;
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|2,`unit_flags`=`unit_flags`|256 WHERE `entry` IN (14991,14990,15102,15105,22013,22015,15103,15106,15008,857,907,20120,15006,15007,16694,20274,20273,12198,3890,16696,10360,2804,20269,2302,14981,14982,20272,20118,20385,20390,20388,20386,20384,20383,20381,20374,20362,20382,14942,16695,7427,347,20276,5118,7410,12197,20271,20119);
-- End templates

/* SHATTRATH */
SET @Event:=19; -- Call to Arms: Warsong Gulch!
SET @CGUID:=@TCGUID+0; -- Set by TDB Team (need 48) - creature.guid
SET @GGUID:=@TGGUID+0; -- Set by TDB team (need 23) - gameobject.guid
SET @BannerH:=180394; -- PVP HOLIDAY HORDE CTF
SET @BannerA:=180400; -- PVP HOLIDAY ALLIANCE CTF
SET @EnvoyA:=15102; -- Silverwing Emissary      /* Alliance */
SET @EnvoyH:=15105; -- Warsong Emissary         /* Horde */
-- Creature spawns
DELETE FROM `creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+47) AND `id` IN (@EnvoyH,@EnvoyA);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(@CGUID+0,@EnvoyH,530,1,1,0,0,-1666.54993,5192.018,-41.39052,3.71755123,120,0,0,1,0,0,0),
(@CGUID+1,@EnvoyH,530,1,1,0,0,-1669.92041,5188.145,-43.2296371,0.5235988,120,0,0,1,0,0,0),
(@CGUID+2,@EnvoyH,530,1,1,0,0,-1688.98291,5531.122,-40.49477,4.64257574,120,0,0,1,0,0,0),
(@CGUID+3,@EnvoyH,530,1,1,0,0,-1689.11841,5527.934,-40.3165779,1.50098312,120,0,0,1,0,0,0),
(@CGUID+4,@EnvoyH,530,1,1,0,0,-1738.01233,5147.58057,-37.121582,4.049164,120,0,0,1,0,0,0),
(@CGUID+5,@EnvoyH,530,1,1,0,0,-1797.06226,5479.807,-12.3448048,2.12930179,120,0,0,1,0,0,0),
(@CGUID+6,@EnvoyH,530,1,1,0,0,-1799.6311,5482.90967,-12.3448038,5.18362761,120,0,0,1,0,0,0),
(@CGUID+7,@EnvoyH,530,1,1,0,0,-1809.67578,5366.837,-12.3448009,3.92699075,120,0,0,1,0,0,0),
(@CGUID+8,@EnvoyH,530,1,1,0,0,-1812.38574,5364.03027,-12.3448,0.6981317,120,0,0,1,0,0,0),
(@CGUID+9,@EnvoyH,530,1,1,0,0,-1865.90991,5144.91064,-42.53244,1.86750233,120,0,0,1,0,0,0),
(@CGUID+10,@EnvoyH,530,1,1,0,0,-1867.22571,5148.13965,-43.1352577,4.97418833,120,0,0,1,0,0,0),
(@CGUID+11,@EnvoyH,530,1,1,0,0,-1908.20422,5433.956,-12.3448772,1.74532926,120,0,0,1,0,0,0),
(@CGUID+12,@EnvoyH,530,1,1,0,0,-1908.42578,5437.61035,-12.3448505,4.939282,120,0,0,1,0,0,0),
(@CGUID+13,@EnvoyH,530,1,1,0,0,-1912.37476,5497.59326,-12.3448029,3.66519141,120,0,0,1,0,0,0),
(@CGUID+14,@EnvoyH,530,1,1,0,0,-1915.72937,5495.289,-12.3448038,0.191986218,120,0,0,1,0,0,0),
(@CGUID+15,@EnvoyH,530,1,1,0,0,-1926.30664,5376.151,-12.3448048,2.11184835,120,0,0,1,0,0,0),
(@CGUID+16,@EnvoyH,530,1,1,0,0,-1928.93408,5379.564,-12.3448057,5.27089453,120,0,0,1,0,0,0),
(@CGUID+17,@EnvoyH,530,1,1,0,0,-1953.39954,5248.491,-42.64633,2.11184835,120,0,0,1,0,0,0),
(@CGUID+18,@EnvoyH,530,1,1,0,0,-1955.66626,5251.029,-42.3890228,5.323254,120,0,0,1,0,0,0),
(@CGUID+19,@EnvoyH,530,1,1,0,0,-2039.233,5331.151,-40.4660645,4.81710863,120,0,0,1,0,0,0),
(@CGUID+20,@EnvoyH,530,1,1,0,0,-2039.33167,5327.6084,-39.84314,1.553343,120,0,0,1,0,0,0),
(@CGUID+21,@EnvoyH,530,1,1,0,0,-2054.11353,5246.555,-39.2211,1.83259571,120,0,0,1,0,0,0),
(@CGUID+22,@EnvoyH,530,1,1,0,0,-2054.86865,5250.202,-38.9440231,5.061455,120,0,0,1,0,0,0),
(@CGUID+23,@EnvoyA,530,1,1,0,0,-1649.3158,5219.49854,-43.03097,4.502949,120,0,0,1,0,0,0),
(@CGUID+24,@EnvoyA,530,1,1,0,0,-1650.46008,5216.03,-42.1109962,1.2915436,120,0,0,1,0,0,0),
(@CGUID+25,@EnvoyA,530,1,1,0,0,-1667.33313,5410.56,-40.32267,1.60570288,120,0,0,1,0,0,0),
(@CGUID+26,@EnvoyA,530,1,1,0,0,-1667.34229,5413.182,-40.32267,4.78220224,120,0,0,1,0,0,0),
(@CGUID+27,@EnvoyA,530,1,1,0,0,-1676.7146,5504.09766,-40.3160324,2.65290046,120,0,0,1,0,0,0),
(@CGUID+28,@EnvoyA,530,1,1,0,0,-1678.97437,5505.95557,-40.30699,5.794493,120,0,0,1,0,0,0),
(@CGUID+29,@EnvoyA,530,1,1,0,0,-1764.38281,5158.26025,-37.121582,5.86430645,120,0,0,1,0,0,0),
(@CGUID+30,@EnvoyA,530,1,1,0,0,-1779.92188,5252.184,-40.12583,3.90953755,120,0,0,1,0,0,0),
(@CGUID+31,@EnvoyA,530,1,1,0,0,-1782.26257,5249.875,-40.12583,1.08210409,120,0,0,1,0,0,0),
(@CGUID+32,@EnvoyA,530,1,1,0,0,-1783.069,5451.48145,-12.3448048,1.76278257,120,0,0,1,0,0,0),
(@CGUID+33,@EnvoyA,530,1,1,0,0,-1784.13318,5455.847,-12.3448048,4.74729538,120,0,0,1,0,0,0),
(@CGUID+34,@EnvoyA,530,1,1,0,0,-1817.30334,5431.36768,-12.3449154,1.74532926,120,0,0,1,0,0,0),
(@CGUID+35,@EnvoyA,530,1,1,0,0,-1818.02954,5434.826,-12.3449459,4.60766935,120,0,0,1,0,0,0),
(@CGUID+36,@EnvoyA,530,1,1,0,0,-1839.07031,5148.27246,-42.8000221,4.29351,120,0,0,1,0,0,0),
(@CGUID+37,@EnvoyA,530,1,1,0,0,-1840.22827,5146.01025,-42.28271,0.9599311,120,0,0,1,0,0,0),
(@CGUID+38,@EnvoyA,530,1,1,0,0,-1846.33167,5347.47363,-12.3448009,3.8397243,120,0,0,1,0,0,0),
(@CGUID+39,@EnvoyA,530,1,1,0,0,-1850.33838,5346.85156,-12.344799,6.143559,120,0,0,1,0,0,0),
(@CGUID+40,@EnvoyA,530,1,1,0,0,-1881.61584,5512.388,-12.344799,3.90953755,120,0,0,1,0,0,0),
(@CGUID+41,@EnvoyA,530,1,1,0,0,-1885.313,5510.87256,-12.3447981,0.4537856,120,0,0,1,0,0,0),
(@CGUID+42,@EnvoyA,530,1,1,0,0,-1943.88672,5407.99951,-12.3448038,1.50098312,120,0,0,1,0,0,0),
(@CGUID+43,@EnvoyA,530,1,1,0,0,-1944.15674,5411.71338,-12.3448029,4.81710863,120,0,0,1,0,0,0),
(@CGUID+44,@EnvoyA,530,1,1,0,0,-2030.24573,5224.99072,-41.3888321,3.2986722,120,0,0,1,0,0,0),
(@CGUID+45,@EnvoyA,530,1,1,0,0,-2033.20508,5224.98633,-41.0004272,0.366519153,120,0,0,1,0,0,0),
(@CGUID+46,@EnvoyA,530,1,1,0,0,-2047.44922,5346.7,-40.70503,2.61799383,120,0,0,1,0,0,0),
(@CGUID+47,@EnvoyA,530,1,1,0,0,-2049.34033,5348.6,-40.99145,5.51524,120,0,0,1,0,0,0);
-- Event handling
DELETE FROM `game_event_creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+47) AND `event`=@Event;
INSERT INTO `game_event_creature` (`guid`,`event`) VALUES
(@CGUID+0,@Event),
(@CGUID+1,@Event),
(@CGUID+2,@Event),
(@CGUID+3,@Event),
(@CGUID+4,@Event),
(@CGUID+5,@Event),
(@CGUID+6,@Event),
(@CGUID+7,@Event),
(@CGUID+8,@Event),
(@CGUID+9,@Event),
(@CGUID+10,@Event),
(@CGUID+11,@Event),
(@CGUID+12,@Event),
(@CGUID+13,@Event),
(@CGUID+14,@Event),
(@CGUID+15,@Event),
(@CGUID+16,@Event),
(@CGUID+17,@Event),
(@CGUID+18,@Event),
(@CGUID+19,@Event),
(@CGUID+20,@Event),
(@CGUID+21,@Event),
(@CGUID+22,@Event),
(@CGUID+23,@Event),
(@CGUID+24,@Event),
(@CGUID+25,@Event),
(@CGUID+26,@Event),
(@CGUID+27,@Event),
(@CGUID+28,@Event),
(@CGUID+29,@Event),
(@CGUID+30,@Event),
(@CGUID+31,@Event),
(@CGUID+32,@Event),
(@CGUID+33,@Event),
(@CGUID+34,@Event),
(@CGUID+35,@Event),
(@CGUID+36,@Event),
(@CGUID+37,@Event),
(@CGUID+38,@Event),
(@CGUID+39,@Event),
(@CGUID+40,@Event),
(@CGUID+41,@Event),
(@CGUID+42,@Event),
(@CGUID+43,@Event),
(@CGUID+44,@Event),
(@CGUID+45,@Event),
(@CGUID+46,@Event),
(@CGUID+47,@Event);
-- GOs spawns
DELETE FROM `gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+22) AND `id` IN (@BannerH,@BannerA);
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@GGUID+0,@BannerH,530,1,1,-1667.10767,5188.30225,-41.6863136,2.042035,0,0,0,0,120,0,1),
(@GGUID+1,@BannerH,530,1,1,-1691.07117,5529.88037,-40.4825974,0.087266,0,0,0,0,120,0,1),
(@GGUID+2,@BannerH,530,1,1,-1801.231,5480.01855,-12.42814,0.610863447,0,0,0,0,120,0,1),
(@GGUID+3,@BannerH,530,1,1,-1812.53772,5367.465,-12.4281368,-0.820303261,0,0,0,0,120,0,1),
(@GGUID+4,@BannerH,530,1,1,-1869.243,5145.453,-43.818985,0.2792516,0,0,0,0,120,0,1),
(@GGUID+5,@BannerH,530,1,1,-1910.95142,5434.89746,-12.4907084,0.43633157,0,0,0,0,120,0,1),
(@GGUID+6,@BannerH,530,1,1,-1913.29822,5494.24268,-12.4281359,1.97221982,0,0,0,0,120,0,1),
(@GGUID+7,@BannerH,530,1,1,-1925.67749,5379.22168,-12.4281406,-2.19911456,0,0,0,0,120,0,1),
(@GGUID+8,@BannerH,530,1,1,-1951.99475,5251.258,-42.77694,-2.44346023,0,0,0,0,120,0,1),
(@GGUID+9,@BannerH,530,1,1,-2038.02087,5329.28564,-40.1177063,-3.001947,0,0,0,0,120,0,1),
(@GGUID+10,@BannerH,530,1,1,-2057.12671,5247.489,-38.884613,0.401424885,0,0,0,0,120,0,1),
(@GGUID+11,@BannerA,530,1,1,-1648.12854,5217.744,-42.667366,3.07176614,0,0,0,0,120,0,1),
(@GGUID+12,@BannerA,530,1,1,-1669.15454,5412.663,-40.52406,0.0174524616,0,0,0,0,120,0,1),
(@GGUID+13,@BannerA,530,1,1,-1679.29346,5503.415,-40.4979973,0.837757468,0,0,0,0,120,0,1),
(@GGUID+14,@BannerA,530,1,1,-1782.78479,5252.724,-40.306385,-0.837757468,0,0,0,0,120,0,1),
(@GGUID+15,@BannerA,530,1,1,-1785.69788,5453.39258,-12.52536,0.261798173,0,0,0,0,120,0,1),
(@GGUID+16,@BannerA,530,1,1,-1815.17712,5433.53369,-12.4560528,-2.98449826,0,0,0,0,120,0,1),
(@GGUID+17,@BannerA,530,1,1,-1837.35413,5146.71,-42.902,2.77506852,0,0,0,0,120,0,1),
(@GGUID+18,@BannerA,530,1,1,-1848.79688,5349.164,-12.5184069,-1.41371512,0,0,0,0,120,0,1),
(@GGUID+19,@BannerA,530,1,1,-1882.48438,5509.6416,-12.5392437,1.93731225,0,0,0,0,120,0,1),
(@GGUID+20,@BannerA,530,1,1,-1941.74658,5409.936,-12.4698048,-3.124123,0,0,0,0,120,0,1),
(@GGUID+21,@BannerA,530,1,1,-2032.07642,5222.19531,-40.8450165,1.51843619,0,0,0,0,120,0,1),
(@GGUID+22,@BannerA,530,1,1,-2047.22229,5349.404,-41.08727,-2.042035,0,0,0,0,120,0,1);
-- Event Handling
DELETE FROM `game_event_gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+22) AND `event`=@Event;
INSERT INTO `game_event_gameobject` (`guid`,`event`) VALUES
(@GGUID+0,@Event),
(@GGUID+1,@Event),
(@GGUID+2,@Event),
(@GGUID+3,@Event),
(@GGUID+4,@Event),
(@GGUID+5,@Event),
(@GGUID+6,@Event),
(@GGUID+7,@Event),
(@GGUID+8,@Event),
(@GGUID+9,@Event),
(@GGUID+10,@Event),
(@GGUID+11,@Event),
(@GGUID+12,@Event),
(@GGUID+13,@Event),
(@GGUID+14,@Event),
(@GGUID+15,@Event),
(@GGUID+16,@Event),
(@GGUID+17,@Event),
(@GGUID+18,@Event),
(@GGUID+19,@Event),
(@GGUID+20,@Event),
(@GGUID+21,@Event),
(@GGUID+22,@Event);

SET @Event:=20; -- Call to Arms: Arathi Basin!
SET @CGUID:=@TCGUID+148; -- Set by TDB Team (need 48) - creature.guid
SET @GGUID:=@TGGUID+69; -- Set by TDB team (need 23) - gameobject.guid
SET @BannerH:=180396; -- PVP HOLIDAY HORDE ARATHI
SET @BannerA:=180398; -- PVP HOLIDAY ALLIANCE ARATHI
SET @EnvoyA:=14991; -- League of Arathor Emissary /* Alliance*/
SET @EnvoyH:=14990; -- Defilers Emissary          /* Horde */
-- Creature spawns
DELETE FROM `creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+47) AND `id` IN (@EnvoyH,@EnvoyA);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(@CGUID+0,@EnvoyH,530,1,1,0,0,-1666.54993,5192.018,-41.39052,3.71755123,120,0,0,1,0,0,0),
(@CGUID+1,@EnvoyH,530,1,1,0,0,-1669.92041,5188.145,-43.2296371,0.5235988,120,0,0,1,0,0,0),
(@CGUID+2,@EnvoyH,530,1,1,0,0,-1688.98291,5531.122,-40.49477,4.64257574,120,0,0,1,0,0,0),
(@CGUID+3,@EnvoyH,530,1,1,0,0,-1689.11841,5527.934,-40.3165779,1.50098312,120,0,0,1,0,0,0),
(@CGUID+4,@EnvoyH,530,1,1,0,0,-1738.01233,5147.58057,-37.121582,4.049164,120,0,0,1,0,0,0),
(@CGUID+5,@EnvoyH,530,1,1,0,0,-1797.06226,5479.807,-12.3448048,2.12930179,120,0,0,1,0,0,0),
(@CGUID+6,@EnvoyH,530,1,1,0,0,-1799.6311,5482.90967,-12.3448038,5.18362761,120,0,0,1,0,0,0),
(@CGUID+7,@EnvoyH,530,1,1,0,0,-1809.67578,5366.837,-12.3448009,3.92699075,120,0,0,1,0,0,0),
(@CGUID+8,@EnvoyH,530,1,1,0,0,-1812.38574,5364.03027,-12.3448,0.6981317,120,0,0,1,0,0,0),
(@CGUID+9,@EnvoyH,530,1,1,0,0,-1865.90991,5144.91064,-42.53244,1.86750233,120,0,0,1,0,0,0),
(@CGUID+10,@EnvoyH,530,1,1,0,0,-1867.22571,5148.13965,-43.1352577,4.97418833,120,0,0,1,0,0,0),
(@CGUID+11,@EnvoyH,530,1,1,0,0,-1908.20422,5433.956,-12.3448772,1.74532926,120,0,0,1,0,0,0),
(@CGUID+12,@EnvoyH,530,1,1,0,0,-1908.42578,5437.61035,-12.3448505,4.939282,120,0,0,1,0,0,0),
(@CGUID+13,@EnvoyH,530,1,1,0,0,-1912.37476,5497.59326,-12.3448029,3.66519141,120,0,0,1,0,0,0),
(@CGUID+14,@EnvoyH,530,1,1,0,0,-1915.72937,5495.289,-12.3448038,0.191986218,120,0,0,1,0,0,0),
(@CGUID+15,@EnvoyH,530,1,1,0,0,-1926.30664,5376.151,-12.3448048,2.11184835,120,0,0,1,0,0,0),
(@CGUID+16,@EnvoyH,530,1,1,0,0,-1928.93408,5379.564,-12.3448057,5.27089453,120,0,0,1,0,0,0),
(@CGUID+17,@EnvoyH,530,1,1,0,0,-1953.39954,5248.491,-42.64633,2.11184835,120,0,0,1,0,0,0),
(@CGUID+18,@EnvoyH,530,1,1,0,0,-1955.66626,5251.029,-42.3890228,5.323254,120,0,0,1,0,0,0),
(@CGUID+19,@EnvoyH,530,1,1,0,0,-2039.233,5331.151,-40.4660645,4.81710863,120,0,0,1,0,0,0),
(@CGUID+20,@EnvoyH,530,1,1,0,0,-2039.33167,5327.6084,-39.84314,1.553343,120,0,0,1,0,0,0),
(@CGUID+21,@EnvoyH,530,1,1,0,0,-2054.11353,5246.555,-39.2211,1.83259571,120,0,0,1,0,0,0),
(@CGUID+22,@EnvoyH,530,1,1,0,0,-2054.86865,5250.202,-38.9440231,5.061455,120,0,0,1,0,0,0),
(@CGUID+23,@EnvoyA,530,1,1,0,0,-1649.3158,5219.49854,-43.03097,4.502949,120,0,0,1,0,0,0),
(@CGUID+24,@EnvoyA,530,1,1,0,0,-1650.46008,5216.03,-42.1109962,1.2915436,120,0,0,1,0,0,0),
(@CGUID+25,@EnvoyA,530,1,1,0,0,-1667.33313,5410.56,-40.32267,1.60570288,120,0,0,1,0,0,0),
(@CGUID+26,@EnvoyA,530,1,1,0,0,-1667.34229,5413.182,-40.32267,4.78220224,120,0,0,1,0,0,0),
(@CGUID+27,@EnvoyA,530,1,1,0,0,-1676.7146,5504.09766,-40.3160324,2.65290046,120,0,0,1,0,0,0),
(@CGUID+28,@EnvoyA,530,1,1,0,0,-1678.97437,5505.95557,-40.30699,5.794493,120,0,0,1,0,0,0),
(@CGUID+29,@EnvoyA,530,1,1,0,0,-1764.38281,5158.26025,-37.121582,5.86430645,120,0,0,1,0,0,0),
(@CGUID+30,@EnvoyA,530,1,1,0,0,-1779.92188,5252.184,-40.12583,3.90953755,120,0,0,1,0,0,0),
(@CGUID+31,@EnvoyA,530,1,1,0,0,-1782.26257,5249.875,-40.12583,1.08210409,120,0,0,1,0,0,0),
(@CGUID+32,@EnvoyA,530,1,1,0,0,-1783.069,5451.48145,-12.3448048,1.76278257,120,0,0,1,0,0,0),
(@CGUID+33,@EnvoyA,530,1,1,0,0,-1784.13318,5455.847,-12.3448048,4.74729538,120,0,0,1,0,0,0),
(@CGUID+34,@EnvoyA,530,1,1,0,0,-1817.30334,5431.36768,-12.3449154,1.74532926,120,0,0,1,0,0,0),
(@CGUID+35,@EnvoyA,530,1,1,0,0,-1818.02954,5434.826,-12.3449459,4.60766935,120,0,0,1,0,0,0),
(@CGUID+36,@EnvoyA,530,1,1,0,0,-1839.07031,5148.27246,-42.8000221,4.29351,120,0,0,1,0,0,0),
(@CGUID+37,@EnvoyA,530,1,1,0,0,-1840.22827,5146.01025,-42.28271,0.9599311,120,0,0,1,0,0,0),
(@CGUID+38,@EnvoyA,530,1,1,0,0,-1846.33167,5347.47363,-12.3448009,3.8397243,120,0,0,1,0,0,0),
(@CGUID+39,@EnvoyA,530,1,1,0,0,-1850.33838,5346.85156,-12.344799,6.143559,120,0,0,1,0,0,0),
(@CGUID+40,@EnvoyA,530,1,1,0,0,-1881.61584,5512.388,-12.344799,3.90953755,120,0,0,1,0,0,0),
(@CGUID+41,@EnvoyA,530,1,1,0,0,-1885.313,5510.87256,-12.3447981,0.4537856,120,0,0,1,0,0,0),
(@CGUID+42,@EnvoyA,530,1,1,0,0,-1943.88672,5407.99951,-12.3448038,1.50098312,120,0,0,1,0,0,0),
(@CGUID+43,@EnvoyA,530,1,1,0,0,-1944.15674,5411.71338,-12.3448029,4.81710863,120,0,0,1,0,0,0),
(@CGUID+44,@EnvoyA,530,1,1,0,0,-2030.24573,5224.99072,-41.3888321,3.2986722,120,0,0,1,0,0,0),
(@CGUID+45,@EnvoyA,530,1,1,0,0,-2033.20508,5224.98633,-41.0004272,0.366519153,120,0,0,1,0,0,0),
(@CGUID+46,@EnvoyA,530,1,1,0,0,-2047.44922,5346.7,-40.70503,2.61799383,120,0,0,1,0,0,0),
(@CGUID+47,@EnvoyA,530,1,1,0,0,-2049.34033,5348.6,-40.99145,5.51524,120,0,0,1,0,0,0);
-- Event handling
DELETE FROM `game_event_creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+47) AND `event`=@Event;
INSERT INTO `game_event_creature` (`guid`,`event`) VALUES
(@CGUID+0,@Event),
(@CGUID+1,@Event),
(@CGUID+2,@Event),
(@CGUID+3,@Event),
(@CGUID+4,@Event),
(@CGUID+5,@Event),
(@CGUID+6,@Event),
(@CGUID+7,@Event),
(@CGUID+8,@Event),
(@CGUID+9,@Event),
(@CGUID+10,@Event),
(@CGUID+11,@Event),
(@CGUID+12,@Event),
(@CGUID+13,@Event),
(@CGUID+14,@Event),
(@CGUID+15,@Event),
(@CGUID+16,@Event),
(@CGUID+17,@Event),
(@CGUID+18,@Event),
(@CGUID+19,@Event),
(@CGUID+20,@Event),
(@CGUID+21,@Event),
(@CGUID+22,@Event),
(@CGUID+23,@Event),
(@CGUID+24,@Event),
(@CGUID+25,@Event),
(@CGUID+26,@Event),
(@CGUID+27,@Event),
(@CGUID+28,@Event),
(@CGUID+29,@Event),
(@CGUID+30,@Event),
(@CGUID+31,@Event),
(@CGUID+32,@Event),
(@CGUID+33,@Event),
(@CGUID+34,@Event),
(@CGUID+35,@Event),
(@CGUID+36,@Event),
(@CGUID+37,@Event),
(@CGUID+38,@Event),
(@CGUID+39,@Event),
(@CGUID+40,@Event),
(@CGUID+41,@Event),
(@CGUID+42,@Event),
(@CGUID+43,@Event),
(@CGUID+44,@Event),
(@CGUID+45,@Event),
(@CGUID+46,@Event),
(@CGUID+47,@Event);
-- GOs spawns
DELETE FROM `gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+22) AND `id` IN (@BannerH,@BannerA);
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@GGUID+0,@BannerH,530,1,1,-1667.10767,5188.30225,-41.6863136,2.042035,0,0,0,0,120,0,1),
(@GGUID+1,@BannerH,530,1,1,-1691.07117,5529.88037,-40.4825974,0.087266,0,0,0,0,120,0,1),
(@GGUID+2,@BannerH,530,1,1,-1801.231,5480.01855,-12.42814,0.610863447,0,0,0,0,120,0,1),
(@GGUID+3,@BannerH,530,1,1,-1812.53772,5367.465,-12.4281368,-0.820303261,0,0,0,0,120,0,1),
(@GGUID+4,@BannerH,530,1,1,-1869.243,5145.453,-43.818985,0.2792516,0,0,0,0,120,0,1),
(@GGUID+5,@BannerH,530,1,1,-1910.95142,5434.89746,-12.4907084,0.43633157,0,0,0,0,120,0,1),
(@GGUID+6,@BannerH,530,1,1,-1913.29822,5494.24268,-12.4281359,1.97221982,0,0,0,0,120,0,1),
(@GGUID+7,@BannerH,530,1,1,-1925.67749,5379.22168,-12.4281406,-2.19911456,0,0,0,0,120,0,1),
(@GGUID+8,@BannerH,530,1,1,-1951.99475,5251.258,-42.77694,-2.44346023,0,0,0,0,120,0,1),
(@GGUID+9,@BannerH,530,1,1,-2038.02087,5329.28564,-40.1177063,-3.001947,0,0,0,0,120,0,1),
(@GGUID+10,@BannerH,530,1,1,-2057.12671,5247.489,-38.884613,0.401424885,0,0,0,0,120,0,1),
(@GGUID+11,@BannerA,530,1,1,-1648.12854,5217.744,-42.667366,3.07176614,0,0,0,0,120,0,1),
(@GGUID+12,@BannerA,530,1,1,-1669.15454,5412.663,-40.52406,0.0174524616,0,0,0,0,120,0,1),
(@GGUID+13,@BannerA,530,1,1,-1679.29346,5503.415,-40.4979973,0.837757468,0,0,0,0,120,0,1),
(@GGUID+14,@BannerA,530,1,1,-1782.78479,5252.724,-40.306385,-0.837757468,0,0,0,0,120,0,1),
(@GGUID+15,@BannerA,530,1,1,-1785.69788,5453.39258,-12.52536,0.261798173,0,0,0,0,120,0,1),
(@GGUID+16,@BannerA,530,1,1,-1815.17712,5433.53369,-12.4560528,-2.98449826,0,0,0,0,120,0,1),
(@GGUID+17,@BannerA,530,1,1,-1837.35413,5146.71,-42.902,2.77506852,0,0,0,0,120,0,1),
(@GGUID+18,@BannerA,530,1,1,-1848.79688,5349.164,-12.5184069,-1.41371512,0,0,0,0,120,0,1),
(@GGUID+19,@BannerA,530,1,1,-1882.48438,5509.6416,-12.5392437,1.93731225,0,0,0,0,120,0,1),
(@GGUID+20,@BannerA,530,1,1,-1941.74658,5409.936,-12.4698048,-3.124123,0,0,0,0,120,0,1),
(@GGUID+21,@BannerA,530,1,1,-2032.07642,5222.19531,-40.8450165,1.51843619,0,0,0,0,120,0,1),
(@GGUID+22,@BannerA,530,1,1,-2047.22229,5349.404,-41.08727,-2.042035,0,0,0,0,120,0,1);
-- Event Handling
DELETE FROM `game_event_gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+22) AND `event`=@Event;
INSERT INTO `game_event_gameobject` (`guid`,`event`) VALUES
(@GGUID+0,@Event),
(@GGUID+1,@Event),
(@GGUID+2,@Event),
(@GGUID+3,@Event),
(@GGUID+4,@Event),
(@GGUID+5,@Event),
(@GGUID+6,@Event),
(@GGUID+7,@Event),
(@GGUID+8,@Event),
(@GGUID+9,@Event),
(@GGUID+10,@Event),
(@GGUID+11,@Event),
(@GGUID+12,@Event),
(@GGUID+13,@Event),
(@GGUID+14,@Event),
(@GGUID+15,@Event),
(@GGUID+16,@Event),
(@GGUID+17,@Event),
(@GGUID+18,@Event),
(@GGUID+19,@Event),
(@GGUID+20,@Event),
(@GGUID+21,@Event),
(@GGUID+22,@Event);

SET @Event:=21; -- Call to Arms: Eye of the Storm!
SET @CGUID:=@TCGUID+198; -- Set by TDB Team (need 48) - creature.guid
SET @GGUID:=@TGGUID+92; -- Set by TDB team (need 23) - gameobject.guid
SET @BannerH:=185106; -- Blood Elf Banner
SET @BannerA:=185107; -- Draenei Banner
SET @EnvoyA:=22013; -- Eye of the Storm Emissary    /* ALLIANCE */
SET @EnvoyH:=22015; -- Eye of the Storm Envoy       /* Horde */
-- Creature spawns
DELETE FROM `creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+47) AND `id` IN (@EnvoyH,@EnvoyA);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(@CGUID+0,@EnvoyH,530,1,1,0,0,-1666.54993,5192.018,-41.39052,3.71755123,120,0,0,1,0,0,0),
(@CGUID+1,@EnvoyH,530,1,1,0,0,-1669.92041,5188.145,-43.2296371,0.5235988,120,0,0,1,0,0,0),
(@CGUID+2,@EnvoyH,530,1,1,0,0,-1688.98291,5531.122,-40.49477,4.64257574,120,0,0,1,0,0,0),
(@CGUID+3,@EnvoyH,530,1,1,0,0,-1689.11841,5527.934,-40.3165779,1.50098312,120,0,0,1,0,0,0),
(@CGUID+4,@EnvoyH,530,1,1,0,0,-1738.01233,5147.58057,-37.121582,4.049164,120,0,0,1,0,0,0),
(@CGUID+5,@EnvoyH,530,1,1,0,0,-1797.06226,5479.807,-12.3448048,2.12930179,120,0,0,1,0,0,0),
(@CGUID+6,@EnvoyH,530,1,1,0,0,-1799.6311,5482.90967,-12.3448038,5.18362761,120,0,0,1,0,0,0),
(@CGUID+7,@EnvoyH,530,1,1,0,0,-1809.67578,5366.837,-12.3448009,3.92699075,120,0,0,1,0,0,0),
(@CGUID+8,@EnvoyH,530,1,1,0,0,-1812.38574,5364.03027,-12.3448,0.6981317,120,0,0,1,0,0,0),
(@CGUID+9,@EnvoyH,530,1,1,0,0,-1865.90991,5144.91064,-42.53244,1.86750233,120,0,0,1,0,0,0),
(@CGUID+10,@EnvoyH,530,1,1,0,0,-1867.22571,5148.13965,-43.1352577,4.97418833,120,0,0,1,0,0,0),
(@CGUID+11,@EnvoyH,530,1,1,0,0,-1908.20422,5433.956,-12.3448772,1.74532926,120,0,0,1,0,0,0),
(@CGUID+12,@EnvoyH,530,1,1,0,0,-1908.42578,5437.61035,-12.3448505,4.939282,120,0,0,1,0,0,0),
(@CGUID+13,@EnvoyH,530,1,1,0,0,-1912.37476,5497.59326,-12.3448029,3.66519141,120,0,0,1,0,0,0),
(@CGUID+14,@EnvoyH,530,1,1,0,0,-1915.72937,5495.289,-12.3448038,0.191986218,120,0,0,1,0,0,0),
(@CGUID+15,@EnvoyH,530,1,1,0,0,-1926.30664,5376.151,-12.3448048,2.11184835,120,0,0,1,0,0,0),
(@CGUID+16,@EnvoyH,530,1,1,0,0,-1928.93408,5379.564,-12.3448057,5.27089453,120,0,0,1,0,0,0),
(@CGUID+17,@EnvoyH,530,1,1,0,0,-1953.39954,5248.491,-42.64633,2.11184835,120,0,0,1,0,0,0),
(@CGUID+18,@EnvoyH,530,1,1,0,0,-1955.66626,5251.029,-42.3890228,5.323254,120,0,0,1,0,0,0),
(@CGUID+19,@EnvoyH,530,1,1,0,0,-2039.233,5331.151,-40.4660645,4.81710863,120,0,0,1,0,0,0),
(@CGUID+20,@EnvoyH,530,1,1,0,0,-2039.33167,5327.6084,-39.84314,1.553343,120,0,0,1,0,0,0),
(@CGUID+21,@EnvoyH,530,1,1,0,0,-2054.11353,5246.555,-39.2211,1.83259571,120,0,0,1,0,0,0),
(@CGUID+22,@EnvoyH,530,1,1,0,0,-2054.86865,5250.202,-38.9440231,5.061455,120,0,0,1,0,0,0),
(@CGUID+23,@EnvoyA,530,1,1,0,0,-1649.3158,5219.49854,-43.03097,4.502949,120,0,0,1,0,0,0),
(@CGUID+24,@EnvoyA,530,1,1,0,0,-1650.46008,5216.03,-42.1109962,1.2915436,120,0,0,1,0,0,0),
(@CGUID+25,@EnvoyA,530,1,1,0,0,-1667.33313,5410.56,-40.32267,1.60570288,120,0,0,1,0,0,0),
(@CGUID+26,@EnvoyA,530,1,1,0,0,-1667.34229,5413.182,-40.32267,4.78220224,120,0,0,1,0,0,0),
(@CGUID+27,@EnvoyA,530,1,1,0,0,-1676.7146,5504.09766,-40.3160324,2.65290046,120,0,0,1,0,0,0),
(@CGUID+28,@EnvoyA,530,1,1,0,0,-1678.97437,5505.95557,-40.30699,5.794493,120,0,0,1,0,0,0),
(@CGUID+29,@EnvoyA,530,1,1,0,0,-1764.38281,5158.26025,-37.121582,5.86430645,120,0,0,1,0,0,0),
(@CGUID+30,@EnvoyA,530,1,1,0,0,-1779.92188,5252.184,-40.12583,3.90953755,120,0,0,1,0,0,0),
(@CGUID+31,@EnvoyA,530,1,1,0,0,-1782.26257,5249.875,-40.12583,1.08210409,120,0,0,1,0,0,0),
(@CGUID+32,@EnvoyA,530,1,1,0,0,-1783.069,5451.48145,-12.3448048,1.76278257,120,0,0,1,0,0,0),
(@CGUID+33,@EnvoyA,530,1,1,0,0,-1784.13318,5455.847,-12.3448048,4.74729538,120,0,0,1,0,0,0),
(@CGUID+34,@EnvoyA,530,1,1,0,0,-1817.30334,5431.36768,-12.3449154,1.74532926,120,0,0,1,0,0,0),
(@CGUID+35,@EnvoyA,530,1,1,0,0,-1818.02954,5434.826,-12.3449459,4.60766935,120,0,0,1,0,0,0),
(@CGUID+36,@EnvoyA,530,1,1,0,0,-1839.07031,5148.27246,-42.8000221,4.29351,120,0,0,1,0,0,0),
(@CGUID+37,@EnvoyA,530,1,1,0,0,-1840.22827,5146.01025,-42.28271,0.9599311,120,0,0,1,0,0,0),
(@CGUID+38,@EnvoyA,530,1,1,0,0,-1846.33167,5347.47363,-12.3448009,3.8397243,120,0,0,1,0,0,0),
(@CGUID+39,@EnvoyA,530,1,1,0,0,-1850.33838,5346.85156,-12.344799,6.143559,120,0,0,1,0,0,0),
(@CGUID+40,@EnvoyA,530,1,1,0,0,-1881.61584,5512.388,-12.344799,3.90953755,120,0,0,1,0,0,0),
(@CGUID+41,@EnvoyA,530,1,1,0,0,-1885.313,5510.87256,-12.3447981,0.4537856,120,0,0,1,0,0,0),
(@CGUID+42,@EnvoyA,530,1,1,0,0,-1943.88672,5407.99951,-12.3448038,1.50098312,120,0,0,1,0,0,0),
(@CGUID+43,@EnvoyA,530,1,1,0,0,-1944.15674,5411.71338,-12.3448029,4.81710863,120,0,0,1,0,0,0),
(@CGUID+44,@EnvoyA,530,1,1,0,0,-2030.24573,5224.99072,-41.3888321,3.2986722,120,0,0,1,0,0,0),
(@CGUID+45,@EnvoyA,530,1,1,0,0,-2033.20508,5224.98633,-41.0004272,0.366519153,120,0,0,1,0,0,0),
(@CGUID+46,@EnvoyA,530,1,1,0,0,-2047.44922,5346.7,-40.70503,2.61799383,120,0,0,1,0,0,0),
(@CGUID+47,@EnvoyA,530,1,1,0,0,-2049.34033,5348.6,-40.99145,5.51524,120,0,0,1,0,0,0);
-- Event handling
DELETE FROM `game_event_creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+47) AND `event`=@Event;
INSERT INTO `game_event_creature` (`guid`,`event`) VALUES
(@CGUID+0,@Event),
(@CGUID+1,@Event),
(@CGUID+2,@Event),
(@CGUID+3,@Event),
(@CGUID+4,@Event),
(@CGUID+5,@Event),
(@CGUID+6,@Event),
(@CGUID+7,@Event),
(@CGUID+8,@Event),
(@CGUID+9,@Event),
(@CGUID+10,@Event),
(@CGUID+11,@Event),
(@CGUID+12,@Event),
(@CGUID+13,@Event),
(@CGUID+14,@Event),
(@CGUID+15,@Event),
(@CGUID+16,@Event),
(@CGUID+17,@Event),
(@CGUID+18,@Event),
(@CGUID+19,@Event),
(@CGUID+20,@Event),
(@CGUID+21,@Event),
(@CGUID+22,@Event),
(@CGUID+23,@Event),
(@CGUID+24,@Event),
(@CGUID+25,@Event),
(@CGUID+26,@Event),
(@CGUID+27,@Event),
(@CGUID+28,@Event),
(@CGUID+29,@Event),
(@CGUID+30,@Event),
(@CGUID+31,@Event),
(@CGUID+32,@Event),
(@CGUID+33,@Event),
(@CGUID+34,@Event),
(@CGUID+35,@Event),
(@CGUID+36,@Event),
(@CGUID+37,@Event),
(@CGUID+38,@Event),
(@CGUID+39,@Event),
(@CGUID+40,@Event),
(@CGUID+41,@Event),
(@CGUID+42,@Event),
(@CGUID+43,@Event),
(@CGUID+44,@Event),
(@CGUID+45,@Event),
(@CGUID+46,@Event),
(@CGUID+47,@Event),
(@CGUID+48,@Event),
(@CGUID+49,@Event);
-- GOs spawns
DELETE FROM `gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+22) AND `id` IN (@BannerH,@BannerA);
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@GGUID+0,@BannerH,530,1,1,-1667.10767,5188.30225,-41.6863136,2.042035,0,0,0,0,120,0,1),
(@GGUID+1,@BannerH,530,1,1,-1691.07117,5529.88037,-40.4825974,0.087266,0,0,0,0,120,0,1),
(@GGUID+2,@BannerH,530,1,1,-1801.231,5480.01855,-12.42814,0.610863447,0,0,0,0,120,0,1),
(@GGUID+3,@BannerH,530,1,1,-1812.53772,5367.465,-12.4281368,-0.820303261,0,0,0,0,120,0,1),
(@GGUID+4,@BannerH,530,1,1,-1869.243,5145.453,-43.818985,0.2792516,0,0,0,0,120,0,1),
(@GGUID+5,@BannerH,530,1,1,-1910.95142,5434.89746,-12.4907084,0.43633157,0,0,0,0,120,0,1),
(@GGUID+6,@BannerH,530,1,1,-1913.29822,5494.24268,-12.4281359,1.97221982,0,0,0,0,120,0,1),
(@GGUID+7,@BannerH,530,1,1,-1925.67749,5379.22168,-12.4281406,-2.19911456,0,0,0,0,120,0,1),
(@GGUID+8,@BannerH,530,1,1,-1951.99475,5251.258,-42.77694,-2.44346023,0,0,0,0,120,0,1),
(@GGUID+9,@BannerH,530,1,1,-2038.02087,5329.28564,-40.1177063,-3.001947,0,0,0,0,120,0,1),
(@GGUID+10,@BannerH,530,1,1,-2057.12671,5247.489,-38.884613,0.401424885,0,0,0,0,120,0,1),
(@GGUID+11,@BannerA,530,1,1,-1648.12854,5217.744,-42.667366,3.07176614,0,0,0,0,120,0,1),
(@GGUID+12,@BannerA,530,1,1,-1669.15454,5412.663,-40.52406,0.0174524616,0,0,0,0,120,0,1),
(@GGUID+13,@BannerA,530,1,1,-1679.29346,5503.415,-40.4979973,0.837757468,0,0,0,0,120,0,1),
(@GGUID+14,@BannerA,530,1,1,-1782.78479,5252.724,-40.306385,-0.837757468,0,0,0,0,120,0,1),
(@GGUID+15,@BannerA,530,1,1,-1785.69788,5453.39258,-12.52536,0.261798173,0,0,0,0,120,0,1),
(@GGUID+16,@BannerA,530,1,1,-1815.17712,5433.53369,-12.4560528,-2.98449826,0,0,0,0,120,0,1),
(@GGUID+17,@BannerA,530,1,1,-1837.35413,5146.71,-42.902,2.77506852,0,0,0,0,120,0,1),
(@GGUID+18,@BannerA,530,1,1,-1848.79688,5349.164,-12.5184069,-1.41371512,0,0,0,0,120,0,1),
(@GGUID+19,@BannerA,530,1,1,-1882.48438,5509.6416,-12.5392437,1.93731225,0,0,0,0,120,0,1),
(@GGUID+20,@BannerA,530,1,1,-1941.74658,5409.936,-12.4698048,-3.124123,0,0,0,0,120,0,1),
(@GGUID+21,@BannerA,530,1,1,-2032.07642,5222.19531,-40.8450165,1.51843619,0,0,0,0,120,0,1),
(@GGUID+22,@BannerA,530,1,1,-2047.22229,5349.404,-41.08727,-2.042035,0,0,0,0,120,0,1);
-- Event Handling
DELETE FROM `game_event_gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+22) AND `event`=@Event;
INSERT INTO `game_event_gameobject` (`guid`,`event`) VALUES
(@GGUID+0,@Event),
(@GGUID+1,@Event),
(@GGUID+2,@Event),
(@GGUID+3,@Event),
(@GGUID+4,@Event),
(@GGUID+5,@Event),
(@GGUID+6,@Event),
(@GGUID+7,@Event),
(@GGUID+8,@Event),
(@GGUID+9,@Event),
(@GGUID+10,@Event),
(@GGUID+11,@Event),
(@GGUID+12,@Event),
(@GGUID+13,@Event),
(@GGUID+14,@Event),
(@GGUID+15,@Event),
(@GGUID+16,@Event),
(@GGUID+17,@Event),
(@GGUID+18,@Event),
(@GGUID+19,@Event),
(@GGUID+20,@Event),
(@GGUID+21,@Event),
(@GGUID+22,@Event);

SET @Event:=18; -- Call to Arms: Alterac Valley!
SET @CGUID:=@TCGUID+248; -- Set by TDB Team (need 48) - creature.guid
SET @GGUID:=@TGGUID+115; -- Set by TDB team (need 23) - gameobject.guid
SET @BannerH:=180395; -- PVP HOLIDAY HORDE AV
SET @BannerA:=180399; -- PVP HOLIDAY ALLIANCE AV
SET @EnvoyA:=15103; -- Stormpike Emissary          /* Alliance */
SET @EnvoyH:=15106; -- Frostwolf Emissary          /* Horde */
-- Creature spawns
DELETE FROM `creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+47) AND `id` IN (@EnvoyH,@EnvoyA);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(@CGUID+0,@EnvoyH,530,1,1,0,0,-1666.54993,5192.018,-41.39052,3.71755123,120,0,0,1,0,0,0),
(@CGUID+1,@EnvoyH,530,1,1,0,0,-1669.92041,5188.145,-43.2296371,0.5235988,120,0,0,1,0,0,0),
(@CGUID+2,@EnvoyH,530,1,1,0,0,-1688.98291,5531.122,-40.49477,4.64257574,120,0,0,1,0,0,0),
(@CGUID+3,@EnvoyH,530,1,1,0,0,-1689.11841,5527.934,-40.3165779,1.50098312,120,0,0,1,0,0,0),
(@CGUID+4,@EnvoyH,530,1,1,0,0,-1738.01233,5147.58057,-37.121582,4.049164,120,0,0,1,0,0,0),
(@CGUID+5,@EnvoyH,530,1,1,0,0,-1797.06226,5479.807,-12.3448048,2.12930179,120,0,0,1,0,0,0),
(@CGUID+6,@EnvoyH,530,1,1,0,0,-1799.6311,5482.90967,-12.3448038,5.18362761,120,0,0,1,0,0,0),
(@CGUID+7,@EnvoyH,530,1,1,0,0,-1809.67578,5366.837,-12.3448009,3.92699075,120,0,0,1,0,0,0),
(@CGUID+8,@EnvoyH,530,1,1,0,0,-1812.38574,5364.03027,-12.3448,0.6981317,120,0,0,1,0,0,0),
(@CGUID+9,@EnvoyH,530,1,1,0,0,-1865.90991,5144.91064,-42.53244,1.86750233,120,0,0,1,0,0,0),
(@CGUID+10,@EnvoyH,530,1,1,0,0,-1867.22571,5148.13965,-43.1352577,4.97418833,120,0,0,1,0,0,0),
(@CGUID+11,@EnvoyH,530,1,1,0,0,-1908.20422,5433.956,-12.3448772,1.74532926,120,0,0,1,0,0,0),
(@CGUID+12,@EnvoyH,530,1,1,0,0,-1908.42578,5437.61035,-12.3448505,4.939282,120,0,0,1,0,0,0),
(@CGUID+13,@EnvoyH,530,1,1,0,0,-1912.37476,5497.59326,-12.3448029,3.66519141,120,0,0,1,0,0,0),
(@CGUID+14,@EnvoyH,530,1,1,0,0,-1915.72937,5495.289,-12.3448038,0.191986218,120,0,0,1,0,0,0),
(@CGUID+15,@EnvoyH,530,1,1,0,0,-1926.30664,5376.151,-12.3448048,2.11184835,120,0,0,1,0,0,0),
(@CGUID+16,@EnvoyH,530,1,1,0,0,-1928.93408,5379.564,-12.3448057,5.27089453,120,0,0,1,0,0,0),
(@CGUID+17,@EnvoyH,530,1,1,0,0,-1953.39954,5248.491,-42.64633,2.11184835,120,0,0,1,0,0,0),
(@CGUID+18,@EnvoyH,530,1,1,0,0,-1955.66626,5251.029,-42.3890228,5.323254,120,0,0,1,0,0,0),
(@CGUID+19,@EnvoyH,530,1,1,0,0,-2039.233,5331.151,-40.4660645,4.81710863,120,0,0,1,0,0,0),
(@CGUID+20,@EnvoyH,530,1,1,0,0,-2039.33167,5327.6084,-39.84314,1.553343,120,0,0,1,0,0,0),
(@CGUID+21,@EnvoyH,530,1,1,0,0,-2054.11353,5246.555,-39.2211,1.83259571,120,0,0,1,0,0,0),
(@CGUID+22,@EnvoyH,530,1,1,0,0,-2054.86865,5250.202,-38.9440231,5.061455,120,0,0,1,0,0,0),
(@CGUID+23,@EnvoyA,530,1,1,0,0,-1649.3158,5219.49854,-43.03097,4.502949,120,0,0,1,0,0,0),
(@CGUID+24,@EnvoyA,530,1,1,0,0,-1650.46008,5216.03,-42.1109962,1.2915436,120,0,0,1,0,0,0),
(@CGUID+25,@EnvoyA,530,1,1,0,0,-1667.33313,5410.56,-40.32267,1.60570288,120,0,0,1,0,0,0),
(@CGUID+26,@EnvoyA,530,1,1,0,0,-1667.34229,5413.182,-40.32267,4.78220224,120,0,0,1,0,0,0),
(@CGUID+27,@EnvoyA,530,1,1,0,0,-1676.7146,5504.09766,-40.3160324,2.65290046,120,0,0,1,0,0,0),
(@CGUID+28,@EnvoyA,530,1,1,0,0,-1678.97437,5505.95557,-40.30699,5.794493,120,0,0,1,0,0,0),
(@CGUID+29,@EnvoyA,530,1,1,0,0,-1764.38281,5158.26025,-37.121582,5.86430645,120,0,0,1,0,0,0),
(@CGUID+30,@EnvoyA,530,1,1,0,0,-1779.92188,5252.184,-40.12583,3.90953755,120,0,0,1,0,0,0),
(@CGUID+31,@EnvoyA,530,1,1,0,0,-1782.26257,5249.875,-40.12583,1.08210409,120,0,0,1,0,0,0),
(@CGUID+32,@EnvoyA,530,1,1,0,0,-1783.069,5451.48145,-12.3448048,1.76278257,120,0,0,1,0,0,0),
(@CGUID+33,@EnvoyA,530,1,1,0,0,-1784.13318,5455.847,-12.3448048,4.74729538,120,0,0,1,0,0,0),
(@CGUID+34,@EnvoyA,530,1,1,0,0,-1817.30334,5431.36768,-12.3449154,1.74532926,120,0,0,1,0,0,0),
(@CGUID+35,@EnvoyA,530,1,1,0,0,-1818.02954,5434.826,-12.3449459,4.60766935,120,0,0,1,0,0,0),
(@CGUID+36,@EnvoyA,530,1,1,0,0,-1839.07031,5148.27246,-42.8000221,4.29351,120,0,0,1,0,0,0),
(@CGUID+37,@EnvoyA,530,1,1,0,0,-1840.22827,5146.01025,-42.28271,0.9599311,120,0,0,1,0,0,0),
(@CGUID+38,@EnvoyA,530,1,1,0,0,-1846.33167,5347.47363,-12.3448009,3.8397243,120,0,0,1,0,0,0),
(@CGUID+39,@EnvoyA,530,1,1,0,0,-1850.33838,5346.85156,-12.344799,6.143559,120,0,0,1,0,0,0),
(@CGUID+40,@EnvoyA,530,1,1,0,0,-1881.61584,5512.388,-12.344799,3.90953755,120,0,0,1,0,0,0),
(@CGUID+41,@EnvoyA,530,1,1,0,0,-1885.313,5510.87256,-12.3447981,0.4537856,120,0,0,1,0,0,0),
(@CGUID+42,@EnvoyA,530,1,1,0,0,-1943.88672,5407.99951,-12.3448038,1.50098312,120,0,0,1,0,0,0),
(@CGUID+43,@EnvoyA,530,1,1,0,0,-1944.15674,5411.71338,-12.3448029,4.81710863,120,0,0,1,0,0,0),
(@CGUID+44,@EnvoyA,530,1,1,0,0,-2030.24573,5224.99072,-41.3888321,3.2986722,120,0,0,1,0,0,0),
(@CGUID+45,@EnvoyA,530,1,1,0,0,-2033.20508,5224.98633,-41.0004272,0.366519153,120,0,0,1,0,0,0),
(@CGUID+46,@EnvoyA,530,1,1,0,0,-2047.44922,5346.7,-40.70503,2.61799383,120,0,0,1,0,0,0),
(@CGUID+47,@EnvoyA,530,1,1,0,0,-2049.34033,5348.6,-40.99145,5.51524,120,0,0,1,0,0,0);
-- Event handling
DELETE FROM `game_event_creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+47) AND `event`=@Event;
INSERT INTO `game_event_creature` (`guid`,`event`) VALUES
(@CGUID+0,@Event),
(@CGUID+1,@Event),
(@CGUID+2,@Event),
(@CGUID+3,@Event),
(@CGUID+4,@Event),
(@CGUID+5,@Event),
(@CGUID+6,@Event),
(@CGUID+7,@Event),
(@CGUID+8,@Event),
(@CGUID+9,@Event),
(@CGUID+10,@Event),
(@CGUID+11,@Event),
(@CGUID+12,@Event),
(@CGUID+13,@Event),
(@CGUID+14,@Event),
(@CGUID+15,@Event),
(@CGUID+16,@Event),
(@CGUID+17,@Event),
(@CGUID+18,@Event),
(@CGUID+19,@Event),
(@CGUID+20,@Event),
(@CGUID+21,@Event),
(@CGUID+22,@Event),
(@CGUID+23,@Event),
(@CGUID+24,@Event),
(@CGUID+25,@Event),
(@CGUID+26,@Event),
(@CGUID+27,@Event),
(@CGUID+28,@Event),
(@CGUID+29,@Event),
(@CGUID+30,@Event),
(@CGUID+31,@Event),
(@CGUID+32,@Event),
(@CGUID+33,@Event),
(@CGUID+34,@Event),
(@CGUID+35,@Event),
(@CGUID+36,@Event),
(@CGUID+37,@Event),
(@CGUID+38,@Event),
(@CGUID+39,@Event),
(@CGUID+40,@Event),
(@CGUID+41,@Event),
(@CGUID+42,@Event),
(@CGUID+43,@Event),
(@CGUID+44,@Event),
(@CGUID+45,@Event),
(@CGUID+46,@Event),
(@CGUID+47,@Event);
-- GOs spawns
DELETE FROM `gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+22) AND `id` IN (@BannerH,@BannerA);
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@GGUID+0,@BannerH,530,1,1,-1667.10767,5188.30225,-41.6863136,2.042035,0,0,0,0,120,0,1),
(@GGUID+1,@BannerH,530,1,1,-1691.07117,5529.88037,-40.4825974,0.087266,0,0,0,0,120,0,1),
(@GGUID+2,@BannerH,530,1,1,-1801.231,5480.01855,-12.42814,0.610863447,0,0,0,0,120,0,1),
(@GGUID+3,@BannerH,530,1,1,-1812.53772,5367.465,-12.4281368,-0.820303261,0,0,0,0,120,0,1),
(@GGUID+4,@BannerH,530,1,1,-1869.243,5145.453,-43.818985,0.2792516,0,0,0,0,120,0,1),
(@GGUID+5,@BannerH,530,1,1,-1910.95142,5434.89746,-12.4907084,0.43633157,0,0,0,0,120,0,1),
(@GGUID+6,@BannerH,530,1,1,-1913.29822,5494.24268,-12.4281359,1.97221982,0,0,0,0,120,0,1),
(@GGUID+7,@BannerH,530,1,1,-1925.67749,5379.22168,-12.4281406,-2.19911456,0,0,0,0,120,0,1),
(@GGUID+8,@BannerH,530,1,1,-1951.99475,5251.258,-42.77694,-2.44346023,0,0,0,0,120,0,1),
(@GGUID+9,@BannerH,530,1,1,-2038.02087,5329.28564,-40.1177063,-3.001947,0,0,0,0,120,0,1),
(@GGUID+10,@BannerH,530,1,1,-2057.12671,5247.489,-38.884613,0.401424885,0,0,0,0,120,0,1),
(@GGUID+11,@BannerA,530,1,1,-1648.12854,5217.744,-42.667366,3.07176614,0,0,0,0,120,0,1),
(@GGUID+12,@BannerA,530,1,1,-1669.15454,5412.663,-40.52406,0.0174524616,0,0,0,0,120,0,1),
(@GGUID+13,@BannerA,530,1,1,-1679.29346,5503.415,-40.4979973,0.837757468,0,0,0,0,120,0,1),
(@GGUID+14,@BannerA,530,1,1,-1782.78479,5252.724,-40.306385,-0.837757468,0,0,0,0,120,0,1),
(@GGUID+15,@BannerA,530,1,1,-1785.69788,5453.39258,-12.52536,0.261798173,0,0,0,0,120,0,1),
(@GGUID+16,@BannerA,530,1,1,-1815.17712,5433.53369,-12.4560528,-2.98449826,0,0,0,0,120,0,1),
(@GGUID+17,@BannerA,530,1,1,-1837.35413,5146.71,-42.902,2.77506852,0,0,0,0,120,0,1),
(@GGUID+18,@BannerA,530,1,1,-1848.79688,5349.164,-12.5184069,-1.41371512,0,0,0,0,120,0,1),
(@GGUID+19,@BannerA,530,1,1,-1882.48438,5509.6416,-12.5392437,1.93731225,0,0,0,0,120,0,1),
(@GGUID+20,@BannerA,530,1,1,-1941.74658,5409.936,-12.4698048,-3.124123,0,0,0,0,120,0,1),
(@GGUID+21,@BannerA,530,1,1,-2032.07642,5222.19531,-40.8450165,1.51843619,0,0,0,0,120,0,1),
(@GGUID+22,@BannerA,530,1,1,-2047.22229,5349.404,-41.08727,-2.042035,0,0,0,0,120,0,1);
-- Event Handling
DELETE FROM `game_event_gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+22) AND `event`=@Event;
INSERT INTO `game_event_gameobject` (`guid`,`event`) VALUES
(@GGUID+0,@Event),
(@GGUID+1,@Event),
(@GGUID+2,@Event),
(@GGUID+3,@Event),
(@GGUID+4,@Event),
(@GGUID+5,@Event),
(@GGUID+6,@Event),
(@GGUID+7,@Event),
(@GGUID+8,@Event),
(@GGUID+9,@Event),
(@GGUID+10,@Event),
(@GGUID+11,@Event),
(@GGUID+12,@Event),
(@GGUID+13,@Event),
(@GGUID+14,@Event),
(@GGUID+15,@Event),
(@GGUID+16,@Event),
(@GGUID+17,@Event),
(@GGUID+18,@Event),
(@GGUID+19,@Event),
(@GGUID+20,@Event),
(@GGUID+21,@Event),
(@GGUID+22,@Event);

/* EXODAR */
SET @Event:=18; -- Call to Arms: Alterac Valley!
SET @CGUID:=@TCGUID+402; -- Set by TDB Team (need 12) - creature.guid
SET @GGUID:=@TGGUID+191; -- Set by TDB team (need 5) - gameobject.guid
SET @Banner:=180399; -- PVP HOLIDAY ALLIANCE AV
SET @Envoy:=15103; -- Stormpike Emissary
-- Creature spawns
DELETE FROM `creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+11) AND `id` IN (@Envoy);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(@CGUID+0,@Envoy,530,1,1,0,0,-3828.45361,-11723.6621,-106.651,3.85717773,120,0,0,1,0,0,0),
(@CGUID+1,@Envoy,530,1,1,0,0,-3844.63379,-11420.457,-132.030548,5.550147,120,0,0,1,0,0,0),
(@CGUID+2,@Envoy,530,1,1,0,0,-3893.992,-11617.7295,-137.818848,4.22421265,120,0,0,1,0,0,0), -- WP
(@CGUID+3,@Envoy,530,1,1,0,0,-3912.03052,-11629.63,-138.044647,0.08726646,120,0,0,1,0,0,0),
(@CGUID+4,@Envoy,530,1,1,0,0,-3950.10156,-11699.9248,-138.724365,2.00712872,120,0,0,1,0,0,0),
(@CGUID+5,@Envoy,530,1,1,0,0,-4158.932,-11451.5127,-130.976532,2.07694173,120,0,0,1,0,0,0),
(@CGUID+6,@Envoy,530,1,1,0,0,-3832.19849,-11726.5928,-106.75843,0.5235988,120,0,0,1,0,0,0),
(@CGUID+7,@Envoy,530,1,1,0,0,-3842.51563,-11422.7715,-132.022644,2.63544726,120,0,0,1,0,0,0),
(@CGUID+8,@Envoy,530,1,1,0,0,-3892.211,-11618.6406,-137.797134,4.22380161,120,0,0,1,0,0,0), -- WP
(@CGUID+9,@Envoy,530,1,1,0,0,-3907.82983,-11629.4629,-137.969955,3.159046,120,0,0,1,0,0,0),
(@CGUID+10,@Envoy,530,1,1,0,0,-3951.841,-11696.4824,-138.727463,5.3407073,120,0,0,1,0,0,0),
(@CGUID+11,@Envoy,530,1,1,0,0,-4160.54248,-11448.6328,-130.9237,5.375614,120,0,0,1,0,0,0);
-- Event handling
DELETE FROM `game_event_creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+11) AND `event`=@Event;
INSERT INTO `game_event_creature` (`guid`,`event`) VALUES
(@CGUID+0,@Event),
(@CGUID+1,@Event),
(@CGUID+2,@Event),
(@CGUID+3,@Event),
(@CGUID+4,@Event),
(@CGUID+5,@Event),
(@CGUID+6,@Event),
(@CGUID+7,@Event),
(@CGUID+8,@Event),
(@CGUID+9,@Event),
(@CGUID+10,@Event);
-- GOs spawns
DELETE FROM `gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+4) AND `id`=@Banner;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@GGUID+0,@Banner,530,1,1,-3828.197,-11728.0391,-106.773041,2.18166041,0,0,0,0,120,0,1),
(@GGUID+1,@Banner,530,1,1,-3842.18481,-11419.335,-132.054459,-2.4609127,0,0,0,0,120,0,1),
(@GGUID+2,@Banner,530,1,1,-3909.888,-11632.4053,-138.081345,1.62315571,0,0,0,0,120,0,1),
(@GGUID+3,@Banner,530,1,1,-3948.01563,-11696.8672,-138.764511,-2.75761318,0,0,0,0,120,0,1),
(@GGUID+4,@Banner,530,1,1,-4161.3916,-11451.6025,-131.007034,0.5061446,0,0,0,0,120,0,1);
-- Event Handling
DELETE FROM `game_event_gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+4) AND `event`=@Event;
INSERT INTO `game_event_gameobject` (`guid`,`event`) VALUES
(@GGUID+0,@Event),
(@GGUID+1,@Event),
(@GGUID+2,@Event),
(@GGUID+3,@Event),
(@GGUID+4,@Event);
-- Pathing
SET @NPC :=@CGUID+2;
SET @PATH :=@NPC*10;
DELETE FROM `creature_formations` WHERE `leaderGUID`=@CGUID+2;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES 
(@CGUID+2,@CGUID+2,0,0,2),
(@CGUID+2,@CGUID+8,3,90,2);
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@NPC,@PATH);
DELETE FROM `waypoint_data` WHERE `id`=@PATH; 
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-3964.45,-11640.5,-138.885,0,0,0,100,0),
(@PATH,2,-3977.58,-11670.5,-139.101,0,0,0,100,0),
(@PATH,3,-4004.9,-11674.4,-136.258,0,0,0,100,0),
(@PATH,4,-4040.58,-11678.3,-135.551,0,0,0,100,0),
(@PATH,5,-4084.33,-11680.2,-142.4,0,0,0,100,0),
(@PATH,6,-4122.19,-11676.7,-142.825,0,0,0,100,0),
(@PATH,7,-4142.92,-11653,-138.991,0,0,0,100,0),
(@PATH,8,-4148.69,-11618.2,-139.283,0,0,0,100,0),
(@PATH,9,-4138.79,-11590.3,-139.249,0,0,0,100,0),
(@PATH,10,-4119.15,-11546.3,-135.956,0,0,0,100,0),
(@PATH,11,-4085.58,-11518.1,-135.447,0,0,0,100,0),
(@PATH,12,-4068.37,-11500.5,-134.835,0,0,0,100,0),
(@PATH,13,-4056.03,-11488.4,-141.254,0,0,0,100,0),
(@PATH,14,-4018.48,-11464.7,-137.378,0,0,0,100,0),
(@PATH,15,-3976.18,-11439.8,-136.797,0,0,0,100,0),
(@PATH,16,-3928.11,-11436.4,-134.023,0,0,0,100,0),
(@PATH,17,-3892.42,-11433.1,-132.707,0,0,0,100,0),
(@PATH,18,-3848.74,-11450.4,-132.263,0,0,0,100,0),
(@PATH,19,-3826.28,-11455.8,-138.489,0,0,0,100,0),
(@PATH,20,-3819.67,-11478.8,-138.495,0,0,0,100,0),
(@PATH,21,-3833.27,-11513.5,-138.786,0,0,0,100,0),
(@PATH,22,-3846.51,-11539.5,-139.024,0,0,0,100,0),
(@PATH,23,-3865.31,-11561.5,-133.02,0,0,0,100,0),
(@PATH,24,-3883.13,-11597.2,-135.418,0,0,0,100,0),
(@PATH,25,-3895.45,-11620.5,-137.825,0,0,0,100,0),
(@PATH,26,-3929.28,-11612.4,-138.556,0,0,0,100,0);

SET @Event:=21; -- Call to Arms: Eye of the Storm!
SET @CGUID:=@TCGUID+428; -- Set by TDB Team (need 12) - creature.guid
SET @GGUID:=@TGGUID+201; -- Set by TDB team (need 5) - gameobject.guid
SET @Banner:=185107; -- Draenei Banner
SET @Envoy:=22013; -- Eye of the Storm Emissary
-- Creature spawns
DELETE FROM `creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+11) AND `id` IN (@Envoy,@Battlemaster);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(@CGUID+0,@Envoy,530,1,1,0,0,-3828.45361,-11723.6621,-106.651,3.85717773,120,0,0,1,0,0,0),
(@CGUID+1,@Envoy,530,1,1,0,0,-3844.63379,-11420.457,-132.030548,5.550147,120,0,0,1,0,0,0),
(@CGUID+2,@Envoy,530,1,1,0,0,-3893.992,-11617.7295,-137.818848,4.22421265,120,0,0,1,0,0,0), -- WP
(@CGUID+3,@Envoy,530,1,1,0,0,-3912.03052,-11629.63,-138.044647,0.08726646,120,0,0,1,0,0,0),
(@CGUID+4,@Envoy,530,1,1,0,0,-3950.10156,-11699.9248,-138.724365,2.00712872,120,0,0,1,0,0,0),
(@CGUID+5,@Envoy,530,1,1,0,0,-4158.932,-11451.5127,-130.976532,2.07694173,120,0,0,1,0,0,0),
(@CGUID+6,@Envoy,530,1,1,0,0,-3832.19849,-11726.5928,-106.75843,0.5235988,120,0,0,1,0,0,0),
(@CGUID+7,@Envoy,530,1,1,0,0,-3842.51563,-11422.7715,-132.022644,2.63544726,120,0,0,1,0,0,0),
(@CGUID+8,@Envoy,530,1,1,0,0,-3892.211,-11618.6406,-137.797134,4.22380161,120,0,0,1,0,0,0), -- WP
(@CGUID+9,@Envoy,530,1,1,0,0,-3907.82983,-11629.4629,-137.969955,3.159046,120,0,0,1,0,0,0),
(@CGUID+10,@Envoy,530,1,1,0,0,-3951.841,-11696.4824,-138.727463,5.3407073,120,0,0,1,0,0,0),
(@CGUID+11,@Envoy,530,1,1,0,0,-4160.54248,-11448.6328,-130.9237,5.375614,120,0,0,1,0,0,0);
-- Event handling
DELETE FROM `game_event_creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+11) AND `event`=@Event;
INSERT INTO `game_event_creature` (`guid`,`event`) VALUES
(@CGUID+0,@Event),
(@CGUID+1,@Event),
(@CGUID+2,@Event),
(@CGUID+3,@Event),
(@CGUID+4,@Event),
(@CGUID+5,@Event),
(@CGUID+6,@Event),
(@CGUID+7,@Event),
(@CGUID+8,@Event),
(@CGUID+9,@Event),
(@CGUID+10,@Event),
(@CGUID+11,@Event);
-- GOs spawns
DELETE FROM `gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+4) AND `id`=@Banner;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@GGUID+0,@Banner,530,1,1,-3828.197,-11728.0391,-106.773041,2.18166041,0,0,0,0,120,0,1),
(@GGUID+1,@Banner,530,1,1,-3842.18481,-11419.335,-132.054459,-2.4609127,0,0,0,0,120,0,1),
(@GGUID+2,@Banner,530,1,1,-3909.888,-11632.4053,-138.081345,1.62315571,0,0,0,0,120,0,1),
(@GGUID+3,@Banner,530,1,1,-3948.01563,-11696.8672,-138.764511,-2.75761318,0,0,0,0,120,0,1),
(@GGUID+4,@Banner,530,1,1,-4161.3916,-11451.6025,-131.007034,0.5061446,0,0,0,0,120,0,1);
-- Event Handling
DELETE FROM `game_event_gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+4) AND `event`=@Event;
INSERT INTO `game_event_gameobject` (`guid`,`event`) VALUES
(@GGUID+0,@Event),
(@GGUID+1,@Event),
(@GGUID+2,@Event),
(@GGUID+3,@Event),
(@GGUID+4,@Event);
-- Pathing
SET @NPC :=@CGUID+2;
SET @PATH :=@NPC*10;
DELETE FROM `creature_formations` WHERE `leaderGUID`=@CGUID+2;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES 
(@CGUID+2,@CGUID+2,0,0,2),
(@CGUID+2,@CGUID+8,3,90,2);
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@NPC,@PATH);
DELETE FROM `waypoint_data` WHERE `id`=@PATH; 
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-3964.45,-11640.5,-138.885,0,0,0,100,0),
(@PATH,2,-3977.58,-11670.5,-139.101,0,0,0,100,0),
(@PATH,3,-4004.9,-11674.4,-136.258,0,0,0,100,0),
(@PATH,4,-4040.58,-11678.3,-135.551,0,0,0,100,0),
(@PATH,5,-4084.33,-11680.2,-142.4,0,0,0,100,0),
(@PATH,6,-4122.19,-11676.7,-142.825,0,0,0,100,0),
(@PATH,7,-4142.92,-11653,-138.991,0,0,0,100,0),
(@PATH,8,-4148.69,-11618.2,-139.283,0,0,0,100,0),
(@PATH,9,-4138.79,-11590.3,-139.249,0,0,0,100,0),
(@PATH,10,-4119.15,-11546.3,-135.956,0,0,0,100,0),
(@PATH,11,-4085.58,-11518.1,-135.447,0,0,0,100,0),
(@PATH,12,-4068.37,-11500.5,-134.835,0,0,0,100,0),
(@PATH,13,-4056.03,-11488.4,-141.254,0,0,0,100,0),
(@PATH,14,-4018.48,-11464.7,-137.378,0,0,0,100,0),
(@PATH,15,-3976.18,-11439.8,-136.797,0,0,0,100,0),
(@PATH,16,-3928.11,-11436.4,-134.023,0,0,0,100,0),
(@PATH,17,-3892.42,-11433.1,-132.707,0,0,0,100,0),
(@PATH,18,-3848.74,-11450.4,-132.263,0,0,0,100,0),
(@PATH,19,-3826.28,-11455.8,-138.489,0,0,0,100,0),
(@PATH,20,-3819.67,-11478.8,-138.495,0,0,0,100,0),
(@PATH,21,-3833.27,-11513.5,-138.786,0,0,0,100,0),
(@PATH,22,-3846.51,-11539.5,-139.024,0,0,0,100,0),
(@PATH,23,-3865.31,-11561.5,-133.02,0,0,0,100,0),
(@PATH,24,-3883.13,-11597.2,-135.418,0,0,0,100,0),
(@PATH,25,-3895.45,-11620.5,-137.825,0,0,0,100,0),
(@PATH,26,-3929.28,-11612.4,-138.556,0,0,0,100,0);

SET @Event:=19; -- Call to Arms: Warsong Gulch!
SET @CGUID:=@TCGUID+441; -- Set by TDB Team (need 12) - creature.guid
SET @GGUID:=@TGGUID+206; -- Set by TDB team (need 5) - gameobject.guid
SET @Banner:=180400; -- PVP HOLIDAY ALLIANCE CTF
SET @Envoy:=15102; -- Silverwing Emissary
-- Creature spawns
DELETE FROM `creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+11) AND `id` IN (@Envoy);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(@CGUID+0,@Envoy,530,1,1,0,0,-3828.45361,-11723.6621,-106.651,3.85717773,120,0,0,1,0,0,0),
(@CGUID+1,@Envoy,530,1,1,0,0,-3844.63379,-11420.457,-132.030548,5.550147,120,0,0,1,0,0,0),
(@CGUID+2,@Envoy,530,1,1,0,0,-3893.992,-11617.7295,-137.818848,4.22421265,120,0,0,1,0,0,0), -- WP
(@CGUID+3,@Envoy,530,1,1,0,0,-3912.03052,-11629.63,-138.044647,0.08726646,120,0,0,1,0,0,0),
(@CGUID+4,@Envoy,530,1,1,0,0,-3950.10156,-11699.9248,-138.724365,2.00712872,120,0,0,1,0,0,0),
(@CGUID+5,@Envoy,530,1,1,0,0,-4158.932,-11451.5127,-130.976532,2.07694173,120,0,0,1,0,0,0),
(@CGUID+6,@Envoy,530,1,1,0,0,-3832.19849,-11726.5928,-106.75843,0.5235988,120,0,0,1,0,0,0),
(@CGUID+7,@Envoy,530,1,1,0,0,-3842.51563,-11422.7715,-132.022644,2.63544726,120,0,0,1,0,0,0),
(@CGUID+8,@Envoy,530,1,1,0,0,-3892.211,-11618.6406,-137.797134,4.22380161,120,0,0,1,0,0,0), -- WP
(@CGUID+9,@Envoy,530,1,1,0,0,-3907.82983,-11629.4629,-137.969955,3.159046,120,0,0,1,0,0,0),
(@CGUID+10,@Envoy,530,1,1,0,0,-3951.841,-11696.4824,-138.727463,5.3407073,120,0,0,1,0,0,0),
(@CGUID+11,@Envoy,530,1,1,0,0,-4160.54248,-11448.6328,-130.9237,5.375614,120,0,0,1,0,0,0);
-- Event handling
DELETE FROM `game_event_creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+11) AND `event`=@Event;
INSERT INTO `game_event_creature` (`guid`,`event`) VALUES
(@CGUID+0,@Event),
(@CGUID+1,@Event),
(@CGUID+2,@Event),
(@CGUID+3,@Event),
(@CGUID+4,@Event),
(@CGUID+5,@Event),
(@CGUID+6,@Event),
(@CGUID+7,@Event),
(@CGUID+8,@Event),
(@CGUID+9,@Event),
(@CGUID+10,@Event),
(@CGUID+11,@Event);
-- GOs spawns
DELETE FROM `gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+4) AND `id`=@Banner;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@GGUID+0,@Banner,530,1,1,-3828.197,-11728.0391,-106.773041,2.18166041,0,0,0,0,120,0,1),
(@GGUID+1,@Banner,530,1,1,-3842.18481,-11419.335,-132.054459,-2.4609127,0,0,0,0,120,0,1),
(@GGUID+2,@Banner,530,1,1,-3909.888,-11632.4053,-138.081345,1.62315571,0,0,0,0,120,0,1),
(@GGUID+3,@Banner,530,1,1,-3948.01563,-11696.8672,-138.764511,-2.75761318,0,0,0,0,120,0,1),
(@GGUID+4,@Banner,530,1,1,-4161.3916,-11451.6025,-131.007034,0.5061446,0,0,0,0,120,0,1);
-- Event Handling
DELETE FROM `game_event_gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+4) AND `event`=@Event;
INSERT INTO `game_event_gameobject` (`guid`,`event`) VALUES
(@GGUID+0,@Event),
(@GGUID+1,@Event),
(@GGUID+2,@Event),
(@GGUID+3,@Event),
(@GGUID+4,@Event);
-- Pathing
SET @NPC :=@CGUID+2;
SET @PATH :=@NPC*10;
DELETE FROM `creature_formations` WHERE `leaderGUID`=@CGUID+2;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES 
(@CGUID+2,@CGUID+2,0,0,2),
(@CGUID+2,@CGUID+8,3,90,2);
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@NPC,@PATH);
DELETE FROM `waypoint_data` WHERE `id`=@PATH; 
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-3964.45,-11640.5,-138.885,0,0,0,100,0),
(@PATH,2,-3977.58,-11670.5,-139.101,0,0,0,100,0),
(@PATH,3,-4004.9,-11674.4,-136.258,0,0,0,100,0),
(@PATH,4,-4040.58,-11678.3,-135.551,0,0,0,100,0),
(@PATH,5,-4084.33,-11680.2,-142.4,0,0,0,100,0),
(@PATH,6,-4122.19,-11676.7,-142.825,0,0,0,100,0),
(@PATH,7,-4142.92,-11653,-138.991,0,0,0,100,0),
(@PATH,8,-4148.69,-11618.2,-139.283,0,0,0,100,0),
(@PATH,9,-4138.79,-11590.3,-139.249,0,0,0,100,0),
(@PATH,10,-4119.15,-11546.3,-135.956,0,0,0,100,0),
(@PATH,11,-4085.58,-11518.1,-135.447,0,0,0,100,0),
(@PATH,12,-4068.37,-11500.5,-134.835,0,0,0,100,0),
(@PATH,13,-4056.03,-11488.4,-141.254,0,0,0,100,0),
(@PATH,14,-4018.48,-11464.7,-137.378,0,0,0,100,0),
(@PATH,15,-3976.18,-11439.8,-136.797,0,0,0,100,0),
(@PATH,16,-3928.11,-11436.4,-134.023,0,0,0,100,0),
(@PATH,17,-3892.42,-11433.1,-132.707,0,0,0,100,0),
(@PATH,18,-3848.74,-11450.4,-132.263,0,0,0,100,0),
(@PATH,19,-3826.28,-11455.8,-138.489,0,0,0,100,0),
(@PATH,20,-3819.67,-11478.8,-138.495,0,0,0,100,0),
(@PATH,21,-3833.27,-11513.5,-138.786,0,0,0,100,0),
(@PATH,22,-3846.51,-11539.5,-139.024,0,0,0,100,0),
(@PATH,23,-3865.31,-11561.5,-133.02,0,0,0,100,0),
(@PATH,24,-3883.13,-11597.2,-135.418,0,0,0,100,0),
(@PATH,25,-3895.45,-11620.5,-137.825,0,0,0,100,0),
(@PATH,26,-3929.28,-11612.4,-138.556,0,0,0,100,0);

SET @Event:=20; -- Call to Arms: Arathi Basin!
SET @CGUID:=@TCGUID+454; -- Set by TDB Team (need 12) - creature.guid
SET @GGUID:=@TGGUID+211; -- Set by TDB team (need 5) - gameobject.guid
SET @Banner:=180398; -- PVP HOLIDAY ALLIANCE ARATHI
SET @Envoy:=14991; -- League of Arathor Emissary
-- Creature spawns
DELETE FROM `creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+11) AND `id` IN (@Envoy);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(@CGUID+0,@Envoy,530,1,1,0,0,-3828.45361,-11723.6621,-106.651,3.85717773,120,0,0,1,0,0,0),
(@CGUID+1,@Envoy,530,1,1,0,0,-3844.63379,-11420.457,-132.030548,5.550147,120,0,0,1,0,0,0),
(@CGUID+2,@Envoy,530,1,1,0,0,-3893.992,-11617.7295,-137.818848,4.22421265,120,0,0,1,0,0,0), -- WP
(@CGUID+3,@Envoy,530,1,1,0,0,-3912.03052,-11629.63,-138.044647,0.08726646,120,0,0,1,0,0,0),
(@CGUID+4,@Envoy,530,1,1,0,0,-3950.10156,-11699.9248,-138.724365,2.00712872,120,0,0,1,0,0,0),
(@CGUID+5,@Envoy,530,1,1,0,0,-4158.932,-11451.5127,-130.976532,2.07694173,120,0,0,1,0,0,0),
(@CGUID+6,@Envoy,530,1,1,0,0,-3832.19849,-11726.5928,-106.75843,0.5235988,120,0,0,1,0,0,0),
(@CGUID+7,@Envoy,530,1,1,0,0,-3842.51563,-11422.7715,-132.022644,2.63544726,120,0,0,1,0,0,0),
(@CGUID+8,@Envoy,530,1,1,0,0,-3892.211,-11618.6406,-137.797134,4.22380161,120,0,0,1,0,0,0), -- WP
(@CGUID+9,@Envoy,530,1,1,0,0,-3907.82983,-11629.4629,-137.969955,3.159046,120,0,0,1,0,0,0),
(@CGUID+10,@Envoy,530,1,1,0,0,-3951.841,-11696.4824,-138.727463,5.3407073,120,0,0,1,0,0,0),
(@CGUID+11,@Envoy,530,1,1,0,0,-4160.54248,-11448.6328,-130.9237,5.375614,120,0,0,1,0,0,0);
-- Event handling
DELETE FROM `game_event_creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+11) AND `event`=@Event;
INSERT INTO `game_event_creature` (`guid`,`event`) VALUES
(@CGUID+0,@Event),
(@CGUID+1,@Event),
(@CGUID+2,@Event),
(@CGUID+3,@Event),
(@CGUID+4,@Event),
(@CGUID+5,@Event),
(@CGUID+6,@Event),
(@CGUID+7,@Event),
(@CGUID+8,@Event),
(@CGUID+9,@Event),
(@CGUID+10,@Event),
(@CGUID+11,@Event);
-- GOs spawns
DELETE FROM `gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+4) AND `id`=@Banner;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@GGUID+0,@Banner,530,1,1,-3828.197,-11728.0391,-106.773041,2.18166041,0,0,0,0,120,0,1),
(@GGUID+1,@Banner,530,1,1,-3842.18481,-11419.335,-132.054459,-2.4609127,0,0,0,0,120,0,1),
(@GGUID+2,@Banner,530,1,1,-3909.888,-11632.4053,-138.081345,1.62315571,0,0,0,0,120,0,1),
(@GGUID+3,@Banner,530,1,1,-3948.01563,-11696.8672,-138.764511,-2.75761318,0,0,0,0,120,0,1),
(@GGUID+4,@Banner,530,1,1,-4161.3916,-11451.6025,-131.007034,0.5061446,0,0,0,0,120,0,1);
-- Event Handling
DELETE FROM `game_event_gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+4) AND `event`=@Event;
INSERT INTO `game_event_gameobject` (`guid`,`event`) VALUES
(@GGUID+0,@Event),
(@GGUID+1,@Event),
(@GGUID+2,@Event),
(@GGUID+3,@Event),
(@GGUID+4,@Event);
-- Pathing
SET @NPC :=@CGUID+2;
SET @PATH :=@NPC*10;
DELETE FROM `creature_formations` WHERE `leaderGUID`=@CGUID+2;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES 
(@CGUID+2,@CGUID+2,0,0,2),
(@CGUID+2,@CGUID+8,3,90,2);
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@NPC,@PATH);
DELETE FROM `waypoint_data` WHERE `id`=@PATH; 
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-3964.45,-11640.5,-138.885,0,0,0,100,0),
(@PATH,2,-3977.58,-11670.5,-139.101,0,0,0,100,0),
(@PATH,3,-4004.9,-11674.4,-136.258,0,0,0,100,0),
(@PATH,4,-4040.58,-11678.3,-135.551,0,0,0,100,0),
(@PATH,5,-4084.33,-11680.2,-142.4,0,0,0,100,0),
(@PATH,6,-4122.19,-11676.7,-142.825,0,0,0,100,0),
(@PATH,7,-4142.92,-11653,-138.991,0,0,0,100,0),
(@PATH,8,-4148.69,-11618.2,-139.283,0,0,0,100,0),
(@PATH,9,-4138.79,-11590.3,-139.249,0,0,0,100,0),
(@PATH,10,-4119.15,-11546.3,-135.956,0,0,0,100,0),
(@PATH,11,-4085.58,-11518.1,-135.447,0,0,0,100,0),
(@PATH,12,-4068.37,-11500.5,-134.835,0,0,0,100,0),
(@PATH,13,-4056.03,-11488.4,-141.254,0,0,0,100,0),
(@PATH,14,-4018.48,-11464.7,-137.378,0,0,0,100,0),
(@PATH,15,-3976.18,-11439.8,-136.797,0,0,0,100,0),
(@PATH,16,-3928.11,-11436.4,-134.023,0,0,0,100,0),
(@PATH,17,-3892.42,-11433.1,-132.707,0,0,0,100,0),
(@PATH,18,-3848.74,-11450.4,-132.263,0,0,0,100,0),
(@PATH,19,-3826.28,-11455.8,-138.489,0,0,0,100,0),
(@PATH,20,-3819.67,-11478.8,-138.495,0,0,0,100,0),
(@PATH,21,-3833.27,-11513.5,-138.786,0,0,0,100,0),
(@PATH,22,-3846.51,-11539.5,-139.024,0,0,0,100,0),
(@PATH,23,-3865.31,-11561.5,-133.02,0,0,0,100,0),
(@PATH,24,-3883.13,-11597.2,-135.418,0,0,0,100,0),
(@PATH,25,-3895.45,-11620.5,-137.825,0,0,0,100,0),
(@PATH,26,-3929.28,-11612.4,-138.556,0,0,0,100,0);

/* IRONFORGE */
SET @Event:=18; -- Call to Arms: Alterac Valley!
SET @CGUID:=@TCGUID+467; -- Set by TDB Team (need 12) - creature.guid
SET @GGUID:=@TGGUID+216; -- Set by TDB team (need 5) - gameobject.guid
SET @Banner:=180399; -- PVP HOLIDAY ALLIANCE AV
SET @Envoy:=15103; -- Stormpike Emissary
-- Creature spawns
DELETE FROM `creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+11) AND `id` IN (@Envoy);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(@CGUID+0,@Envoy,0,1,1,0,0,-4680.56,-985.5838,501.646179,3.08923268,120,0,0,1,0,0,0),
(@CGUID+1,@Envoy,0,1,1,0,0,-4683.46338,-985.0915,501.627441,6.03883934,120,0,0,1,0,0,0),
(@CGUID+2,@Envoy,0,1,1,0,0,-5007.03,-1177.84,501.66,5.94313574,120,0,0,1,0,0,0), -- WP
(@CGUID+3,@Envoy,0,1,1,0,0,-5001.03,-1179.84,501.66,5.94312668,120,0,0,1,0,0,0), -- WP
(@CGUID+4,@Envoy,0,1,1,0,0,-4836.84863,-1171.62537,502.276825,2.443461,120,0,0,1,0,0,0),
(@CGUID+5,@Envoy,0,1,1,0,0,-4839.365,-1169.09436,502.2785,5.375614,120,0,0,1,0,0,0),
(@CGUID+6,@Envoy,0,1,1,0,0,-4916.42627,-848.374,501.7446,4.729842,120,0,0,1,0,0,0),
(@CGUID+7,@Envoy,0,1,1,0,0,-4916.61475,-852.305359,501.7446,1.48352981,120,0,0,1,0,0,0),
(@CGUID+8,@Envoy,0,1,1,0,0,-5032.96875,-926.6805,501.742676,4.64257574,120,0,0,1,0,0,0),
(@CGUID+9,@Envoy,0,1,1,0,0,-5033.75244,-931.2869,501.742676,1.32645023,120,0,0,1,0,0,0),
(@CGUID+10,@Envoy,0,1,1,0,0,-5033.86572,-1266.072,505.383362,2.07694173,120,0,0,1,0,0,0),
(@CGUID+11,@Envoy,0,1,1,0,0,-5037.07275,-1261.52344,505.383362,5.42797375,120,0,0,1,0,0,0);
-- Event handling
DELETE FROM `game_event_creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+11) AND `event`=@Event;
INSERT INTO `game_event_creature` (`guid`,`event`) VALUES
(@CGUID+0,@Event),
(@CGUID+1,@Event),
(@CGUID+2,@Event),
(@CGUID+3,@Event),
(@CGUID+4,@Event),
(@CGUID+5,@Event),
(@CGUID+6,@Event),
(@CGUID+7,@Event),
(@CGUID+8,@Event),
(@CGUID+9,@Event),
(@CGUID+10,@Event),
(@CGUID+11,@Event);
-- GOs spawns
DELETE FROM `gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+4) AND `id`=@Banner;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@GGUID+0,@Banner,0,1,1,-4675.30225,-985.273865,501.658539,1.37880921,0,0,0,0,120,0,1),
(@GGUID+1,@Banner,0,1,1,-4833.517,-1171.66211,502.1946,1.2566359,0,0,0,0,120,0,1),
(@GGUID+2,@Banner,0,1,1,-4917.682,-844.4085,501.661255,-2.4609127,0,0,0,0,120,0,1),
(@GGUID+3,@Banner,0,1,1,-5035.221,-921.6833,501.659332,0,0,0,0,0,120,0,1),
(@GGUID+4,@Banner,0,1,1,-5038.93262,-1258.80737,505.300018,0.7155849,0,0,0,0,120,0,1);
-- Event Handling
DELETE FROM `game_event_gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+4) AND `event`=@Event;
INSERT INTO `game_event_gameobject` (`guid`,`event`) VALUES
(@GGUID+0,@Event),
(@GGUID+1,@Event),
(@GGUID+2,@Event),
(@GGUID+3,@Event),
(@GGUID+4,@Event);
-- Pathing
SET @NPC :=@CGUID+2;
SET @PATH :=@NPC*10;
DELETE FROM `creature_formations` WHERE `leaderGUID`=@CGUID+2;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES 
(@CGUID+2,@CGUID+2,0,0,2),
(@CGUID+2,@CGUID+3,3,180,2);
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@NPC,@PATH);
DELETE FROM `waypoint_data` WHERE `id`=@PATH; 
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-5007.03,-1177.84,501.66,0,0,0,100,0),
(@PATH,2,-5001.6,-1153.96,501.66,0,0,0,100,0),
(@PATH,3,-4997.44,-1127.35,501.696,0,0,0,100,0),
(@PATH,4,-5000.03,-1114.52,501.651,0,0,0,100,0),
(@PATH,5,-4997.12,-1109.34,501.667,0,0,0,100,0),
(@PATH,6,-4994.9,-1099,501.66,0,0,0,100,0),
(@PATH,7,-4994.39,-1087.39,500.913,0,0,0,100,0),
(@PATH,8,-4992.23,-1050.22,497.945,0,0,0,100,0),
(@PATH,9,-4990.41,-1041.16,501.658,0,0,0,100,0),
(@PATH,10,-4986.52,-1020.52,501.656,0,0,0,100,0),
(@PATH,11,-4958.59,-977.043,501.622,0,0,0,100,0),
(@PATH,12,-4896.11,-925.091,501.589,0,0,0,100,0),
(@PATH,13,-4858.81,-910.906,501.66,0,0,0,100,0),
(@PATH,14,-4822.94,-906.469,501.66,0,0,0,100,0),
(@PATH,15,-4812.86,-906.403,497.967,0,0,0,100,0),
(@PATH,16,-4783.43,-907.789,497.959,0,0,0,100,0),
(@PATH,17,-4775.18,-907.41,501.667,0,0,0,100,0),
(@PATH,18,-4761.82,-907.258,501.633,0,0,0,100,0),
(@PATH,19,-4755.1,-910.173,501.667,0,0,0,100,0),
(@PATH,20,-4702.37,-937.593,501.673,0,0,0,100,0),
(@PATH,21,-4693.85,-961.51,501.659,0,0,0,100,0),
(@PATH,22,-4691.43,-974.311,501.492,0,0,0,100,0),
(@PATH,23,-4718.75,-982.936,501.537,0,0,0,100,0),
(@PATH,24,-4744.27,-984.132,501.485,0,0,0,100,0),
(@PATH,25,-4779.13,-1024.8,502.211,0,0,0,100,0),
(@PATH,26,-4807.38,-1032.69,502.209,0,0,0,100,0),
(@PATH,27,-4812.82,-1069.17,502.206,0,0,0,100,0),
(@PATH,28,-4836.54,-1086.65,502.196,0,0,0,100,0),
(@PATH,29,-4862.22,-1086.39,502.202,0,0,0,100,0),
(@PATH,30,-4890.83,-1113.34,501.96,0,0,0,100,0),
(@PATH,31,-4911.88,-1119.41,501.699,0,0,0,100,0),
(@PATH,32,-4937.18,-1180.6,501.701,0,0,0,100,0),
(@PATH,33,-4958.12,-1185.43,501.66,0,0,0,100,0),
(@PATH,34,-5005.38,-1176.96,501.659,0,0,0,100,0);

SET @Event:=21; -- Call to Arms: Eye of the Storm!
SET @CGUID:=@TCGUID+493; -- Set by TDB Team (need 12) - creature.guid
SET @GGUID:=@TGGUID+226; -- Set by TDB team (need 5) - gameobject.guid
SET @Banner:=185107; -- Draenei Banner
SET @Envoy:=22013; -- Eye of the Storm Emissary
-- Creature spawns
DELETE FROM `creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+11) AND `id` IN (@Envoy);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(@CGUID+0,@Envoy,0,1,1,0,0,-4680.56,-985.5838,501.646179,3.08923268,120,0,0,1,0,0,0),
(@CGUID+1,@Envoy,0,1,1,0,0,-4683.46338,-985.0915,501.627441,6.03883934,120,0,0,1,0,0,0),
(@CGUID+2,@Envoy,0,1,1,0,0,-5007.03,-1177.84,501.66,5.94313574,120,0,0,1,0,0,0), -- WP
(@CGUID+3,@Envoy,0,1,1,0,0,-5001.03,-1179.84,501.66,5.94312668,120,0,0,1,0,0,0), -- WP
(@CGUID+4,@Envoy,0,1,1,0,0,-4836.84863,-1171.62537,502.276825,2.443461,120,0,0,1,0,0,0),
(@CGUID+5,@Envoy,0,1,1,0,0,-4839.365,-1169.09436,502.2785,5.375614,120,0,0,1,0,0,0),
(@CGUID+6,@Envoy,0,1,1,0,0,-4916.42627,-848.374,501.7446,4.729842,120,0,0,1,0,0,0),
(@CGUID+7,@Envoy,0,1,1,0,0,-4916.61475,-852.305359,501.7446,1.48352981,120,0,0,1,0,0,0),
(@CGUID+8,@Envoy,0,1,1,0,0,-5032.96875,-926.6805,501.742676,4.64257574,120,0,0,1,0,0,0),
(@CGUID+9,@Envoy,0,1,1,0,0,-5033.75244,-931.2869,501.742676,1.32645023,120,0,0,1,0,0,0),
(@CGUID+10,@Envoy,0,1,1,0,0,-5033.86572,-1266.072,505.383362,2.07694173,120,0,0,1,0,0,0),
(@CGUID+11,@Envoy,0,1,1,0,0,-5037.07275,-1261.52344,505.383362,5.42797375,120,0,0,1,0,0,0);
-- Event handling
DELETE FROM `game_event_creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+11) AND `event`=@Event;
INSERT INTO `game_event_creature` (`guid`,`event`) VALUES
(@CGUID+0,@Event),
(@CGUID+1,@Event),
(@CGUID+2,@Event),
(@CGUID+3,@Event),
(@CGUID+4,@Event),
(@CGUID+5,@Event),
(@CGUID+6,@Event),
(@CGUID+7,@Event),
(@CGUID+8,@Event),
(@CGUID+9,@Event),
(@CGUID+10,@Event),
(@CGUID+11,@Event);
-- GOs spawns
DELETE FROM `gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+4) AND `id`=@Banner;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@GGUID+0,@Banner,0,1,1,-4675.30225,-985.273865,501.658539,1.37880921,0,0,0,0,120,0,1),
(@GGUID+1,@Banner,0,1,1,-4833.517,-1171.66211,502.1946,1.2566359,0,0,0,0,120,0,1),
(@GGUID+2,@Banner,0,1,1,-4917.682,-844.4085,501.661255,-2.4609127,0,0,0,0,120,0,1),
(@GGUID+3,@Banner,0,1,1,-5035.221,-921.6833,501.659332,0,0,0,0,0,120,0,1),
(@GGUID+4,@Banner,0,1,1,-5038.93262,-1258.80737,505.300018,0.7155849,0,0,0,0,120,0,1);
-- Event Handling
DELETE FROM `game_event_gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+4) AND `event`=@Event;
INSERT INTO `game_event_gameobject` (`guid`,`event`) VALUES
(@GGUID+0,@Event),
(@GGUID+1,@Event),
(@GGUID+2,@Event),
(@GGUID+3,@Event),
(@GGUID+4,@Event);
-- Pathing
SET @NPC :=@CGUID+2;
SET @PATH :=@NPC*10;
DELETE FROM `creature_formations` WHERE `leaderGUID`=@CGUID+2;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES 
(@CGUID+2,@CGUID+2,0,0,2),
(@CGUID+2,@CGUID+3,3,180,2);
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@NPC,@PATH);
DELETE FROM `waypoint_data` WHERE `id`=@PATH; 
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-5007.03,-1177.84,501.66,0,0,0,100,0),
(@PATH,2,-5001.6,-1153.96,501.66,0,0,0,100,0),
(@PATH,3,-4997.44,-1127.35,501.696,0,0,0,100,0),
(@PATH,4,-5000.03,-1114.52,501.651,0,0,0,100,0),
(@PATH,5,-4997.12,-1109.34,501.667,0,0,0,100,0),
(@PATH,6,-4994.9,-1099,501.66,0,0,0,100,0),
(@PATH,7,-4994.39,-1087.39,500.913,0,0,0,100,0),
(@PATH,8,-4992.23,-1050.22,497.945,0,0,0,100,0),
(@PATH,9,-4990.41,-1041.16,501.658,0,0,0,100,0),
(@PATH,10,-4986.52,-1020.52,501.656,0,0,0,100,0),
(@PATH,11,-4958.59,-977.043,501.622,0,0,0,100,0),
(@PATH,12,-4896.11,-925.091,501.589,0,0,0,100,0),
(@PATH,13,-4858.81,-910.906,501.66,0,0,0,100,0),
(@PATH,14,-4822.94,-906.469,501.66,0,0,0,100,0),
(@PATH,15,-4812.86,-906.403,497.967,0,0,0,100,0),
(@PATH,16,-4783.43,-907.789,497.959,0,0,0,100,0),
(@PATH,17,-4775.18,-907.41,501.667,0,0,0,100,0),
(@PATH,18,-4761.82,-907.258,501.633,0,0,0,100,0),
(@PATH,19,-4755.1,-910.173,501.667,0,0,0,100,0),
(@PATH,20,-4702.37,-937.593,501.673,0,0,0,100,0),
(@PATH,21,-4693.85,-961.51,501.659,0,0,0,100,0),
(@PATH,22,-4691.43,-974.311,501.492,0,0,0,100,0),
(@PATH,23,-4718.75,-982.936,501.537,0,0,0,100,0),
(@PATH,24,-4744.27,-984.132,501.485,0,0,0,100,0),
(@PATH,25,-4779.13,-1024.8,502.211,0,0,0,100,0),
(@PATH,26,-4807.38,-1032.69,502.209,0,0,0,100,0),
(@PATH,27,-4812.82,-1069.17,502.206,0,0,0,100,0),
(@PATH,28,-4836.54,-1086.65,502.196,0,0,0,100,0),
(@PATH,29,-4862.22,-1086.39,502.202,0,0,0,100,0),
(@PATH,30,-4890.83,-1113.34,501.96,0,0,0,100,0),
(@PATH,31,-4911.88,-1119.41,501.699,0,0,0,100,0),
(@PATH,32,-4937.18,-1180.6,501.701,0,0,0,100,0),
(@PATH,33,-4958.12,-1185.43,501.66,0,0,0,100,0),
(@PATH,34,-5005.38,-1176.96,501.659,0,0,0,100,0);

SET @Event:=20; -- Call to Arms: Arathi Basin!
SET @CGUID:=@TCGUID+506; -- Set by TDB Team (need 12) - creature.guid
SET @GGUID:=@TGGUID+231; -- Set by TDB team (need 5) - gameobject.guid
SET @Banner:=180398; -- PVP HOLIDAY ALLIANCE ARATHI
SET @Envoy:=14991; -- League of Arathor Emissary
-- Creature spawns
DELETE FROM `creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+11) AND `id` IN (@Envoy);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(@CGUID+0,@Envoy,0,1,1,0,0,-4680.56,-985.5838,501.646179,3.08923268,120,0,0,1,0,0,0),
(@CGUID+1,@Envoy,0,1,1,0,0,-4683.46338,-985.0915,501.627441,6.03883934,120,0,0,1,0,0,0),
(@CGUID+2,@Envoy,0,1,1,0,0,-5007.03,-1177.84,501.66,5.94313574,120,0,0,1,0,0,0), -- WP
(@CGUID+3,@Envoy,0,1,1,0,0,-5001.03,-1179.84,501.66,5.94312668,120,0,0,1,0,0,0), -- WP
(@CGUID+4,@Envoy,0,1,1,0,0,-4836.84863,-1171.62537,502.276825,2.443461,120,0,0,1,0,0,0),
(@CGUID+5,@Envoy,0,1,1,0,0,-4839.365,-1169.09436,502.2785,5.375614,120,0,0,1,0,0,0),
(@CGUID+6,@Envoy,0,1,1,0,0,-4916.42627,-848.374,501.7446,4.729842,120,0,0,1,0,0,0),
(@CGUID+7,@Envoy,0,1,1,0,0,-4916.61475,-852.305359,501.7446,1.48352981,120,0,0,1,0,0,0),
(@CGUID+8,@Envoy,0,1,1,0,0,-5032.96875,-926.6805,501.742676,4.64257574,120,0,0,1,0,0,0),
(@CGUID+9,@Envoy,0,1,1,0,0,-5033.75244,-931.2869,501.742676,1.32645023,120,0,0,1,0,0,0),
(@CGUID+10,@Envoy,0,1,1,0,0,-5033.86572,-1266.072,505.383362,2.07694173,120,0,0,1,0,0,0),
(@CGUID+11,@Envoy,0,1,1,0,0,-5037.07275,-1261.52344,505.383362,5.42797375,120,0,0,1,0,0,0);
-- Event handling
DELETE FROM `game_event_creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+11) AND `event`=@Event;
INSERT INTO `game_event_creature` (`guid`,`event`) VALUES
(@CGUID+0,@Event),
(@CGUID+1,@Event),
(@CGUID+2,@Event),
(@CGUID+3,@Event),
(@CGUID+4,@Event),
(@CGUID+5,@Event),
(@CGUID+6,@Event),
(@CGUID+7,@Event),
(@CGUID+8,@Event),
(@CGUID+9,@Event),
(@CGUID+10,@Event),
(@CGUID+11,@Event);
-- GOs spawns
DELETE FROM `gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+4) AND `id`=@Banner;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@GGUID+0,@Banner,0,1,1,-4675.30225,-985.273865,501.658539,1.37880921,0,0,0,0,120,0,1),
(@GGUID+1,@Banner,0,1,1,-4833.517,-1171.66211,502.1946,1.2566359,0,0,0,0,120,0,1),
(@GGUID+2,@Banner,0,1,1,-4917.682,-844.4085,501.661255,-2.4609127,0,0,0,0,120,0,1),
(@GGUID+3,@Banner,0,1,1,-5035.221,-921.6833,501.659332,0,0,0,0,0,120,0,1),
(@GGUID+4,@Banner,0,1,1,-5038.93262,-1258.80737,505.300018,0.7155849,0,0,0,0,120,0,1);
-- Event Handling
DELETE FROM `game_event_gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+4) AND `event`=@Event;
INSERT INTO `game_event_gameobject` (`guid`,`event`) VALUES
(@GGUID+0,@Event),
(@GGUID+1,@Event),
(@GGUID+2,@Event),
(@GGUID+3,@Event),
(@GGUID+4,@Event);
-- Pathing
SET @NPC :=@CGUID+2;
SET @PATH :=@NPC*10;
DELETE FROM `creature_formations` WHERE `leaderGUID`=@CGUID+2;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES 
(@CGUID+2,@CGUID+2,0,0,2),
(@CGUID+2,@CGUID+3,3,180,2);
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@NPC,@PATH);
DELETE FROM `waypoint_data` WHERE `id`=@PATH; 
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-5007.03,-1177.84,501.66,0,0,0,100,0),
(@PATH,2,-5001.6,-1153.96,501.66,0,0,0,100,0),
(@PATH,3,-4997.44,-1127.35,501.696,0,0,0,100,0),
(@PATH,4,-5000.03,-1114.52,501.651,0,0,0,100,0),
(@PATH,5,-4997.12,-1109.34,501.667,0,0,0,100,0),
(@PATH,6,-4994.9,-1099,501.66,0,0,0,100,0),
(@PATH,7,-4994.39,-1087.39,500.913,0,0,0,100,0),
(@PATH,8,-4992.23,-1050.22,497.945,0,0,0,100,0),
(@PATH,9,-4990.41,-1041.16,501.658,0,0,0,100,0),
(@PATH,10,-4986.52,-1020.52,501.656,0,0,0,100,0),
(@PATH,11,-4958.59,-977.043,501.622,0,0,0,100,0),
(@PATH,12,-4896.11,-925.091,501.589,0,0,0,100,0),
(@PATH,13,-4858.81,-910.906,501.66,0,0,0,100,0),
(@PATH,14,-4822.94,-906.469,501.66,0,0,0,100,0),
(@PATH,15,-4812.86,-906.403,497.967,0,0,0,100,0),
(@PATH,16,-4783.43,-907.789,497.959,0,0,0,100,0),
(@PATH,17,-4775.18,-907.41,501.667,0,0,0,100,0),
(@PATH,18,-4761.82,-907.258,501.633,0,0,0,100,0),
(@PATH,19,-4755.1,-910.173,501.667,0,0,0,100,0),
(@PATH,20,-4702.37,-937.593,501.673,0,0,0,100,0),
(@PATH,21,-4693.85,-961.51,501.659,0,0,0,100,0),
(@PATH,22,-4691.43,-974.311,501.492,0,0,0,100,0),
(@PATH,23,-4718.75,-982.936,501.537,0,0,0,100,0),
(@PATH,24,-4744.27,-984.132,501.485,0,0,0,100,0),
(@PATH,25,-4779.13,-1024.8,502.211,0,0,0,100,0),
(@PATH,26,-4807.38,-1032.69,502.209,0,0,0,100,0),
(@PATH,27,-4812.82,-1069.17,502.206,0,0,0,100,0),
(@PATH,28,-4836.54,-1086.65,502.196,0,0,0,100,0),
(@PATH,29,-4862.22,-1086.39,502.202,0,0,0,100,0),
(@PATH,30,-4890.83,-1113.34,501.96,0,0,0,100,0),
(@PATH,31,-4911.88,-1119.41,501.699,0,0,0,100,0),
(@PATH,32,-4937.18,-1180.6,501.701,0,0,0,100,0),
(@PATH,33,-4958.12,-1185.43,501.66,0,0,0,100,0),
(@PATH,34,-5005.38,-1176.96,501.659,0,0,0,100,0);

SET @Event:=19; -- Call to Arms: Warsong Gulch!
SET @CGUID:=@TCGUID+532; -- Set by TDB Team (need 12) - creature.guid
SET @GGUID:=@TGGUID+241; -- Set by TDB team (need 5) - gameobject.guid
SET @Banner:=180400; -- PVP HOLIDAY ALLIANCE CTF
SET @Envoy:=15102; -- Silverwing Emissary
-- Creature spawns
DELETE FROM `creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+11) AND `id` IN (@Envoy);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(@CGUID+0,@Envoy,0,1,1,0,0,-4680.56,-985.5838,501.646179,3.08923268,120,0,0,1,0,0,0),
(@CGUID+1,@Envoy,0,1,1,0,0,-4683.46338,-985.0915,501.627441,6.03883934,120,0,0,1,0,0,0),
(@CGUID+2,@Envoy,0,1,1,0,0,-5007.03,-1177.84,501.66,5.94313574,120,0,0,1,0,0,0), -- WP
(@CGUID+3,@Envoy,0,1,1,0,0,-5001.03,-1179.84,501.66,5.94312668,120,0,0,1,0,0,0), -- WP
(@CGUID+4,@Envoy,0,1,1,0,0,-4836.84863,-1171.62537,502.276825,2.443461,120,0,0,1,0,0,0),
(@CGUID+5,@Envoy,0,1,1,0,0,-4839.365,-1169.09436,502.2785,5.375614,120,0,0,1,0,0,0),
(@CGUID+6,@Envoy,0,1,1,0,0,-4916.42627,-848.374,501.7446,4.729842,120,0,0,1,0,0,0),
(@CGUID+7,@Envoy,0,1,1,0,0,-4916.61475,-852.305359,501.7446,1.48352981,120,0,0,1,0,0,0),
(@CGUID+8,@Envoy,0,1,1,0,0,-5032.96875,-926.6805,501.742676,4.64257574,120,0,0,1,0,0,0),
(@CGUID+9,@Envoy,0,1,1,0,0,-5033.75244,-931.2869,501.742676,1.32645023,120,0,0,1,0,0,0),
(@CGUID+10,@Envoy,0,1,1,0,0,-5033.86572,-1266.072,505.383362,2.07694173,120,0,0,1,0,0,0),
(@CGUID+11,@Envoy,0,1,1,0,0,-5037.07275,-1261.52344,505.383362,5.42797375,120,0,0,1,0,0,0);
-- Event handling
DELETE FROM `game_event_creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+11) AND `event`=@Event;
INSERT INTO `game_event_creature` (`guid`,`event`) VALUES
(@CGUID+0,@Event),
(@CGUID+1,@Event),
(@CGUID+2,@Event),
(@CGUID+3,@Event),
(@CGUID+4,@Event),
(@CGUID+5,@Event),
(@CGUID+6,@Event),
(@CGUID+7,@Event),
(@CGUID+8,@Event),
(@CGUID+9,@Event),
(@CGUID+10,@Event),
(@CGUID+11,@Event);
-- GOs spawns
DELETE FROM `gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+4) AND `id`=@Banner;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@GGUID+0,@Banner,0,1,1,-4675.30225,-985.273865,501.658539,1.37880921,0,0,0,0,120,0,1),
(@GGUID+1,@Banner,0,1,1,-4833.517,-1171.66211,502.1946,1.2566359,0,0,0,0,120,0,1),
(@GGUID+2,@Banner,0,1,1,-4917.682,-844.4085,501.661255,-2.4609127,0,0,0,0,120,0,1),
(@GGUID+3,@Banner,0,1,1,-5035.221,-921.6833,501.659332,0,0,0,0,0,120,0,1),
(@GGUID+4,@Banner,0,1,1,-5038.93262,-1258.80737,505.300018,0.7155849,0,0,0,0,120,0,1);
-- Event Handling
DELETE FROM `game_event_gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+4) AND `event`=@Event;
INSERT INTO `game_event_gameobject` (`guid`,`event`) VALUES
(@GGUID+0,@Event),
(@GGUID+1,@Event),
(@GGUID+2,@Event),
(@GGUID+3,@Event),
(@GGUID+4,@Event);
-- Pathing
SET @NPC :=@CGUID+2;
SET @PATH :=@NPC*10;
DELETE FROM `creature_formations` WHERE `leaderGUID`=@CGUID+2;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES 
(@CGUID+2,@CGUID+2,0,0,2),
(@CGUID+2,@CGUID+3,3,180,2);
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@NPC,@PATH);
DELETE FROM `waypoint_data` WHERE `id`=@PATH; 
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-5007.03,-1177.84,501.66,0,0,0,100,0),
(@PATH,2,-5001.6,-1153.96,501.66,0,0,0,100,0),
(@PATH,3,-4997.44,-1127.35,501.696,0,0,0,100,0),
(@PATH,4,-5000.03,-1114.52,501.651,0,0,0,100,0),
(@PATH,5,-4997.12,-1109.34,501.667,0,0,0,100,0),
(@PATH,6,-4994.9,-1099,501.66,0,0,0,100,0),
(@PATH,7,-4994.39,-1087.39,500.913,0,0,0,100,0),
(@PATH,8,-4992.23,-1050.22,497.945,0,0,0,100,0),
(@PATH,9,-4990.41,-1041.16,501.658,0,0,0,100,0),
(@PATH,10,-4986.52,-1020.52,501.656,0,0,0,100,0),
(@PATH,11,-4958.59,-977.043,501.622,0,0,0,100,0),
(@PATH,12,-4896.11,-925.091,501.589,0,0,0,100,0),
(@PATH,13,-4858.81,-910.906,501.66,0,0,0,100,0),
(@PATH,14,-4822.94,-906.469,501.66,0,0,0,100,0),
(@PATH,15,-4812.86,-906.403,497.967,0,0,0,100,0),
(@PATH,16,-4783.43,-907.789,497.959,0,0,0,100,0),
(@PATH,17,-4775.18,-907.41,501.667,0,0,0,100,0),
(@PATH,18,-4761.82,-907.258,501.633,0,0,0,100,0),
(@PATH,19,-4755.1,-910.173,501.667,0,0,0,100,0),
(@PATH,20,-4702.37,-937.593,501.673,0,0,0,100,0),
(@PATH,21,-4693.85,-961.51,501.659,0,0,0,100,0),
(@PATH,22,-4691.43,-974.311,501.492,0,0,0,100,0),
(@PATH,23,-4718.75,-982.936,501.537,0,0,0,100,0),
(@PATH,24,-4744.27,-984.132,501.485,0,0,0,100,0),
(@PATH,25,-4779.13,-1024.8,502.211,0,0,0,100,0),
(@PATH,26,-4807.38,-1032.69,502.209,0,0,0,100,0),
(@PATH,27,-4812.82,-1069.17,502.206,0,0,0,100,0),
(@PATH,28,-4836.54,-1086.65,502.196,0,0,0,100,0),
(@PATH,29,-4862.22,-1086.39,502.202,0,0,0,100,0),
(@PATH,30,-4890.83,-1113.34,501.96,0,0,0,100,0),
(@PATH,31,-4911.88,-1119.41,501.699,0,0,0,100,0),
(@PATH,32,-4937.18,-1180.6,501.701,0,0,0,100,0),
(@PATH,33,-4958.12,-1185.43,501.66,0,0,0,100,0),
(@PATH,34,-5005.38,-1176.96,501.659,0,0,0,100,0);

/* STORMWIND */

SET @Event:=18; -- Call to Arms: Alterac Valley!
SET @CGUID:=@TCGUID+571; -- Set by TDB Team (need 12) - creature.guid
SET @GGUID:=@TGGUID+256; -- Set by TDB team (need 5) - gameobject.guid
SET @Banner:=180399; -- PVP HOLIDAY ALLIANCE AV
SET @Envoy:=15103; -- Stormpike Emissary
-- Creature spawns
DELETE FROM `creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+11) AND `id` IN (@Envoy);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(@CGUID+0,@Envoy,0,1,1,0,0,-8407.716,269.765015,120.886131,2.303830,120,0,0,1,0,0,0),
(@CGUID+1,@Envoy,0,1,1,0,0,-8411.891,575.0306,92.31787,0.8552113,120,0,0,1,0,0,0),
(@CGUID+2,@Envoy,0,1,1,0,0,-8570.554,536.0959,101.5676,5.53562069,120,0,0,1,0,0,0), -- WP
(@CGUID+3,@Envoy,0,1,1,0,0,-8840.631,652.959045,97.19508,5.60250664,120,0,0,1,0,0,0),
(@CGUID+4,@Envoy,0,1,1,0,0,-8850.686,589.4897,93.7805,4.066617,120,0,0,1,0,0,0),
(@CGUID+5,@Envoy,0,1,1,0,0,-8876.826,542.381958,106.366089,0.558505356,120,0,0,1,0,0,0),
(@CGUID+6,@Envoy,0,1,1,0,0,-8409.525,271.973480,120.886131,5.352057,120,0,0,1,0,0,0),
(@CGUID+7,@Envoy,0,1,1,0,0,-8409.17,578.1779,92.05707,3.996804,120,0,0,1,0,0,0),
(@CGUID+8,@Envoy,0,1,1,0,0,-8569.019,537.0915,101.5486,5.490437,120,0,0,1,0,0,0), -- WP
(@CGUID+9,@Envoy,0,1,1,0,0,-8838.797,651.394348,96.89245,2.42600775,120,0,0,1,0,0,0),
(@CGUID+10,@Envoy,0,1,1,0,0,-8853.082,587.0096,94.02886,0.6806784,120,0,0,1,0,0,0),
(@CGUID+11,@Envoy,0,1,1,0,0,-8873.517,544.7238,106.36731,3.822271,120,0,0,1,0,0,0);
-- Event handling
DELETE FROM `game_event_creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+11) AND `event`=@Event;
INSERT INTO `game_event_creature` (`guid`,`event`) VALUES
(@CGUID+0,@Event),
(@CGUID+1,@Event),
(@CGUID+2,@Event),
(@CGUID+3,@Event),
(@CGUID+4,@Event),
(@CGUID+5,@Event),
(@CGUID+6,@Event),
(@CGUID+7,@Event),
(@CGUID+8,@Event),
(@CGUID+9,@Event),
(@CGUID+10,@Event),
(@CGUID+11,@Event);
-- GOs spawns
DELETE FROM `gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+4) AND `id`=@Banner;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@GGUID+0,@Banner,0,1,1,-8410.10,269.764740,120.885544,0.658949,0,0,0,0,120,0,1),
(@GGUID+1,@Banner,0,1,1,-8404.049,577.1971,91.97776,-0.994837165,0,0,0,0,120,0,1),
(@GGUID+2,@Banner,0,1,1,-8842.863,654.542969,97.2775345,-2.478367,0,0,0,0,120,0,1),
(@GGUID+3,@Banner,0,1,1,-8847.53,594.1285,93.42742,2.42600775,0,0,0,0,120,0,1),
(@GGUID+4,@Banner,0,1,1,-8870.397,544.6579,106.284042,-1.22172928,0,0,0,0,120,0,1);
-- Event Handling
DELETE FROM `game_event_gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+4) AND `event`=@Event;
INSERT INTO `game_event_gameobject` (`guid`,`event`) VALUES
(@GGUID+0,@Event),
(@GGUID+1,@Event),
(@GGUID+2,@Event),
(@GGUID+3,@Event),
(@GGUID+4,@Event);
-- Pathing
SET @NPC :=@CGUID+2;
SET @PATH :=@NPC*10;
DELETE FROM `creature_formations` WHERE `leaderGUID`=@CGUID+2;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES 
(@CGUID+2,@CGUID+2,0,0,2),
(@CGUID+2,@CGUID+8,3,90,2);
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@NPC,@PATH);
DELETE FROM `waypoint_data` WHERE `id`=@PATH; 
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8570.554,536.0959,101.5676,0,0,0,100,0),
(@PATH,2,-8562.135,527.5518,100.8481,0,0,0,100,0),
(@PATH,3,-8545.019,501.7888,98.58987,0,0,0,100,0),
(@PATH,4,-8518.928,522.0476,98.34337,0,0,0,100,0),
(@PATH,5,-8491.881,555.9148,97.5228,0,0,0,100,0),
(@PATH,6,-8471.632,569.6219,96.34193,0,0,0,100,0),
(@PATH,7,-8446.563,585.9563,94.03893,0,0,0,100,0),
(@PATH,8,-8429.327,569.955,93.91314,0,0,0,100,0),
(@PATH,9,-8410.321,568.2148,92.0255,0,0,0,100,0),
(@PATH,10,-8394.125,575.4545,91.26655,0,0,0,100,0),
(@PATH,11,-8382.302,593.9153,92.79506,0,0,0,100,0),
(@PATH,12,-8390.552,617.003,95.06532,0,0,0,100,0),
(@PATH,13,-8372.638,633.3256,94.5912,0,0,0,100,0),
(@PATH,14,-8352.063,628.1193,95.15635,0,0,0,100,0),
(@PATH,15,-8372.638,633.3256,94.5912,0,0,0,100,0),
(@PATH,16,-8390.552,617.003,95.06532,0,0,0,100,0),
(@PATH,17,-8382.302,593.9153,92.79506,0,0,0,100,0),
(@PATH,18,-8394.125,575.4545,91.26655,0,0,0,100,0),
(@PATH,19,-8410.321,568.2148,92.0255,0,0,0,100,0),
(@PATH,20,-8429.327,569.955,93.91314,0,0,0,100,0),
(@PATH,21,-8446.563,585.9563,94.03893,0,0,0,100,0),
(@PATH,22,-8471.632,569.6219,96.34193,0,0,0,100,0),
(@PATH,23,-8491.881,555.9148,97.5228,0,0,0,100,0),
(@PATH,24,-8510.11,529.3361,98.12134,0,0,0,100,0),
(@PATH,25,-8544.455,500.9483,98.64265,0,0,0,100,0),
(@PATH,26,-8562.683,528.1077,100.9132,0,0,0,100,0),
(@PATH,27,-8577.113,542.7529,101.7769,0,0,0,100,0),
(@PATH,28,-8597.778,526.5887,106.4112,0,0,0,100,0),
(@PATH,29,-8611.786,514.0845,103.4611,0,0,0,100,0),
(@PATH,30,-8634.363,537.2681,99.94589,0,0,0,100,0),
(@PATH,31,-8657.585,553.5839,96.93668,0,0,0,100,0),
(@PATH,32,-8678.604,549.3822,97.43567,0,0,0,100,0),
(@PATH,33,-8697.52,533.308,97.69087,0,0,0,100,0),
(@PATH,34,-8713.677,518.8915,97.12312,0,0,0,100,0),
(@PATH,35,-8730.439,539.5605,101.0586,0,0,0,100,0),
(@PATH,36,-8748.358,560.3042,97.40262,0,0,0,100,0),
(@PATH,37,-8735.849,575.6187,97.43273,0,0,0,100,0),
(@PATH,38,-8770.725,608.6893,97.1009,0,0,0,100,0),
(@PATH,39,-8799.587,588.3337,97.24448,0,0,0,100,0),
(@PATH,40,-8819.462,617.9298,94.6946,0,0,0,100,0),
(@PATH,41,-8840.702,642.2186,95.53458,0,0,0,100,0),
(@PATH,42,-8851.284,660.075,97.00168,0,0,0,100,0),
(@PATH,43,-8824.986,677.8322,97.65736,0,0,0,100,0),
(@PATH,44,-8845.731,720.7535,97.31476,0,0,0,100,0),
(@PATH,45,-8870.143,760.3932,96.71091,0,0,0,100,0),
(@PATH,46,-8880.87,754.5129,96.34776,0,0,0,100,0),
(@PATH,47,-8909.563,791.1928,87.42889,0,0,0,100,0),
(@PATH,48,-8899.243,803.0496,87.66531,0,0,0,100,0),
(@PATH,49,-8898.704,825.0118,92.13181,0,0,0,100,0),
(@PATH,50,-8907.05,846.4619,96.0285,0,0,0,100,0),
(@PATH,51,-8894.591,866.9803,97.40501,0,0,0,100,0),
(@PATH,52,-8887.743,890.7758,103.4314,0,0,0,100,0),
(@PATH,53,-8894.479,911.8125,110.7628,0,0,0,100,0),
(@PATH,54,-8854.065,933.5222,102.07,0,0,0,100,0),
(@PATH,55,-8894.479,911.8125,110.7628,0,0,0,100,0),
(@PATH,56,-8887.743,890.7758,103.4314,0,0,0,100,0),
(@PATH,57,-8894.591,866.9803,97.40501,0,0,0,100,0),
(@PATH,58,-8907.05,846.4619,96.0285,0,0,0,100,0),
(@PATH,59,-8898.704,825.0118,92.13181,0,0,0,100,0),
(@PATH,60,-8899.162,803.1423,87.70878,0,0,0,100,0),
(@PATH,61,-8909.563,791.1928,87.42889,0,0,0,100,0),
(@PATH,62,-8880.87,754.5129,96.34776,0,0,0,100,0),
(@PATH,63,-8870.143,760.3932,96.71091,0,0,0,100,0),
(@PATH,64,-8845.751,720.7937,97.27263,0,0,0,100,0),
(@PATH,65,-8824.986,677.8322,97.65736,0,0,0,100,0),
(@PATH,66,-8851.284,660.075,97.00168,0,0,0,100,0),
(@PATH,67,-8840.74,642.2621,95.53203,0,0,0,100,0),
(@PATH,68,-8819.462,617.9298,94.6946,0,0,0,100,0),
(@PATH,69,-8799.587,588.3337,97.24448,0,0,0,100,0),
(@PATH,70,-8770.725,608.6893,97.1009,0,0,0,100,0),
(@PATH,71,-8735.849,575.6187,97.43273,0,0,0,100,0),
(@PATH,72,-8748.358,560.3042,97.40262,0,0,0,100,0),
(@PATH,73,-8730.582,539.7355,101.0766,0,0,0,100,0),
(@PATH,74,-8713.677,518.8915,97.12312,0,0,0,100,0),
(@PATH,75,-8697.52,533.308,97.69087,0,0,0,100,0),
(@PATH,76,-8678.604,549.3822,97.43567,0,0,0,100,0),
(@PATH,77,-8657.585,553.5839,96.93668,0,0,0,100,0),
(@PATH,78,-8634.363,537.2681,99.94589,0,0,0,100,0),
(@PATH,79,-8611.786,514.0845,103.4611,0,0,0,100,0),
(@PATH,80,-8597.778,526.5887,106.4112,0,0,0,100,0),
(@PATH,81,-8577.113,542.7529,101.7769,0,0,0,100,0);

SET @Event:=20; -- Call to Arms: Arathi Basin!
SET @CGUID:=@TCGUID+584; -- Set by TDB Team (need 12) - creature.guid
SET @GGUID:=@TGGUID+261; -- Set by TDB team (need 5) - gameobject.guid
SET @Banner:=180398; -- PVP HOLIDAY ALLIANCE ARATHI
SET @Envoy:=14991; -- League of Arathor Emissary
-- Creature spawns
DELETE FROM `creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+11) AND `id` IN (@Envoy);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(@CGUID+0,@Envoy,0,1,1,0,0,-8407.716,269.765015,120.886131,2.303830,120,0,0,1,0,0,0),
(@CGUID+1,@Envoy,0,1,1,0,0,-8411.891,575.0306,92.31787,0.8552113,120,0,0,1,0,0,0),
(@CGUID+2,@Envoy,0,1,1,0,0,-8570.554,536.0959,101.5676,5.53562069,120,0,0,1,0,0,0), -- WP
(@CGUID+3,@Envoy,0,1,1,0,0,-8840.631,652.959045,97.19508,5.60250664,120,0,0,1,0,0,0),
(@CGUID+4,@Envoy,0,1,1,0,0,-8850.686,589.4897,93.7805,4.066617,120,0,0,1,0,0,0),
(@CGUID+5,@Envoy,0,1,1,0,0,-8876.826,542.381958,106.366089,0.558505356,120,0,0,1,0,0,0),
(@CGUID+6,@Envoy,0,1,1,0,0,-8409.525,271.973480,120.886131,5.352057,120,0,0,1,0,0,0),
(@CGUID+7,@Envoy,0,1,1,0,0,-8409.17,578.1779,92.05707,3.996804,120,0,0,1,0,0,0),
(@CGUID+8,@Envoy,0,1,1,0,0,-8569.019,537.0915,101.5486,5.490437,120,0,0,1,0,0,0), -- WP
(@CGUID+9,@Envoy,0,1,1,0,0,-8838.797,651.394348,96.89245,2.42600775,120,0,0,1,0,0,0),
(@CGUID+10,@Envoy,0,1,1,0,0,-8853.082,587.0096,94.02886,0.6806784,120,0,0,1,0,0,0),
(@CGUID+11,@Envoy,0,1,1,0,0,-8873.517,544.7238,106.36731,3.822271,120,0,0,1,0,0,0);
-- Event handling
DELETE FROM `game_event_creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+11) AND `event`=@Event;
INSERT INTO `game_event_creature` (`guid`,`event`) VALUES
(@CGUID+0,@Event),
(@CGUID+1,@Event),
(@CGUID+2,@Event),
(@CGUID+3,@Event),
(@CGUID+4,@Event),
(@CGUID+5,@Event),
(@CGUID+6,@Event),
(@CGUID+7,@Event),
(@CGUID+8,@Event),
(@CGUID+9,@Event),
(@CGUID+10,@Event),
(@CGUID+11,@Event);
-- GOs spawns
DELETE FROM `gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+4) AND `id`=@Banner;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@GGUID+0,@Banner,0,1,1,-8410.10,269.764740,120.885544,0.658949,0,0,0,0,120,0,1),
(@GGUID+1,@Banner,0,1,1,-8404.049,577.1971,91.97776,-0.994837165,0,0,0,0,120,0,1),
(@GGUID+2,@Banner,0,1,1,-8842.863,654.542969,97.2775345,-2.478367,0,0,0,0,120,0,1),
(@GGUID+3,@Banner,0,1,1,-8847.53,594.1285,93.42742,2.42600775,0,0,0,0,120,0,1),
(@GGUID+4,@Banner,0,1,1,-8870.397,544.6579,106.284042,-1.22172928,0,0,0,0,120,0,1);
-- Event Handling
DELETE FROM `game_event_gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+4) AND `event`=@Event;
INSERT INTO `game_event_gameobject` (`guid`,`event`) VALUES
(@GGUID+0,@Event),
(@GGUID+1,@Event),
(@GGUID+2,@Event),
(@GGUID+3,@Event),
(@GGUID+4,@Event);
-- Pathing
SET @NPC :=@CGUID+2;
SET @PATH :=@NPC*10;
DELETE FROM `creature_formations` WHERE `leaderGUID`=@CGUID+2;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES 
(@CGUID+2,@CGUID+2,0,0,2),
(@CGUID+2,@CGUID+8,3,90,2);
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@NPC,@PATH);
DELETE FROM `waypoint_data` WHERE `id`=@PATH; 
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8570.554,536.0959,101.5676,0,0,0,100,0),
(@PATH,2,-8562.135,527.5518,100.8481,0,0,0,100,0),
(@PATH,3,-8545.019,501.7888,98.58987,0,0,0,100,0),
(@PATH,4,-8518.928,522.0476,98.34337,0,0,0,100,0),
(@PATH,5,-8491.881,555.9148,97.5228,0,0,0,100,0),
(@PATH,6,-8471.632,569.6219,96.34193,0,0,0,100,0),
(@PATH,7,-8446.563,585.9563,94.03893,0,0,0,100,0),
(@PATH,8,-8429.327,569.955,93.91314,0,0,0,100,0),
(@PATH,9,-8410.321,568.2148,92.0255,0,0,0,100,0),
(@PATH,10,-8394.125,575.4545,91.26655,0,0,0,100,0),
(@PATH,11,-8382.302,593.9153,92.79506,0,0,0,100,0),
(@PATH,12,-8390.552,617.003,95.06532,0,0,0,100,0),
(@PATH,13,-8372.638,633.3256,94.5912,0,0,0,100,0),
(@PATH,14,-8352.063,628.1193,95.15635,0,0,0,100,0),
(@PATH,15,-8372.638,633.3256,94.5912,0,0,0,100,0),
(@PATH,16,-8390.552,617.003,95.06532,0,0,0,100,0),
(@PATH,17,-8382.302,593.9153,92.79506,0,0,0,100,0),
(@PATH,18,-8394.125,575.4545,91.26655,0,0,0,100,0),
(@PATH,19,-8410.321,568.2148,92.0255,0,0,0,100,0),
(@PATH,20,-8429.327,569.955,93.91314,0,0,0,100,0),
(@PATH,21,-8446.563,585.9563,94.03893,0,0,0,100,0),
(@PATH,22,-8471.632,569.6219,96.34193,0,0,0,100,0),
(@PATH,23,-8491.881,555.9148,97.5228,0,0,0,100,0),
(@PATH,24,-8510.11,529.3361,98.12134,0,0,0,100,0),
(@PATH,25,-8544.455,500.9483,98.64265,0,0,0,100,0),
(@PATH,26,-8562.683,528.1077,100.9132,0,0,0,100,0),
(@PATH,27,-8577.113,542.7529,101.7769,0,0,0,100,0),
(@PATH,28,-8597.778,526.5887,106.4112,0,0,0,100,0),
(@PATH,29,-8611.786,514.0845,103.4611,0,0,0,100,0),
(@PATH,30,-8634.363,537.2681,99.94589,0,0,0,100,0),
(@PATH,31,-8657.585,553.5839,96.93668,0,0,0,100,0),
(@PATH,32,-8678.604,549.3822,97.43567,0,0,0,100,0),
(@PATH,33,-8697.52,533.308,97.69087,0,0,0,100,0),
(@PATH,34,-8713.677,518.8915,97.12312,0,0,0,100,0),
(@PATH,35,-8730.439,539.5605,101.0586,0,0,0,100,0),
(@PATH,36,-8748.358,560.3042,97.40262,0,0,0,100,0),
(@PATH,37,-8735.849,575.6187,97.43273,0,0,0,100,0),
(@PATH,38,-8770.725,608.6893,97.1009,0,0,0,100,0),
(@PATH,39,-8799.587,588.3337,97.24448,0,0,0,100,0),
(@PATH,40,-8819.462,617.9298,94.6946,0,0,0,100,0),
(@PATH,41,-8840.702,642.2186,95.53458,0,0,0,100,0),
(@PATH,42,-8851.284,660.075,97.00168,0,0,0,100,0),
(@PATH,43,-8824.986,677.8322,97.65736,0,0,0,100,0),
(@PATH,44,-8845.731,720.7535,97.31476,0,0,0,100,0),
(@PATH,45,-8870.143,760.3932,96.71091,0,0,0,100,0),
(@PATH,46,-8880.87,754.5129,96.34776,0,0,0,100,0),
(@PATH,47,-8909.563,791.1928,87.42889,0,0,0,100,0),
(@PATH,48,-8899.243,803.0496,87.66531,0,0,0,100,0),
(@PATH,49,-8898.704,825.0118,92.13181,0,0,0,100,0),
(@PATH,50,-8907.05,846.4619,96.0285,0,0,0,100,0),
(@PATH,51,-8894.591,866.9803,97.40501,0,0,0,100,0),
(@PATH,52,-8887.743,890.7758,103.4314,0,0,0,100,0),
(@PATH,53,-8894.479,911.8125,110.7628,0,0,0,100,0),
(@PATH,54,-8854.065,933.5222,102.07,0,0,0,100,0),
(@PATH,55,-8894.479,911.8125,110.7628,0,0,0,100,0),
(@PATH,56,-8887.743,890.7758,103.4314,0,0,0,100,0),
(@PATH,57,-8894.591,866.9803,97.40501,0,0,0,100,0),
(@PATH,58,-8907.05,846.4619,96.0285,0,0,0,100,0),
(@PATH,59,-8898.704,825.0118,92.13181,0,0,0,100,0),
(@PATH,60,-8899.162,803.1423,87.70878,0,0,0,100,0),
(@PATH,61,-8909.563,791.1928,87.42889,0,0,0,100,0),
(@PATH,62,-8880.87,754.5129,96.34776,0,0,0,100,0),
(@PATH,63,-8870.143,760.3932,96.71091,0,0,0,100,0),
(@PATH,64,-8845.751,720.7937,97.27263,0,0,0,100,0),
(@PATH,65,-8824.986,677.8322,97.65736,0,0,0,100,0),
(@PATH,66,-8851.284,660.075,97.00168,0,0,0,100,0),
(@PATH,67,-8840.74,642.2621,95.53203,0,0,0,100,0),
(@PATH,68,-8819.462,617.9298,94.6946,0,0,0,100,0),
(@PATH,69,-8799.587,588.3337,97.24448,0,0,0,100,0),
(@PATH,70,-8770.725,608.6893,97.1009,0,0,0,100,0),
(@PATH,71,-8735.849,575.6187,97.43273,0,0,0,100,0),
(@PATH,72,-8748.358,560.3042,97.40262,0,0,0,100,0),
(@PATH,73,-8730.582,539.7355,101.0766,0,0,0,100,0),
(@PATH,74,-8713.677,518.8915,97.12312,0,0,0,100,0),
(@PATH,75,-8697.52,533.308,97.69087,0,0,0,100,0),
(@PATH,76,-8678.604,549.3822,97.43567,0,0,0,100,0),
(@PATH,77,-8657.585,553.5839,96.93668,0,0,0,100,0),
(@PATH,78,-8634.363,537.2681,99.94589,0,0,0,100,0),
(@PATH,79,-8611.786,514.0845,103.4611,0,0,0,100,0),
(@PATH,80,-8597.778,526.5887,106.4112,0,0,0,100,0),
(@PATH,81,-8577.113,542.7529,101.7769,0,0,0,100,0);

SET @Event:=21; -- Call to Arms: Eye of the Storm!
SET @CGUID:=@TCGUID+597; -- Set by TDB Team (need 12) - creature.guid
SET @GGUID:=@TGGUID+266; -- Set by TDB team (need 5) - gameobject.guid
SET @Banner:=185107; -- Draenei Banner
SET @Envoy:=22013; -- Eye of the Storm Emissary
-- Creature spawns
DELETE FROM `creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+11) AND `id` IN (@Envoy);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(@CGUID+0,@Envoy,0,1,1,0,0,-8407.716,269.765015,120.886131,2.303830,120,0,0,1,0,0,0),
(@CGUID+1,@Envoy,0,1,1,0,0,-8411.891,575.0306,92.31787,0.8552113,120,0,0,1,0,0,0),
(@CGUID+2,@Envoy,0,1,1,0,0,-8570.554,536.0959,101.5676,5.53562069,120,0,0,1,0,0,0), -- WP
(@CGUID+3,@Envoy,0,1,1,0,0,-8840.631,652.959045,97.19508,5.60250664,120,0,0,1,0,0,0),
(@CGUID+4,@Envoy,0,1,1,0,0,-8850.686,589.4897,93.7805,4.066617,120,0,0,1,0,0,0),
(@CGUID+5,@Envoy,0,1,1,0,0,-8876.826,542.381958,106.366089,0.558505356,120,0,0,1,0,0,0),
(@CGUID+6,@Envoy,0,1,1,0,0,-8409.525,271.973480,120.886131,5.352057,120,0,0,1,0,0,0),
(@CGUID+7,@Envoy,0,1,1,0,0,-8409.17,578.1779,92.05707,3.996804,120,0,0,1,0,0,0),
(@CGUID+8,@Envoy,0,1,1,0,0,-8569.019,537.0915,101.5486,5.490437,120,0,0,1,0,0,0), -- WP
(@CGUID+9,@Envoy,0,1,1,0,0,-8838.797,651.394348,96.89245,2.42600775,120,0,0,1,0,0,0),
(@CGUID+10,@Envoy,0,1,1,0,0,-8853.082,587.0096,94.02886,0.6806784,120,0,0,1,0,0,0),
(@CGUID+11,@Envoy,0,1,1,0,0,-8873.517,544.7238,106.36731,3.822271,120,0,0,1,0,0,0);
-- Event handling
DELETE FROM `game_event_creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+11) AND `event`=@Event;
INSERT INTO `game_event_creature` (`guid`,`event`) VALUES
(@CGUID+0,@Event),
(@CGUID+1,@Event),
(@CGUID+2,@Event),
(@CGUID+3,@Event),
(@CGUID+4,@Event),
(@CGUID+5,@Event),
(@CGUID+6,@Event),
(@CGUID+7,@Event),
(@CGUID+8,@Event),
(@CGUID+9,@Event),
(@CGUID+10,@Event),
(@CGUID+11,@Event);
-- GOs spawns
DELETE FROM `gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+4) AND `id`=@Banner;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@GGUID+0,@Banner,0,1,1,-8410.10,269.764740,120.885544,0.658949,0,0,0,0,120,0,1),
(@GGUID+1,@Banner,0,1,1,-8404.049,577.1971,91.97776,-0.994837165,0,0,0,0,120,0,1),
(@GGUID+2,@Banner,0,1,1,-8842.863,654.542969,97.2775345,-2.478367,0,0,0,0,120,0,1),
(@GGUID+3,@Banner,0,1,1,-8847.53,594.1285,93.42742,2.42600775,0,0,0,0,120,0,1),
(@GGUID+4,@Banner,0,1,1,-8870.397,544.6579,106.284042,-1.22172928,0,0,0,0,120,0,1);
-- Event Handling
DELETE FROM `game_event_gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+4) AND `event`=@Event;
INSERT INTO `game_event_gameobject` (`guid`,`event`) VALUES
(@GGUID+0,@Event),
(@GGUID+1,@Event),
(@GGUID+2,@Event),
(@GGUID+3,@Event),
(@GGUID+4,@Event);
-- Pathing
SET @NPC :=@CGUID+2;
SET @PATH :=@NPC*10;
DELETE FROM `creature_formations` WHERE `leaderGUID`=@CGUID+2;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES 
(@CGUID+2,@CGUID+2,0,0,2),
(@CGUID+2,@CGUID+8,3,90,2);
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@NPC,@PATH);
DELETE FROM `waypoint_data` WHERE `id`=@PATH; 
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8570.554,536.0959,101.5676,0,0,0,100,0),
(@PATH,2,-8562.135,527.5518,100.8481,0,0,0,100,0),
(@PATH,3,-8545.019,501.7888,98.58987,0,0,0,100,0),
(@PATH,4,-8518.928,522.0476,98.34337,0,0,0,100,0),
(@PATH,5,-8491.881,555.9148,97.5228,0,0,0,100,0),
(@PATH,6,-8471.632,569.6219,96.34193,0,0,0,100,0),
(@PATH,7,-8446.563,585.9563,94.03893,0,0,0,100,0),
(@PATH,8,-8429.327,569.955,93.91314,0,0,0,100,0),
(@PATH,9,-8410.321,568.2148,92.0255,0,0,0,100,0),
(@PATH,10,-8394.125,575.4545,91.26655,0,0,0,100,0),
(@PATH,11,-8382.302,593.9153,92.79506,0,0,0,100,0),
(@PATH,12,-8390.552,617.003,95.06532,0,0,0,100,0),
(@PATH,13,-8372.638,633.3256,94.5912,0,0,0,100,0),
(@PATH,14,-8352.063,628.1193,95.15635,0,0,0,100,0),
(@PATH,15,-8372.638,633.3256,94.5912,0,0,0,100,0),
(@PATH,16,-8390.552,617.003,95.06532,0,0,0,100,0),
(@PATH,17,-8382.302,593.9153,92.79506,0,0,0,100,0),
(@PATH,18,-8394.125,575.4545,91.26655,0,0,0,100,0),
(@PATH,19,-8410.321,568.2148,92.0255,0,0,0,100,0),
(@PATH,20,-8429.327,569.955,93.91314,0,0,0,100,0),
(@PATH,21,-8446.563,585.9563,94.03893,0,0,0,100,0),
(@PATH,22,-8471.632,569.6219,96.34193,0,0,0,100,0),
(@PATH,23,-8491.881,555.9148,97.5228,0,0,0,100,0),
(@PATH,24,-8510.11,529.3361,98.12134,0,0,0,100,0),
(@PATH,25,-8544.455,500.9483,98.64265,0,0,0,100,0),
(@PATH,26,-8562.683,528.1077,100.9132,0,0,0,100,0),
(@PATH,27,-8577.113,542.7529,101.7769,0,0,0,100,0),
(@PATH,28,-8597.778,526.5887,106.4112,0,0,0,100,0),
(@PATH,29,-8611.786,514.0845,103.4611,0,0,0,100,0),
(@PATH,30,-8634.363,537.2681,99.94589,0,0,0,100,0),
(@PATH,31,-8657.585,553.5839,96.93668,0,0,0,100,0),
(@PATH,32,-8678.604,549.3822,97.43567,0,0,0,100,0),
(@PATH,33,-8697.52,533.308,97.69087,0,0,0,100,0),
(@PATH,34,-8713.677,518.8915,97.12312,0,0,0,100,0),
(@PATH,35,-8730.439,539.5605,101.0586,0,0,0,100,0),
(@PATH,36,-8748.358,560.3042,97.40262,0,0,0,100,0),
(@PATH,37,-8735.849,575.6187,97.43273,0,0,0,100,0),
(@PATH,38,-8770.725,608.6893,97.1009,0,0,0,100,0),
(@PATH,39,-8799.587,588.3337,97.24448,0,0,0,100,0),
(@PATH,40,-8819.462,617.9298,94.6946,0,0,0,100,0),
(@PATH,41,-8840.702,642.2186,95.53458,0,0,0,100,0),
(@PATH,42,-8851.284,660.075,97.00168,0,0,0,100,0),
(@PATH,43,-8824.986,677.8322,97.65736,0,0,0,100,0),
(@PATH,44,-8845.731,720.7535,97.31476,0,0,0,100,0),
(@PATH,45,-8870.143,760.3932,96.71091,0,0,0,100,0),
(@PATH,46,-8880.87,754.5129,96.34776,0,0,0,100,0),
(@PATH,47,-8909.563,791.1928,87.42889,0,0,0,100,0),
(@PATH,48,-8899.243,803.0496,87.66531,0,0,0,100,0),
(@PATH,49,-8898.704,825.0118,92.13181,0,0,0,100,0),
(@PATH,50,-8907.05,846.4619,96.0285,0,0,0,100,0),
(@PATH,51,-8894.591,866.9803,97.40501,0,0,0,100,0),
(@PATH,52,-8887.743,890.7758,103.4314,0,0,0,100,0),
(@PATH,53,-8894.479,911.8125,110.7628,0,0,0,100,0),
(@PATH,54,-8854.065,933.5222,102.07,0,0,0,100,0),
(@PATH,55,-8894.479,911.8125,110.7628,0,0,0,100,0),
(@PATH,56,-8887.743,890.7758,103.4314,0,0,0,100,0),
(@PATH,57,-8894.591,866.9803,97.40501,0,0,0,100,0),
(@PATH,58,-8907.05,846.4619,96.0285,0,0,0,100,0),
(@PATH,59,-8898.704,825.0118,92.13181,0,0,0,100,0),
(@PATH,60,-8899.162,803.1423,87.70878,0,0,0,100,0),
(@PATH,61,-8909.563,791.1928,87.42889,0,0,0,100,0),
(@PATH,62,-8880.87,754.5129,96.34776,0,0,0,100,0),
(@PATH,63,-8870.143,760.3932,96.71091,0,0,0,100,0),
(@PATH,64,-8845.751,720.7937,97.27263,0,0,0,100,0),
(@PATH,65,-8824.986,677.8322,97.65736,0,0,0,100,0),
(@PATH,66,-8851.284,660.075,97.00168,0,0,0,100,0),
(@PATH,67,-8840.74,642.2621,95.53203,0,0,0,100,0),
(@PATH,68,-8819.462,617.9298,94.6946,0,0,0,100,0),
(@PATH,69,-8799.587,588.3337,97.24448,0,0,0,100,0),
(@PATH,70,-8770.725,608.6893,97.1009,0,0,0,100,0),
(@PATH,71,-8735.849,575.6187,97.43273,0,0,0,100,0),
(@PATH,72,-8748.358,560.3042,97.40262,0,0,0,100,0),
(@PATH,73,-8730.582,539.7355,101.0766,0,0,0,100,0),
(@PATH,74,-8713.677,518.8915,97.12312,0,0,0,100,0),
(@PATH,75,-8697.52,533.308,97.69087,0,0,0,100,0),
(@PATH,76,-8678.604,549.3822,97.43567,0,0,0,100,0),
(@PATH,77,-8657.585,553.5839,96.93668,0,0,0,100,0),
(@PATH,78,-8634.363,537.2681,99.94589,0,0,0,100,0),
(@PATH,79,-8611.786,514.0845,103.4611,0,0,0,100,0),
(@PATH,80,-8597.778,526.5887,106.4112,0,0,0,100,0),
(@PATH,81,-8577.113,542.7529,101.7769,0,0,0,100,0);

SET @Event:=19; -- Call to Arms: Warsong Gulch!
SET @CGUID:=@TCGUID+610; -- Set by TDB Team (need 12) - creature.guid
SET @GGUID:=@TGGUID+271; -- Set by TDB team (need 5) - gameobject.guid
SET @Banner:=180400; -- PVP HOLIDAY ALLIANCE CTF
SET @Envoy:=15102; -- Silverwing Emissary
-- Creature spawns
DELETE FROM `creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+11) AND `id` IN (@Envoy);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(@CGUID+0,@Envoy,0,1,1,0,0,-8407.716,269.765015,120.886131,2.303830,120,0,0,1,0,0,0),
(@CGUID+1,@Envoy,0,1,1,0,0,-8411.891,575.0306,92.31787,0.8552113,120,0,0,1,0,0,0),
(@CGUID+2,@Envoy,0,1,1,0,0,-8570.554,536.0959,101.5676,5.53562069,120,0,0,1,0,0,0), -- WP
(@CGUID+3,@Envoy,0,1,1,0,0,-8840.631,652.959045,97.19508,5.60250664,120,0,0,1,0,0,0),
(@CGUID+4,@Envoy,0,1,1,0,0,-8850.686,589.4897,93.7805,4.066617,120,0,0,1,0,0,0),
(@CGUID+5,@Envoy,0,1,1,0,0,-8876.826,542.381958,106.366089,0.558505356,120,0,0,1,0,0,0),
(@CGUID+6,@Envoy,0,1,1,0,0,-8409.525,271.973480,120.886131,5.352057,120,0,0,1,0,0,0),
(@CGUID+7,@Envoy,0,1,1,0,0,-8409.17,578.1779,92.05707,3.996804,120,0,0,1,0,0,0),
(@CGUID+8,@Envoy,0,1,1,0,0,-8569.019,537.0915,101.5486,5.490437,120,0,0,1,0,0,0), -- WP
(@CGUID+9,@Envoy,0,1,1,0,0,-8838.797,651.394348,96.89245,2.42600775,120,0,0,1,0,0,0),
(@CGUID+10,@Envoy,0,1,1,0,0,-8853.082,587.0096,94.02886,0.6806784,120,0,0,1,0,0,0),
(@CGUID+11,@Envoy,0,1,1,0,0,-8873.517,544.7238,106.36731,3.822271,120,0,0,1,0,0,0);
-- Event handling
DELETE FROM `game_event_creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+11) AND `event`=@Event;
INSERT INTO `game_event_creature` (`guid`,`event`) VALUES
(@CGUID+0,@Event),
(@CGUID+1,@Event),
(@CGUID+2,@Event),
(@CGUID+3,@Event),
(@CGUID+4,@Event),
(@CGUID+5,@Event),
(@CGUID+6,@Event),
(@CGUID+7,@Event),
(@CGUID+8,@Event),
(@CGUID+9,@Event),
(@CGUID+10,@Event),
(@CGUID+11,@Event);
-- GOs spawns
DELETE FROM `gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+4) AND `id`=@Banner;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@GGUID+0,@Banner,0,1,1,-8410.10,269.764740,120.885544,0.658949,0,0,0,0,120,0,1),
(@GGUID+1,@Banner,0,1,1,-8404.049,577.1971,91.97776,-0.994837165,0,0,0,0,120,0,1),
(@GGUID+2,@Banner,0,1,1,-8842.863,654.542969,97.2775345,-2.478367,0,0,0,0,120,0,1),
(@GGUID+3,@Banner,0,1,1,-8847.53,594.1285,93.42742,2.42600775,0,0,0,0,120,0,1),
(@GGUID+4,@Banner,0,1,1,-8870.397,544.6579,106.284042,-1.22172928,0,0,0,0,120,0,1);
-- Event Handling
DELETE FROM `game_event_gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+4) AND `event`=@Event;
INSERT INTO `game_event_gameobject` (`guid`,`event`) VALUES
(@GGUID+0,@Event),
(@GGUID+1,@Event),
(@GGUID+2,@Event),
(@GGUID+3,@Event),
(@GGUID+4,@Event);
-- Pathing
SET @NPC :=@CGUID+2;
SET @PATH :=@NPC*10;
DELETE FROM `creature_formations` WHERE `leaderGUID`=@CGUID+2;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES 
(@CGUID+2,@CGUID+2,0,0,2),
(@CGUID+2,@CGUID+8,3,90,2);
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@NPC,@PATH);
DELETE FROM `waypoint_data` WHERE `id`=@PATH; 
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8570.554,536.0959,101.5676,0,0,0,100,0),
(@PATH,2,-8562.135,527.5518,100.8481,0,0,0,100,0),
(@PATH,3,-8545.019,501.7888,98.58987,0,0,0,100,0),
(@PATH,4,-8518.928,522.0476,98.34337,0,0,0,100,0),
(@PATH,5,-8491.881,555.9148,97.5228,0,0,0,100,0),
(@PATH,6,-8471.632,569.6219,96.34193,0,0,0,100,0),
(@PATH,7,-8446.563,585.9563,94.03893,0,0,0,100,0),
(@PATH,8,-8429.327,569.955,93.91314,0,0,0,100,0),
(@PATH,9,-8410.321,568.2148,92.0255,0,0,0,100,0),
(@PATH,10,-8394.125,575.4545,91.26655,0,0,0,100,0),
(@PATH,11,-8382.302,593.9153,92.79506,0,0,0,100,0),
(@PATH,12,-8390.552,617.003,95.06532,0,0,0,100,0),
(@PATH,13,-8372.638,633.3256,94.5912,0,0,0,100,0),
(@PATH,14,-8352.063,628.1193,95.15635,0,0,0,100,0),
(@PATH,15,-8372.638,633.3256,94.5912,0,0,0,100,0),
(@PATH,16,-8390.552,617.003,95.06532,0,0,0,100,0),
(@PATH,17,-8382.302,593.9153,92.79506,0,0,0,100,0),
(@PATH,18,-8394.125,575.4545,91.26655,0,0,0,100,0),
(@PATH,19,-8410.321,568.2148,92.0255,0,0,0,100,0),
(@PATH,20,-8429.327,569.955,93.91314,0,0,0,100,0),
(@PATH,21,-8446.563,585.9563,94.03893,0,0,0,100,0),
(@PATH,22,-8471.632,569.6219,96.34193,0,0,0,100,0),
(@PATH,23,-8491.881,555.9148,97.5228,0,0,0,100,0),
(@PATH,24,-8510.11,529.3361,98.12134,0,0,0,100,0),
(@PATH,25,-8544.455,500.9483,98.64265,0,0,0,100,0),
(@PATH,26,-8562.683,528.1077,100.9132,0,0,0,100,0),
(@PATH,27,-8577.113,542.7529,101.7769,0,0,0,100,0),
(@PATH,28,-8597.778,526.5887,106.4112,0,0,0,100,0),
(@PATH,29,-8611.786,514.0845,103.4611,0,0,0,100,0),
(@PATH,30,-8634.363,537.2681,99.94589,0,0,0,100,0),
(@PATH,31,-8657.585,553.5839,96.93668,0,0,0,100,0),
(@PATH,32,-8678.604,549.3822,97.43567,0,0,0,100,0),
(@PATH,33,-8697.52,533.308,97.69087,0,0,0,100,0),
(@PATH,34,-8713.677,518.8915,97.12312,0,0,0,100,0),
(@PATH,35,-8730.439,539.5605,101.0586,0,0,0,100,0),
(@PATH,36,-8748.358,560.3042,97.40262,0,0,0,100,0),
(@PATH,37,-8735.849,575.6187,97.43273,0,0,0,100,0),
(@PATH,38,-8770.725,608.6893,97.1009,0,0,0,100,0),
(@PATH,39,-8799.587,588.3337,97.24448,0,0,0,100,0),
(@PATH,40,-8819.462,617.9298,94.6946,0,0,0,100,0),
(@PATH,41,-8840.702,642.2186,95.53458,0,0,0,100,0),
(@PATH,42,-8851.284,660.075,97.00168,0,0,0,100,0),
(@PATH,43,-8824.986,677.8322,97.65736,0,0,0,100,0),
(@PATH,44,-8845.731,720.7535,97.31476,0,0,0,100,0),
(@PATH,45,-8870.143,760.3932,96.71091,0,0,0,100,0),
(@PATH,46,-8880.87,754.5129,96.34776,0,0,0,100,0),
(@PATH,47,-8909.563,791.1928,87.42889,0,0,0,100,0),
(@PATH,48,-8899.243,803.0496,87.66531,0,0,0,100,0),
(@PATH,49,-8898.704,825.0118,92.13181,0,0,0,100,0),
(@PATH,50,-8907.05,846.4619,96.0285,0,0,0,100,0),
(@PATH,51,-8894.591,866.9803,97.40501,0,0,0,100,0),
(@PATH,52,-8887.743,890.7758,103.4314,0,0,0,100,0),
(@PATH,53,-8894.479,911.8125,110.7628,0,0,0,100,0),
(@PATH,54,-8854.065,933.5222,102.07,0,0,0,100,0),
(@PATH,55,-8894.479,911.8125,110.7628,0,0,0,100,0),
(@PATH,56,-8887.743,890.7758,103.4314,0,0,0,100,0),
(@PATH,57,-8894.591,866.9803,97.40501,0,0,0,100,0),
(@PATH,58,-8907.05,846.4619,96.0285,0,0,0,100,0),
(@PATH,59,-8898.704,825.0118,92.13181,0,0,0,100,0),
(@PATH,60,-8899.162,803.1423,87.70878,0,0,0,100,0),
(@PATH,61,-8909.563,791.1928,87.42889,0,0,0,100,0),
(@PATH,62,-8880.87,754.5129,96.34776,0,0,0,100,0),
(@PATH,63,-8870.143,760.3932,96.71091,0,0,0,100,0),
(@PATH,64,-8845.751,720.7937,97.27263,0,0,0,100,0),
(@PATH,65,-8824.986,677.8322,97.65736,0,0,0,100,0),
(@PATH,66,-8851.284,660.075,97.00168,0,0,0,100,0),
(@PATH,67,-8840.74,642.2621,95.53203,0,0,0,100,0),
(@PATH,68,-8819.462,617.9298,94.6946,0,0,0,100,0),
(@PATH,69,-8799.587,588.3337,97.24448,0,0,0,100,0),
(@PATH,70,-8770.725,608.6893,97.1009,0,0,0,100,0),
(@PATH,71,-8735.849,575.6187,97.43273,0,0,0,100,0),
(@PATH,72,-8748.358,560.3042,97.40262,0,0,0,100,0),
(@PATH,73,-8730.582,539.7355,101.0766,0,0,0,100,0),
(@PATH,74,-8713.677,518.8915,97.12312,0,0,0,100,0),
(@PATH,75,-8697.52,533.308,97.69087,0,0,0,100,0),
(@PATH,76,-8678.604,549.3822,97.43567,0,0,0,100,0),
(@PATH,77,-8657.585,553.5839,96.93668,0,0,0,100,0),
(@PATH,78,-8634.363,537.2681,99.94589,0,0,0,100,0),
(@PATH,79,-8611.786,514.0845,103.4611,0,0,0,100,0),
(@PATH,80,-8597.778,526.5887,106.4112,0,0,0,100,0),
(@PATH,81,-8577.113,542.7529,101.7769,0,0,0,100,0);


-- Horde
/* ORGRIMMAR */
SET @Event:=19; -- Call to Arms: Warsong Gulch!
SET @CGUID:=@TCGUID+634; -- Set by TDB Team (need 10) - creature.guid
SET @GGUID:=@TGGUID+280; -- Set by TDB team (need 4) - gameobject.guid
SET @Banner:=180394; -- PVP HOLIDAY HORDE CTF
SET @Envoy:=15105; -- Warsong Emissary
-- Creature spawns
DELETE FROM `creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+9) AND `id` IN (@Envoy);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(@CGUID+0,@Envoy,1,1,1,0,0,1658.86292,-4389.012,23.9963837,1.134464,120,0,0,1,0,0,0),
(@CGUID+1,@Envoy,1,1,1,0,0,1660.66492,-4385.632,24.2067738,4.118977,120,0,0,1,0,0,0),
(@CGUID+2,@Envoy,1,1,1,0,0,1665.83679,-4344.93945,61.5564346,5.375614,120,0,0,1,0,0,0),
(@CGUID+3,@Envoy,1,1,1,0,0,1667.63892,-4346.96,61.5564346,2.37364769,120,0,0,1,0,0,0),
(@CGUID+4,@Envoy,1,1,1,0,0,1743.72742,-3966.88379,49.46911,0.418879032,120,0,0,1,0,0,0),
(@CGUID+5,@Envoy,1,1,1,0,0,1747.49658,-3965.361,50.0845871,3.49065852,120,0,0,1,0,0,0),
(@CGUID+6,@Envoy,1,1,1,0,0,1954.35,-4722.71,42.659,1.99567,120,0,0,1,0,0,0), -- WP
(@CGUID+7,@Envoy,1,1,1,0,0,1952.39,-4723.16,42.1039,1.87001,120,0,0,1,0,0,0), -- WP
(@CGUID+8,@Envoy,1,1,1,0,0,1936.9115,-4712.061,37.3310471,1.18682384,120,0,0,1,0,0,0),
(@CGUID+9,@Envoy,1,1,1,0,0,1937.18225,-4707.44629,35.7722168,4.363323,120,0,0,1,0,0,0);
-- Event handling
DELETE FROM `game_event_creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+9) AND `event`=@Event;
INSERT INTO `game_event_creature` (`guid`,`event`) VALUES
(@CGUID+0,@Event),
(@CGUID+1,@Event),
(@CGUID+2,@Event),
(@CGUID+3,@Event),
(@CGUID+4,@Event),
(@CGUID+5,@Event),
(@CGUID+6,@Event),
(@CGUID+7,@Event),
(@CGUID+8,@Event),
(@CGUID+9,@Event);
-- GOs spawns
DELETE FROM `gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+3) AND `id`=@Banner;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@GGUID+0,@Banner,1,1,1,1663.58679,-4343.1875,61.4731026,0.7504908,0,0,0,0,120,0,1),
(@GGUID+1,@Banner,1,1,1,1657.46179,-4385.405,23.806673,-1.0122894,0,0,0,0,120,0,1),
(@GGUID+2,@Banner,1,1,1,1749.49719,-3963.362,49.77431,-2.879789,0,0,0,0,120,0,1),
(@GGUID+3,@Banner,1,1,1,1933.50867,-4709.62354,36.9713669,1.62315571,0,0,0,0,120,0,1);
-- Event handling
DELETE FROM `game_event_gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+3) AND `event`=@Event;
INSERT INTO `game_event_gameobject` (`guid`,`event`) VALUES
(@GGUID+0,@Event),
(@GGUID+1,@Event),
(@GGUID+2,@Event),
(@GGUID+3,@Event);
-- Pathing
SET @NPC :=@CGUID+6;
SET @PATH :=@NPC*10;
DELETE FROM `creature_formations` WHERE `leaderGUID`=@CGUID+6;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES 
(@CGUID+6,@CGUID+6,0,0,2),
(@CGUID+6,@CGUID+7,3,90,2);
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@NPC,@PATH);
DELETE FROM `waypoint_data` WHERE `id`=@PATH; 
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1954.46,-4722.56,42.6743,0,0,0,100,0),
(@PATH,2,1951.09,-4714.8,36.9093,0,0,0,100,0),
(@PATH,3,1948.98,-4697.22,28.9954,0,0,0,100,0),
(@PATH,4,1945.38,-4681.89,25.2457,0,0,0,100,0),
(@PATH,5,1937.36,-4669.2,26.5256,0,0,0,100,0),
(@PATH,6,1909.86,-4631.36,32.9827,0,0,0,100,0),
(@PATH,7,1907.75,-4627.89,34.119,0,0,0,100,0),
(@PATH,8,1894.59,-4605.89,34.1211,0,0,0,100,0),
(@PATH,9,1925.42,-4584.78,34.1211,0,0,0,100,0),
(@PATH,10,1909.95,-4559.76,34.1195,0,0,0,100,0),
(@PATH,11,1904.4,-4549.83,28.7954,0,0,0,100,0),
(@PATH,12,1893,-4531.73,28.0416,0,0,0,100,0),
(@PATH,13,1893.45,-4526.07,28.581,0,0,0,100,0),
(@PATH,14,1899.83,-4517.27,27.3582,0,0,0,100,0),
(@PATH,15,1906.73,-4505.23,24.9591,0,0,0,100,0),
(@PATH,16,1907.86,-4490.92,22.9967,0,0,0,100,0),
(@PATH,17,1900.89,-4482.65,21.1357,0,0,0,100,0),
(@PATH,18,1893.16,-4474.82,20.6826,0,0,0,100,0),
(@PATH,19,1891.65,-4462.73,19.5832,0,0,0,100,0),
(@PATH,20,1894.99,-4448.4,18.1421,0,0,0,100,0),
(@PATH,21,1896.97,-4437.62,16.2806,0,0,0,100,0),
(@PATH,22,1894.04,-4426.05,13.9888,0,0,0,100,0),
(@PATH,23,1885.5,-4418.79,11.3314,0,0,0,100,0),
(@PATH,24,1876.37,-4416.82,9.24696,0,0,0,100,0),
(@PATH,25,1856.3,-4416.08,6.07582,0,0,0,100,0),
(@PATH,26,1843.81,-4407.75,4.68483,0,0,0,100,0),
(@PATH,27,1840.08,-4400.54,4.1577,0,0,0,100,0),
(@PATH,28,1817.85,-4365.1,-9.09306,0,0,0,100,0),
(@PATH,29,1799.58,-4327.29,-11.1642,0,0,0,100,0),
(@PATH,30,1782.7,-4294.67,5.5883,0,0,0,100,0),
(@PATH,31,1776.15,-4294,6.73376,0,0,0,100,0),
(@PATH,32,1766.7,-4298.89,7.56642,0,0,0,100,0),
(@PATH,33,1761.65,-4304.24,7.2299,0,0,0,100,0),
(@PATH,34,1745.15,-4297.08,13.9415,0,0,0,100,0),
(@PATH,35,1740.24,-4292.31,15.1055,0,0,0,100,0),
(@PATH,36,1735.93,-4277.6,17.9325,0,0,0,100,0),
(@PATH,37,1742.48,-4263.41,23.8393,0,0,0,100,0),
(@PATH,38,1750.93,-4255.88,28.2688,0,0,0,100,0),
(@PATH,39,1769.24,-4248.43,36.0152,0,0,0,100,0),
(@PATH,40,1780.17,-4240.32,39.6535,0,0,0,100,0),
(@PATH,41,1784.91,-4228.93,39.8616,0,0,0,100,0),
(@PATH,42,1777.11,-4221.35,39.6674,0,0,0,100,0),
(@PATH,43,1754.45,-4213.47,42.4923,0,0,0,100,0),
(@PATH,44,1742.98,-4213.58,43.9449,0,0,0,100,0),
(@PATH,45,1729,-4220.93,45.6859,0,0,0,100,0),
(@PATH,46,1707.14,-4231.98,49.2425,0,0,0,100,0),
(@PATH,47,1683.98,-4245.42,51.3726,0,0,0,100,0),
(@PATH,48,1664.47,-4256.19,51.5929,0,0,0,100,0),
(@PATH,49,1651.2,-4264.8,50.2665,0,0,0,100,0),
(@PATH,50,1637.98,-4271.1,48.0471,0,0,0,100,0),
(@PATH,51,1623.92,-4262.35,47.1224,0,0,0,100,0),
(@PATH,52,1603.29,-4237.15,45.2332,0,0,0,100,0),
(@PATH,53,1589.27,-4219.05,44.1306,0,0,0,100,0),
(@PATH,54,1581.14,-4198.7,41.3964,0,0,0,100,0),
(@PATH,55,1579.6,-4173,37.7449,0,0,0,100,0),
(@PATH,56,1585.85,-4153.19,34.6496,0,0,0,100,0),
(@PATH,57,1606.41,-4122.96,29.7899,0,0,0,100,0),
(@PATH,58,1666.8,-4097.01,35.0078,0,0,0,100,0),
(@PATH,59,1706.45,-4087.46,39.3622,0,0,0,100,0),
(@PATH,60,1730.26,-4073.1,43.8529,0,0,0,100,0),
(@PATH,61,1744.58,-4045.25,44.1596,0,0,0,100,0),
(@PATH,62,1746.77,-4022.89,45.6474,0,0,0,100,0),
(@PATH,63,1743.11,-4000.24,46.4807,0,0,0,100,0),
(@PATH,64,1732.31,-3972.21,48.1202,0,0,0,100,0),
(@PATH,65,1743.11,-4000.24,46.4807,0,0,0,100,0),
(@PATH,66,1746.77,-4022.89,45.6474,0,0,0,100,0),
(@PATH,67,1744.58,-4045.25,44.1596,0,0,0,100,0),
(@PATH,68,1730.26,-4073.1,43.8529,0,0,0,100,0),
(@PATH,69,1706.45,-4087.46,39.3622,0,0,0,100,0),
(@PATH,70,1666.8,-4097.01,35.0078,0,0,0,100,0),
(@PATH,71,1606.41,-4122.96,29.7899,0,0,0,100,0),
(@PATH,72,1585.85,-4153.19,34.6496,0,0,0,100,0),
(@PATH,73,1579.6,-4173,37.7449,0,0,0,100,0),
(@PATH,74,1581.14,-4198.7,41.3964,0,0,0,100,0),
(@PATH,75,1589.27,-4219.05,44.1306,0,0,0,100,0),
(@PATH,76,1603.29,-4237.15,45.2332,0,0,0,100,0),
(@PATH,77,1623.92,-4262.35,47.1224,0,0,0,100,0),
(@PATH,78,1637.98,-4271.1,48.0471,0,0,0,100,0),
(@PATH,79,1651.2,-4264.8,50.2665,0,0,0,100,0),
(@PATH,80,1664.47,-4256.19,51.5929,0,0,0,100,0),
(@PATH,81,1683.98,-4245.42,51.3726,0,0,0,100,0),
(@PATH,82,1707.14,-4231.98,49.2425,0,0,0,100,0),
(@PATH,83,1729,-4220.93,45.6859,0,0,0,100,0),
(@PATH,84,1742.98,-4213.58,43.9449,0,0,0,100,0),
(@PATH,85,1754.45,-4213.47,42.4923,0,0,0,100,0),
(@PATH,86,1777.11,-4221.35,39.6674,0,0,0,100,0),
(@PATH,87,1784.91,-4228.93,39.8616,0,0,0,100,0),
(@PATH,88,1780.17,-4240.32,39.6535,0,0,0,100,0),
(@PATH,89,1769.24,-4248.43,36.0152,0,0,0,100,0),
(@PATH,90,1750.93,-4255.88,28.2688,0,0,0,100,0),
(@PATH,91,1742.48,-4263.41,23.8393,0,0,0,100,0),
(@PATH,92,1735.93,-4277.6,17.9325,0,0,0,100,0),
(@PATH,93,1740.24,-4292.31,15.1055,0,0,0,100,0),
(@PATH,94,1745.15,-4297.08,13.9415,0,0,0,100,0),
(@PATH,95,1761.65,-4304.24,7.2299,0,0,0,100,0),
(@PATH,96,1766.7,-4298.89,7.56642,0,0,0,100,0),
(@PATH,97,1776.15,-4294,6.73376,0,0,0,100,0),
(@PATH,98,1782.7,-4294.67,5.5883,0,0,0,100,0),
(@PATH,99,1799.58,-4327.29,-11.1642,0,0,0,100,0),
(@PATH,100,1817.85,-4365.1,-9.09306,0,0,0,100,0),
(@PATH,101,1840.08,-4400.54,4.1577,0,0,0,100,0),
(@PATH,102,1843.81,-4407.75,4.68483,0,0,0,100,0),
(@PATH,103,1856.3,-4416.08,6.07582,0,0,0,100,0),
(@PATH,104,1876.37,-4416.82,9.24696,0,0,0,100,0),
(@PATH,105,1885.5,-4418.79,11.3314,0,0,0,100,0),
(@PATH,106,1894.04,-4426.05,13.9888,0,0,0,100,0),
(@PATH,107,1896.97,-4437.62,16.2806,0,0,0,100,0),
(@PATH,108,1894.99,-4448.4,18.1421,0,0,0,100,0),
(@PATH,109,1891.65,-4462.73,19.5832,0,0,0,100,0),
(@PATH,110,1893.16,-4474.82,20.6826,0,0,0,100,0),
(@PATH,111,1900.89,-4482.65,21.1357,0,0,0,100,0),
(@PATH,112,1907.86,-4490.92,22.9967,0,0,0,100,0),
(@PATH,113,1906.73,-4505.23,24.9591,0,0,0,100,0),
(@PATH,114,1899.83,-4517.27,27.3582,0,0,0,100,0),
(@PATH,115,1893.45,-4526.07,28.581,0,0,0,100,0),
(@PATH,116,1893,-4531.73,28.0416,0,0,0,100,0),
(@PATH,117,1904.4,-4549.83,28.7954,0,0,0,100,0),
(@PATH,118,1909.95,-4559.76,34.1195,0,0,0,100,0),
(@PATH,119,1925.42,-4584.78,34.1211,0,0,0,100,0),
(@PATH,120,1894.59,-4605.89,34.1211,0,0,0,100,0),
(@PATH,121,1907.75,-4627.89,34.119,0,0,0,100,0),
(@PATH,122,1909.86,-4631.36,32.9827,0,0,0,100,0),
(@PATH,123,1937.36,-4669.2,26.5256,0,0,0,100,0),
(@PATH,124,1945.38,-4681.89,25.2457,0,0,0,100,0),
(@PATH,125,1948.98,-4697.22,28.9954,0,0,0,100,0),
(@PATH,126,1951.09,-4714.8,36.9093,0,0,0,100,0),
(@PATH,127,1954.46,-4722.56,42.6743,0,0,0,100,0);

SET @Event:=21; -- Call to Arms: Eye of the Storm!
SET @CGUID:=@TCGUID+656; -- Set by TDB Team (need 10) - creature.guid
SET @GGUID:=@TGGUID+288; -- Set by TDB team (need 4) - gameobject.guid
SET @Banner:=185106; -- Blood Elf Banner
SET @Envoy:=22015; -- Eye of the Storm Envoy
-- Creature spawns
DELETE FROM `creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+9) AND `id` IN (@Envoy);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(@CGUID+0,@Envoy,1,1,1,0,0,1658.86292,-4389.012,23.9963837,1.134464,120,0,0,1,0,0,0),
(@CGUID+1,@Envoy,1,1,1,0,0,1660.66492,-4385.632,24.2067738,4.118977,120,0,0,1,0,0,0),
(@CGUID+2,@Envoy,1,1,1,0,0,1665.83679,-4344.93945,61.5564346,5.375614,120,0,0,1,0,0,0),
(@CGUID+3,@Envoy,1,1,1,0,0,1667.63892,-4346.96,61.5564346,2.37364769,120,0,0,1,0,0,0),
(@CGUID+4,@Envoy,1,1,1,0,0,1743.72742,-3966.88379,49.46911,0.418879032,120,0,0,1,0,0,0),
(@CGUID+5,@Envoy,1,1,1,0,0,1747.49658,-3965.361,50.0845871,3.49065852,120,0,0,1,0,0,0),
(@CGUID+6,@Envoy,1,1,1,0,0,1954.35,-4722.71,42.659,1.99567,120,0,0,1,0,0,0), -- WP
(@CGUID+7,@Envoy,1,1,1,0,0,1952.39,-4723.16,42.1039,1.87001,120,0,0,1,0,0,0), -- WP
(@CGUID+8,@Envoy,1,1,1,0,0,1936.9115,-4712.061,37.3310471,1.18682384,120,0,0,1,0,0,0),
(@CGUID+9,@Envoy,1,1,1,0,0,1937.18225,-4707.44629,35.7722168,4.363323,120,0,0,1,0,0,0);
-- Event handling
DELETE FROM `game_event_creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+9) AND `event`=@Event;
INSERT INTO `game_event_creature` (`guid`,`event`) VALUES
(@CGUID+0,@Event),
(@CGUID+1,@Event),
(@CGUID+2,@Event),
(@CGUID+3,@Event),
(@CGUID+4,@Event),
(@CGUID+5,@Event),
(@CGUID+6,@Event),
(@CGUID+7,@Event),
(@CGUID+8,@Event),
(@CGUID+9,@Event);
-- GOs spawns
DELETE FROM `gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+3) AND `id`=@Banner;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@GGUID+0,@Banner,1,1,1,1663.58679,-4343.1875,61.4731026,0.7504908,0,0,0,0,120,0,1),
(@GGUID+1,@Banner,1,1,1,1657.46179,-4385.405,23.806673,-1.0122894,0,0,0,0,120,0,1),
(@GGUID+2,@Banner,1,1,1,1749.49719,-3963.362,49.77431,-2.879789,0,0,0,0,120,0,1),
(@GGUID+3,@Banner,1,1,1,1933.50867,-4709.62354,36.9713669,1.62315571,0,0,0,0,120,0,1);
-- Event handling
DELETE FROM `game_event_gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+3) AND `event`=@Event;
INSERT INTO `game_event_gameobject` (`guid`,`event`) VALUES
(@GGUID+0,@Event),
(@GGUID+1,@Event),
(@GGUID+2,@Event),
(@GGUID+3,@Event);
-- Pathing
SET @NPC :=@CGUID+6;
SET @PATH :=@NPC*10;
DELETE FROM `creature_formations` WHERE `leaderGUID`=@CGUID+6;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES 
(@CGUID+6,@CGUID+6,0,0,2),
(@CGUID+6,@CGUID+7,3,90,2);
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@NPC,@PATH);
DELETE FROM `waypoint_data` WHERE `id`=@PATH; 
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1954.46,-4722.56,42.6743,0,0,0,100,0),
(@PATH,2,1951.09,-4714.8,36.9093,0,0,0,100,0),
(@PATH,3,1948.98,-4697.22,28.9954,0,0,0,100,0),
(@PATH,4,1945.38,-4681.89,25.2457,0,0,0,100,0),
(@PATH,5,1937.36,-4669.2,26.5256,0,0,0,100,0),
(@PATH,6,1909.86,-4631.36,32.9827,0,0,0,100,0),
(@PATH,7,1907.75,-4627.89,34.119,0,0,0,100,0),
(@PATH,8,1894.59,-4605.89,34.1211,0,0,0,100,0),
(@PATH,9,1925.42,-4584.78,34.1211,0,0,0,100,0),
(@PATH,10,1909.95,-4559.76,34.1195,0,0,0,100,0),
(@PATH,11,1904.4,-4549.83,28.7954,0,0,0,100,0),
(@PATH,12,1893,-4531.73,28.0416,0,0,0,100,0),
(@PATH,13,1893.45,-4526.07,28.581,0,0,0,100,0),
(@PATH,14,1899.83,-4517.27,27.3582,0,0,0,100,0),
(@PATH,15,1906.73,-4505.23,24.9591,0,0,0,100,0),
(@PATH,16,1907.86,-4490.92,22.9967,0,0,0,100,0),
(@PATH,17,1900.89,-4482.65,21.1357,0,0,0,100,0),
(@PATH,18,1893.16,-4474.82,20.6826,0,0,0,100,0),
(@PATH,19,1891.65,-4462.73,19.5832,0,0,0,100,0),
(@PATH,20,1894.99,-4448.4,18.1421,0,0,0,100,0),
(@PATH,21,1896.97,-4437.62,16.2806,0,0,0,100,0),
(@PATH,22,1894.04,-4426.05,13.9888,0,0,0,100,0),
(@PATH,23,1885.5,-4418.79,11.3314,0,0,0,100,0),
(@PATH,24,1876.37,-4416.82,9.24696,0,0,0,100,0),
(@PATH,25,1856.3,-4416.08,6.07582,0,0,0,100,0),
(@PATH,26,1843.81,-4407.75,4.68483,0,0,0,100,0),
(@PATH,27,1840.08,-4400.54,4.1577,0,0,0,100,0),
(@PATH,28,1817.85,-4365.1,-9.09306,0,0,0,100,0),
(@PATH,29,1799.58,-4327.29,-11.1642,0,0,0,100,0),
(@PATH,30,1782.7,-4294.67,5.5883,0,0,0,100,0),
(@PATH,31,1776.15,-4294,6.73376,0,0,0,100,0),
(@PATH,32,1766.7,-4298.89,7.56642,0,0,0,100,0),
(@PATH,33,1761.65,-4304.24,7.2299,0,0,0,100,0),
(@PATH,34,1745.15,-4297.08,13.9415,0,0,0,100,0),
(@PATH,35,1740.24,-4292.31,15.1055,0,0,0,100,0),
(@PATH,36,1735.93,-4277.6,17.9325,0,0,0,100,0),
(@PATH,37,1742.48,-4263.41,23.8393,0,0,0,100,0),
(@PATH,38,1750.93,-4255.88,28.2688,0,0,0,100,0),
(@PATH,39,1769.24,-4248.43,36.0152,0,0,0,100,0),
(@PATH,40,1780.17,-4240.32,39.6535,0,0,0,100,0),
(@PATH,41,1784.91,-4228.93,39.8616,0,0,0,100,0),
(@PATH,42,1777.11,-4221.35,39.6674,0,0,0,100,0),
(@PATH,43,1754.45,-4213.47,42.4923,0,0,0,100,0),
(@PATH,44,1742.98,-4213.58,43.9449,0,0,0,100,0),
(@PATH,45,1729,-4220.93,45.6859,0,0,0,100,0),
(@PATH,46,1707.14,-4231.98,49.2425,0,0,0,100,0),
(@PATH,47,1683.98,-4245.42,51.3726,0,0,0,100,0),
(@PATH,48,1664.47,-4256.19,51.5929,0,0,0,100,0),
(@PATH,49,1651.2,-4264.8,50.2665,0,0,0,100,0),
(@PATH,50,1637.98,-4271.1,48.0471,0,0,0,100,0),
(@PATH,51,1623.92,-4262.35,47.1224,0,0,0,100,0),
(@PATH,52,1603.29,-4237.15,45.2332,0,0,0,100,0),
(@PATH,53,1589.27,-4219.05,44.1306,0,0,0,100,0),
(@PATH,54,1581.14,-4198.7,41.3964,0,0,0,100,0),
(@PATH,55,1579.6,-4173,37.7449,0,0,0,100,0),
(@PATH,56,1585.85,-4153.19,34.6496,0,0,0,100,0),
(@PATH,57,1606.41,-4122.96,29.7899,0,0,0,100,0),
(@PATH,58,1666.8,-4097.01,35.0078,0,0,0,100,0),
(@PATH,59,1706.45,-4087.46,39.3622,0,0,0,100,0),
(@PATH,60,1730.26,-4073.1,43.8529,0,0,0,100,0),
(@PATH,61,1744.58,-4045.25,44.1596,0,0,0,100,0),
(@PATH,62,1746.77,-4022.89,45.6474,0,0,0,100,0),
(@PATH,63,1743.11,-4000.24,46.4807,0,0,0,100,0),
(@PATH,64,1732.31,-3972.21,48.1202,0,0,0,100,0),
(@PATH,65,1743.11,-4000.24,46.4807,0,0,0,100,0),
(@PATH,66,1746.77,-4022.89,45.6474,0,0,0,100,0),
(@PATH,67,1744.58,-4045.25,44.1596,0,0,0,100,0),
(@PATH,68,1730.26,-4073.1,43.8529,0,0,0,100,0),
(@PATH,69,1706.45,-4087.46,39.3622,0,0,0,100,0),
(@PATH,70,1666.8,-4097.01,35.0078,0,0,0,100,0),
(@PATH,71,1606.41,-4122.96,29.7899,0,0,0,100,0),
(@PATH,72,1585.85,-4153.19,34.6496,0,0,0,100,0),
(@PATH,73,1579.6,-4173,37.7449,0,0,0,100,0),
(@PATH,74,1581.14,-4198.7,41.3964,0,0,0,100,0),
(@PATH,75,1589.27,-4219.05,44.1306,0,0,0,100,0),
(@PATH,76,1603.29,-4237.15,45.2332,0,0,0,100,0),
(@PATH,77,1623.92,-4262.35,47.1224,0,0,0,100,0),
(@PATH,78,1637.98,-4271.1,48.0471,0,0,0,100,0),
(@PATH,79,1651.2,-4264.8,50.2665,0,0,0,100,0),
(@PATH,80,1664.47,-4256.19,51.5929,0,0,0,100,0),
(@PATH,81,1683.98,-4245.42,51.3726,0,0,0,100,0),
(@PATH,82,1707.14,-4231.98,49.2425,0,0,0,100,0),
(@PATH,83,1729,-4220.93,45.6859,0,0,0,100,0),
(@PATH,84,1742.98,-4213.58,43.9449,0,0,0,100,0),
(@PATH,85,1754.45,-4213.47,42.4923,0,0,0,100,0),
(@PATH,86,1777.11,-4221.35,39.6674,0,0,0,100,0),
(@PATH,87,1784.91,-4228.93,39.8616,0,0,0,100,0),
(@PATH,88,1780.17,-4240.32,39.6535,0,0,0,100,0),
(@PATH,89,1769.24,-4248.43,36.0152,0,0,0,100,0),
(@PATH,90,1750.93,-4255.88,28.2688,0,0,0,100,0),
(@PATH,91,1742.48,-4263.41,23.8393,0,0,0,100,0),
(@PATH,92,1735.93,-4277.6,17.9325,0,0,0,100,0),
(@PATH,93,1740.24,-4292.31,15.1055,0,0,0,100,0),
(@PATH,94,1745.15,-4297.08,13.9415,0,0,0,100,0),
(@PATH,95,1761.65,-4304.24,7.2299,0,0,0,100,0),
(@PATH,96,1766.7,-4298.89,7.56642,0,0,0,100,0),
(@PATH,97,1776.15,-4294,6.73376,0,0,0,100,0),
(@PATH,98,1782.7,-4294.67,5.5883,0,0,0,100,0),
(@PATH,99,1799.58,-4327.29,-11.1642,0,0,0,100,0),
(@PATH,100,1817.85,-4365.1,-9.09306,0,0,0,100,0),
(@PATH,101,1840.08,-4400.54,4.1577,0,0,0,100,0),
(@PATH,102,1843.81,-4407.75,4.68483,0,0,0,100,0),
(@PATH,103,1856.3,-4416.08,6.07582,0,0,0,100,0),
(@PATH,104,1876.37,-4416.82,9.24696,0,0,0,100,0),
(@PATH,105,1885.5,-4418.79,11.3314,0,0,0,100,0),
(@PATH,106,1894.04,-4426.05,13.9888,0,0,0,100,0),
(@PATH,107,1896.97,-4437.62,16.2806,0,0,0,100,0),
(@PATH,108,1894.99,-4448.4,18.1421,0,0,0,100,0),
(@PATH,109,1891.65,-4462.73,19.5832,0,0,0,100,0),
(@PATH,110,1893.16,-4474.82,20.6826,0,0,0,100,0),
(@PATH,111,1900.89,-4482.65,21.1357,0,0,0,100,0),
(@PATH,112,1907.86,-4490.92,22.9967,0,0,0,100,0),
(@PATH,113,1906.73,-4505.23,24.9591,0,0,0,100,0),
(@PATH,114,1899.83,-4517.27,27.3582,0,0,0,100,0),
(@PATH,115,1893.45,-4526.07,28.581,0,0,0,100,0),
(@PATH,116,1893,-4531.73,28.0416,0,0,0,100,0),
(@PATH,117,1904.4,-4549.83,28.7954,0,0,0,100,0),
(@PATH,118,1909.95,-4559.76,34.1195,0,0,0,100,0),
(@PATH,119,1925.42,-4584.78,34.1211,0,0,0,100,0),
(@PATH,120,1894.59,-4605.89,34.1211,0,0,0,100,0),
(@PATH,121,1907.75,-4627.89,34.119,0,0,0,100,0),
(@PATH,122,1909.86,-4631.36,32.9827,0,0,0,100,0),
(@PATH,123,1937.36,-4669.2,26.5256,0,0,0,100,0),
(@PATH,124,1945.38,-4681.89,25.2457,0,0,0,100,0),
(@PATH,125,1948.98,-4697.22,28.9954,0,0,0,100,0),
(@PATH,126,1951.09,-4714.8,36.9093,0,0,0,100,0),
(@PATH,127,1954.46,-4722.56,42.6743,0,0,0,100,0);

SET @Event:=20; -- Call to Arms: Arathi Basin!
SET @CGUID:=@TCGUID+667; -- Set by TDB Team (need 10) - creature.guid
SET @GGUID:=@TGGUID+292; -- Set by TDB team (need 4) - gameobject.guid
SET @Banner:=180396; -- PVP HOLIDAY HORDE ARATHI
SET @Envoy:=14990; -- Defilers Emissary
-- Creature spawns
DELETE FROM `creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+9) AND `id` IN (@Envoy);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(@CGUID+0,@Envoy,1,1,1,0,0,1658.86292,-4389.012,23.9963837,1.134464,120,0,0,1,0,0,0),
(@CGUID+1,@Envoy,1,1,1,0,0,1660.66492,-4385.632,24.2067738,4.118977,120,0,0,1,0,0,0),
(@CGUID+2,@Envoy,1,1,1,0,0,1665.83679,-4344.93945,61.5564346,5.375614,120,0,0,1,0,0,0),
(@CGUID+3,@Envoy,1,1,1,0,0,1667.63892,-4346.96,61.5564346,2.37364769,120,0,0,1,0,0,0),
(@CGUID+4,@Envoy,1,1,1,0,0,1743.72742,-3966.88379,49.46911,0.418879032,120,0,0,1,0,0,0),
(@CGUID+5,@Envoy,1,1,1,0,0,1747.49658,-3965.361,50.0845871,3.49065852,120,0,0,1,0,0,0),
(@CGUID+6,@Envoy,1,1,1,0,0,1954.35,-4722.71,42.659,1.99567,120,0,0,1,0,0,0), -- WP
(@CGUID+7,@Envoy,1,1,1,0,0,1952.39,-4723.16,42.1039,1.87001,120,0,0,1,0,0,0), -- WP
(@CGUID+8,@Envoy,1,1,1,0,0,1936.9115,-4712.061,37.3310471,1.18682384,120,0,0,1,0,0,0),
(@CGUID+9,@Envoy,1,1,1,0,0,1937.18225,-4707.44629,35.7722168,4.363323,120,0,0,1,0,0,0);
-- Event handling
DELETE FROM `game_event_creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+9) AND `event`=@Event;
INSERT INTO `game_event_creature` (`guid`,`event`) VALUES
(@CGUID+0,@Event),
(@CGUID+1,@Event),
(@CGUID+2,@Event),
(@CGUID+3,@Event),
(@CGUID+4,@Event),
(@CGUID+5,@Event),
(@CGUID+6,@Event),
(@CGUID+7,@Event),
(@CGUID+8,@Event),
(@CGUID+9,@Event);
-- GOs spawns
DELETE FROM `gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+3) AND `id`=@Banner;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@GGUID+0,@Banner,1,1,1,1663.58679,-4343.1875,61.4731026,0.7504908,0,0,0,0,120,0,1),
(@GGUID+1,@Banner,1,1,1,1657.46179,-4385.405,23.806673,-1.0122894,0,0,0,0,120,0,1),
(@GGUID+2,@Banner,1,1,1,1749.49719,-3963.362,49.77431,-2.879789,0,0,0,0,120,0,1),
(@GGUID+3,@Banner,1,1,1,1933.50867,-4709.62354,36.9713669,1.62315571,0,0,0,0,120,0,1);
-- Event handling
DELETE FROM `game_event_gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+3) AND `event`=@Event;
INSERT INTO `game_event_gameobject` (`guid`,`event`) VALUES
(@GGUID+0,@Event),
(@GGUID+1,@Event),
(@GGUID+2,@Event),
(@GGUID+3,@Event);
-- Pathing
SET @NPC :=@CGUID+6;
SET @PATH :=@NPC*10;
DELETE FROM `creature_formations` WHERE `leaderGUID`=@CGUID+6;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES 
(@CGUID+6,@CGUID+6,0,0,2),
(@CGUID+6,@CGUID+7,3,90,2);
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@NPC,@PATH);
DELETE FROM `waypoint_data` WHERE `id`=@PATH; 
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1954.46,-4722.56,42.6743,0,0,0,100,0),
(@PATH,2,1951.09,-4714.8,36.9093,0,0,0,100,0),
(@PATH,3,1948.98,-4697.22,28.9954,0,0,0,100,0),
(@PATH,4,1945.38,-4681.89,25.2457,0,0,0,100,0),
(@PATH,5,1937.36,-4669.2,26.5256,0,0,0,100,0),
(@PATH,6,1909.86,-4631.36,32.9827,0,0,0,100,0),
(@PATH,7,1907.75,-4627.89,34.119,0,0,0,100,0),
(@PATH,8,1894.59,-4605.89,34.1211,0,0,0,100,0),
(@PATH,9,1925.42,-4584.78,34.1211,0,0,0,100,0),
(@PATH,10,1909.95,-4559.76,34.1195,0,0,0,100,0),
(@PATH,11,1904.4,-4549.83,28.7954,0,0,0,100,0),
(@PATH,12,1893,-4531.73,28.0416,0,0,0,100,0),
(@PATH,13,1893.45,-4526.07,28.581,0,0,0,100,0),
(@PATH,14,1899.83,-4517.27,27.3582,0,0,0,100,0),
(@PATH,15,1906.73,-4505.23,24.9591,0,0,0,100,0),
(@PATH,16,1907.86,-4490.92,22.9967,0,0,0,100,0),
(@PATH,17,1900.89,-4482.65,21.1357,0,0,0,100,0),
(@PATH,18,1893.16,-4474.82,20.6826,0,0,0,100,0),
(@PATH,19,1891.65,-4462.73,19.5832,0,0,0,100,0),
(@PATH,20,1894.99,-4448.4,18.1421,0,0,0,100,0),
(@PATH,21,1896.97,-4437.62,16.2806,0,0,0,100,0),
(@PATH,22,1894.04,-4426.05,13.9888,0,0,0,100,0),
(@PATH,23,1885.5,-4418.79,11.3314,0,0,0,100,0),
(@PATH,24,1876.37,-4416.82,9.24696,0,0,0,100,0),
(@PATH,25,1856.3,-4416.08,6.07582,0,0,0,100,0),
(@PATH,26,1843.81,-4407.75,4.68483,0,0,0,100,0),
(@PATH,27,1840.08,-4400.54,4.1577,0,0,0,100,0),
(@PATH,28,1817.85,-4365.1,-9.09306,0,0,0,100,0),
(@PATH,29,1799.58,-4327.29,-11.1642,0,0,0,100,0),
(@PATH,30,1782.7,-4294.67,5.5883,0,0,0,100,0),
(@PATH,31,1776.15,-4294,6.73376,0,0,0,100,0),
(@PATH,32,1766.7,-4298.89,7.56642,0,0,0,100,0),
(@PATH,33,1761.65,-4304.24,7.2299,0,0,0,100,0),
(@PATH,34,1745.15,-4297.08,13.9415,0,0,0,100,0),
(@PATH,35,1740.24,-4292.31,15.1055,0,0,0,100,0),
(@PATH,36,1735.93,-4277.6,17.9325,0,0,0,100,0),
(@PATH,37,1742.48,-4263.41,23.8393,0,0,0,100,0),
(@PATH,38,1750.93,-4255.88,28.2688,0,0,0,100,0),
(@PATH,39,1769.24,-4248.43,36.0152,0,0,0,100,0),
(@PATH,40,1780.17,-4240.32,39.6535,0,0,0,100,0),
(@PATH,41,1784.91,-4228.93,39.8616,0,0,0,100,0),
(@PATH,42,1777.11,-4221.35,39.6674,0,0,0,100,0),
(@PATH,43,1754.45,-4213.47,42.4923,0,0,0,100,0),
(@PATH,44,1742.98,-4213.58,43.9449,0,0,0,100,0),
(@PATH,45,1729,-4220.93,45.6859,0,0,0,100,0),
(@PATH,46,1707.14,-4231.98,49.2425,0,0,0,100,0),
(@PATH,47,1683.98,-4245.42,51.3726,0,0,0,100,0),
(@PATH,48,1664.47,-4256.19,51.5929,0,0,0,100,0),
(@PATH,49,1651.2,-4264.8,50.2665,0,0,0,100,0),
(@PATH,50,1637.98,-4271.1,48.0471,0,0,0,100,0),
(@PATH,51,1623.92,-4262.35,47.1224,0,0,0,100,0),
(@PATH,52,1603.29,-4237.15,45.2332,0,0,0,100,0),
(@PATH,53,1589.27,-4219.05,44.1306,0,0,0,100,0),
(@PATH,54,1581.14,-4198.7,41.3964,0,0,0,100,0),
(@PATH,55,1579.6,-4173,37.7449,0,0,0,100,0),
(@PATH,56,1585.85,-4153.19,34.6496,0,0,0,100,0),
(@PATH,57,1606.41,-4122.96,29.7899,0,0,0,100,0),
(@PATH,58,1666.8,-4097.01,35.0078,0,0,0,100,0),
(@PATH,59,1706.45,-4087.46,39.3622,0,0,0,100,0),
(@PATH,60,1730.26,-4073.1,43.8529,0,0,0,100,0),
(@PATH,61,1744.58,-4045.25,44.1596,0,0,0,100,0),
(@PATH,62,1746.77,-4022.89,45.6474,0,0,0,100,0),
(@PATH,63,1743.11,-4000.24,46.4807,0,0,0,100,0),
(@PATH,64,1732.31,-3972.21,48.1202,0,0,0,100,0),
(@PATH,65,1743.11,-4000.24,46.4807,0,0,0,100,0),
(@PATH,66,1746.77,-4022.89,45.6474,0,0,0,100,0),
(@PATH,67,1744.58,-4045.25,44.1596,0,0,0,100,0),
(@PATH,68,1730.26,-4073.1,43.8529,0,0,0,100,0),
(@PATH,69,1706.45,-4087.46,39.3622,0,0,0,100,0),
(@PATH,70,1666.8,-4097.01,35.0078,0,0,0,100,0),
(@PATH,71,1606.41,-4122.96,29.7899,0,0,0,100,0),
(@PATH,72,1585.85,-4153.19,34.6496,0,0,0,100,0),
(@PATH,73,1579.6,-4173,37.7449,0,0,0,100,0),
(@PATH,74,1581.14,-4198.7,41.3964,0,0,0,100,0),
(@PATH,75,1589.27,-4219.05,44.1306,0,0,0,100,0),
(@PATH,76,1603.29,-4237.15,45.2332,0,0,0,100,0),
(@PATH,77,1623.92,-4262.35,47.1224,0,0,0,100,0),
(@PATH,78,1637.98,-4271.1,48.0471,0,0,0,100,0),
(@PATH,79,1651.2,-4264.8,50.2665,0,0,0,100,0),
(@PATH,80,1664.47,-4256.19,51.5929,0,0,0,100,0),
(@PATH,81,1683.98,-4245.42,51.3726,0,0,0,100,0),
(@PATH,82,1707.14,-4231.98,49.2425,0,0,0,100,0),
(@PATH,83,1729,-4220.93,45.6859,0,0,0,100,0),
(@PATH,84,1742.98,-4213.58,43.9449,0,0,0,100,0),
(@PATH,85,1754.45,-4213.47,42.4923,0,0,0,100,0),
(@PATH,86,1777.11,-4221.35,39.6674,0,0,0,100,0),
(@PATH,87,1784.91,-4228.93,39.8616,0,0,0,100,0),
(@PATH,88,1780.17,-4240.32,39.6535,0,0,0,100,0),
(@PATH,89,1769.24,-4248.43,36.0152,0,0,0,100,0),
(@PATH,90,1750.93,-4255.88,28.2688,0,0,0,100,0),
(@PATH,91,1742.48,-4263.41,23.8393,0,0,0,100,0),
(@PATH,92,1735.93,-4277.6,17.9325,0,0,0,100,0),
(@PATH,93,1740.24,-4292.31,15.1055,0,0,0,100,0),
(@PATH,94,1745.15,-4297.08,13.9415,0,0,0,100,0),
(@PATH,95,1761.65,-4304.24,7.2299,0,0,0,100,0),
(@PATH,96,1766.7,-4298.89,7.56642,0,0,0,100,0),
(@PATH,97,1776.15,-4294,6.73376,0,0,0,100,0),
(@PATH,98,1782.7,-4294.67,5.5883,0,0,0,100,0),
(@PATH,99,1799.58,-4327.29,-11.1642,0,0,0,100,0),
(@PATH,100,1817.85,-4365.1,-9.09306,0,0,0,100,0),
(@PATH,101,1840.08,-4400.54,4.1577,0,0,0,100,0),
(@PATH,102,1843.81,-4407.75,4.68483,0,0,0,100,0),
(@PATH,103,1856.3,-4416.08,6.07582,0,0,0,100,0),
(@PATH,104,1876.37,-4416.82,9.24696,0,0,0,100,0),
(@PATH,105,1885.5,-4418.79,11.3314,0,0,0,100,0),
(@PATH,106,1894.04,-4426.05,13.9888,0,0,0,100,0),
(@PATH,107,1896.97,-4437.62,16.2806,0,0,0,100,0),
(@PATH,108,1894.99,-4448.4,18.1421,0,0,0,100,0),
(@PATH,109,1891.65,-4462.73,19.5832,0,0,0,100,0),
(@PATH,110,1893.16,-4474.82,20.6826,0,0,0,100,0),
(@PATH,111,1900.89,-4482.65,21.1357,0,0,0,100,0),
(@PATH,112,1907.86,-4490.92,22.9967,0,0,0,100,0),
(@PATH,113,1906.73,-4505.23,24.9591,0,0,0,100,0),
(@PATH,114,1899.83,-4517.27,27.3582,0,0,0,100,0),
(@PATH,115,1893.45,-4526.07,28.581,0,0,0,100,0),
(@PATH,116,1893,-4531.73,28.0416,0,0,0,100,0),
(@PATH,117,1904.4,-4549.83,28.7954,0,0,0,100,0),
(@PATH,118,1909.95,-4559.76,34.1195,0,0,0,100,0),
(@PATH,119,1925.42,-4584.78,34.1211,0,0,0,100,0),
(@PATH,120,1894.59,-4605.89,34.1211,0,0,0,100,0),
(@PATH,121,1907.75,-4627.89,34.119,0,0,0,100,0),
(@PATH,122,1909.86,-4631.36,32.9827,0,0,0,100,0),
(@PATH,123,1937.36,-4669.2,26.5256,0,0,0,100,0),
(@PATH,124,1945.38,-4681.89,25.2457,0,0,0,100,0),
(@PATH,125,1948.98,-4697.22,28.9954,0,0,0,100,0),
(@PATH,126,1951.09,-4714.8,36.9093,0,0,0,100,0),
(@PATH,127,1954.46,-4722.56,42.6743,0,0,0,100,0);

SET @Event:=18; -- Call to Arms: Alterac Valley!
SET @CGUID:=@TCGUID+678; -- Set by TDB Team (need 10) - creature.guid
SET @GGUID:=@TGGUID+296; -- Set by TDB team (need 4) - gameobject.guid
SET @Banner:=180395; -- PVP HOLIDAY HORDE AV
SET @Envoy:=15106; -- Frostwolf Emissary
-- Creature spawns
DELETE FROM `creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+9) AND `id` IN (@Envoy);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(@CGUID+0,@Envoy,1,1,1,0,0,1658.86292,-4389.012,23.9963837,1.134464,120,0,0,1,0,0,0),
(@CGUID+1,@Envoy,1,1,1,0,0,1660.66492,-4385.632,24.2067738,4.118977,120,0,0,1,0,0,0),
(@CGUID+2,@Envoy,1,1,1,0,0,1665.83679,-4344.93945,61.5564346,5.375614,120,0,0,1,0,0,0),
(@CGUID+3,@Envoy,1,1,1,0,0,1667.63892,-4346.96,61.5564346,2.37364769,120,0,0,1,0,0,0),
(@CGUID+4,@Envoy,1,1,1,0,0,1743.72742,-3966.88379,49.46911,0.418879032,120,0,0,1,0,0,0),
(@CGUID+5,@Envoy,1,1,1,0,0,1747.49658,-3965.361,50.0845871,3.49065852,120,0,0,1,0,0,0),
(@CGUID+6,@Envoy,1,1,1,0,0,1954.35,-4722.71,42.659,1.99567,120,0,0,1,0,0,0), -- WP
(@CGUID+7,@Envoy,1,1,1,0,0,1952.39,-4723.16,42.1039,1.87001,120,0,0,1,0,0,0), -- WP
(@CGUID+8,@Envoy,1,1,1,0,0,1936.9115,-4712.061,37.3310471,1.18682384,120,0,0,1,0,0,0),
(@CGUID+9,@Envoy,1,1,1,0,0,1937.18225,-4707.44629,35.7722168,4.363323,120,0,0,1,0,0,0);
-- Event handling
DELETE FROM `game_event_creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+9) AND `event`=@Event;
INSERT INTO `game_event_creature` (`guid`,`event`) VALUES
(@CGUID+0,@Event),
(@CGUID+1,@Event),
(@CGUID+2,@Event),
(@CGUID+3,@Event),
(@CGUID+4,@Event),
(@CGUID+5,@Event),
(@CGUID+6,@Event),
(@CGUID+7,@Event),
(@CGUID+8,@Event),
(@CGUID+9,@Event);
-- GOs spawns
DELETE FROM `gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+3) AND `id`=@Banner;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@GGUID+0,@Banner,1,1,1,1663.58679,-4343.1875,61.4731026,0.7504908,0,0,0,0,120,0,1),
(@GGUID+1,@Banner,1,1,1,1657.46179,-4385.405,23.806673,-1.0122894,0,0,0,0,120,0,1),
(@GGUID+2,@Banner,1,1,1,1749.49719,-3963.362,49.77431,-2.879789,0,0,0,0,120,0,1),
(@GGUID+3,@Banner,1,1,1,1933.50867,-4709.62354,36.9713669,1.62315571,0,0,0,0,120,0,1);
-- Event handling
DELETE FROM `game_event_gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+3) AND `event`=@Event;
INSERT INTO `game_event_gameobject` (`guid`,`event`) VALUES
(@GGUID+0,@Event),
(@GGUID+1,@Event),
(@GGUID+2,@Event),
(@GGUID+3,@Event);
-- Pathing
SET @NPC :=@CGUID+6;
SET @PATH :=@NPC*10;
DELETE FROM `creature_formations` WHERE `leaderGUID`=@CGUID+6;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES 
(@CGUID+6,@CGUID+6,0,0,2),
(@CGUID+6,@CGUID+7,3,90,2);
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@NPC,@PATH);
DELETE FROM `waypoint_data` WHERE `id`=@PATH; 
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1954.46,-4722.56,42.6743,0,0,0,100,0),
(@PATH,2,1951.09,-4714.8,36.9093,0,0,0,100,0),
(@PATH,3,1948.98,-4697.22,28.9954,0,0,0,100,0),
(@PATH,4,1945.38,-4681.89,25.2457,0,0,0,100,0),
(@PATH,5,1937.36,-4669.2,26.5256,0,0,0,100,0),
(@PATH,6,1909.86,-4631.36,32.9827,0,0,0,100,0),
(@PATH,7,1907.75,-4627.89,34.119,0,0,0,100,0),
(@PATH,8,1894.59,-4605.89,34.1211,0,0,0,100,0),
(@PATH,9,1925.42,-4584.78,34.1211,0,0,0,100,0),
(@PATH,10,1909.95,-4559.76,34.1195,0,0,0,100,0),
(@PATH,11,1904.4,-4549.83,28.7954,0,0,0,100,0),
(@PATH,12,1893,-4531.73,28.0416,0,0,0,100,0),
(@PATH,13,1893.45,-4526.07,28.581,0,0,0,100,0),
(@PATH,14,1899.83,-4517.27,27.3582,0,0,0,100,0),
(@PATH,15,1906.73,-4505.23,24.9591,0,0,0,100,0),
(@PATH,16,1907.86,-4490.92,22.9967,0,0,0,100,0),
(@PATH,17,1900.89,-4482.65,21.1357,0,0,0,100,0),
(@PATH,18,1893.16,-4474.82,20.6826,0,0,0,100,0),
(@PATH,19,1891.65,-4462.73,19.5832,0,0,0,100,0),
(@PATH,20,1894.99,-4448.4,18.1421,0,0,0,100,0),
(@PATH,21,1896.97,-4437.62,16.2806,0,0,0,100,0),
(@PATH,22,1894.04,-4426.05,13.9888,0,0,0,100,0),
(@PATH,23,1885.5,-4418.79,11.3314,0,0,0,100,0),
(@PATH,24,1876.37,-4416.82,9.24696,0,0,0,100,0),
(@PATH,25,1856.3,-4416.08,6.07582,0,0,0,100,0),
(@PATH,26,1843.81,-4407.75,4.68483,0,0,0,100,0),
(@PATH,27,1840.08,-4400.54,4.1577,0,0,0,100,0),
(@PATH,28,1817.85,-4365.1,-9.09306,0,0,0,100,0),
(@PATH,29,1799.58,-4327.29,-11.1642,0,0,0,100,0),
(@PATH,30,1782.7,-4294.67,5.5883,0,0,0,100,0),
(@PATH,31,1776.15,-4294,6.73376,0,0,0,100,0),
(@PATH,32,1766.7,-4298.89,7.56642,0,0,0,100,0),
(@PATH,33,1761.65,-4304.24,7.2299,0,0,0,100,0),
(@PATH,34,1745.15,-4297.08,13.9415,0,0,0,100,0),
(@PATH,35,1740.24,-4292.31,15.1055,0,0,0,100,0),
(@PATH,36,1735.93,-4277.6,17.9325,0,0,0,100,0),
(@PATH,37,1742.48,-4263.41,23.8393,0,0,0,100,0),
(@PATH,38,1750.93,-4255.88,28.2688,0,0,0,100,0),
(@PATH,39,1769.24,-4248.43,36.0152,0,0,0,100,0),
(@PATH,40,1780.17,-4240.32,39.6535,0,0,0,100,0),
(@PATH,41,1784.91,-4228.93,39.8616,0,0,0,100,0),
(@PATH,42,1777.11,-4221.35,39.6674,0,0,0,100,0),
(@PATH,43,1754.45,-4213.47,42.4923,0,0,0,100,0),
(@PATH,44,1742.98,-4213.58,43.9449,0,0,0,100,0),
(@PATH,45,1729,-4220.93,45.6859,0,0,0,100,0),
(@PATH,46,1707.14,-4231.98,49.2425,0,0,0,100,0),
(@PATH,47,1683.98,-4245.42,51.3726,0,0,0,100,0),
(@PATH,48,1664.47,-4256.19,51.5929,0,0,0,100,0),
(@PATH,49,1651.2,-4264.8,50.2665,0,0,0,100,0),
(@PATH,50,1637.98,-4271.1,48.0471,0,0,0,100,0),
(@PATH,51,1623.92,-4262.35,47.1224,0,0,0,100,0),
(@PATH,52,1603.29,-4237.15,45.2332,0,0,0,100,0),
(@PATH,53,1589.27,-4219.05,44.1306,0,0,0,100,0),
(@PATH,54,1581.14,-4198.7,41.3964,0,0,0,100,0),
(@PATH,55,1579.6,-4173,37.7449,0,0,0,100,0),
(@PATH,56,1585.85,-4153.19,34.6496,0,0,0,100,0),
(@PATH,57,1606.41,-4122.96,29.7899,0,0,0,100,0),
(@PATH,58,1666.8,-4097.01,35.0078,0,0,0,100,0),
(@PATH,59,1706.45,-4087.46,39.3622,0,0,0,100,0),
(@PATH,60,1730.26,-4073.1,43.8529,0,0,0,100,0),
(@PATH,61,1744.58,-4045.25,44.1596,0,0,0,100,0),
(@PATH,62,1746.77,-4022.89,45.6474,0,0,0,100,0),
(@PATH,63,1743.11,-4000.24,46.4807,0,0,0,100,0),
(@PATH,64,1732.31,-3972.21,48.1202,0,0,0,100,0),
(@PATH,65,1743.11,-4000.24,46.4807,0,0,0,100,0),
(@PATH,66,1746.77,-4022.89,45.6474,0,0,0,100,0),
(@PATH,67,1744.58,-4045.25,44.1596,0,0,0,100,0),
(@PATH,68,1730.26,-4073.1,43.8529,0,0,0,100,0),
(@PATH,69,1706.45,-4087.46,39.3622,0,0,0,100,0),
(@PATH,70,1666.8,-4097.01,35.0078,0,0,0,100,0),
(@PATH,71,1606.41,-4122.96,29.7899,0,0,0,100,0),
(@PATH,72,1585.85,-4153.19,34.6496,0,0,0,100,0),
(@PATH,73,1579.6,-4173,37.7449,0,0,0,100,0),
(@PATH,74,1581.14,-4198.7,41.3964,0,0,0,100,0),
(@PATH,75,1589.27,-4219.05,44.1306,0,0,0,100,0),
(@PATH,76,1603.29,-4237.15,45.2332,0,0,0,100,0),
(@PATH,77,1623.92,-4262.35,47.1224,0,0,0,100,0),
(@PATH,78,1637.98,-4271.1,48.0471,0,0,0,100,0),
(@PATH,79,1651.2,-4264.8,50.2665,0,0,0,100,0),
(@PATH,80,1664.47,-4256.19,51.5929,0,0,0,100,0),
(@PATH,81,1683.98,-4245.42,51.3726,0,0,0,100,0),
(@PATH,82,1707.14,-4231.98,49.2425,0,0,0,100,0),
(@PATH,83,1729,-4220.93,45.6859,0,0,0,100,0),
(@PATH,84,1742.98,-4213.58,43.9449,0,0,0,100,0),
(@PATH,85,1754.45,-4213.47,42.4923,0,0,0,100,0),
(@PATH,86,1777.11,-4221.35,39.6674,0,0,0,100,0),
(@PATH,87,1784.91,-4228.93,39.8616,0,0,0,100,0),
(@PATH,88,1780.17,-4240.32,39.6535,0,0,0,100,0),
(@PATH,89,1769.24,-4248.43,36.0152,0,0,0,100,0),
(@PATH,90,1750.93,-4255.88,28.2688,0,0,0,100,0),
(@PATH,91,1742.48,-4263.41,23.8393,0,0,0,100,0),
(@PATH,92,1735.93,-4277.6,17.9325,0,0,0,100,0),
(@PATH,93,1740.24,-4292.31,15.1055,0,0,0,100,0),
(@PATH,94,1745.15,-4297.08,13.9415,0,0,0,100,0),
(@PATH,95,1761.65,-4304.24,7.2299,0,0,0,100,0),
(@PATH,96,1766.7,-4298.89,7.56642,0,0,0,100,0),
(@PATH,97,1776.15,-4294,6.73376,0,0,0,100,0),
(@PATH,98,1782.7,-4294.67,5.5883,0,0,0,100,0),
(@PATH,99,1799.58,-4327.29,-11.1642,0,0,0,100,0),
(@PATH,100,1817.85,-4365.1,-9.09306,0,0,0,100,0),
(@PATH,101,1840.08,-4400.54,4.1577,0,0,0,100,0),
(@PATH,102,1843.81,-4407.75,4.68483,0,0,0,100,0),
(@PATH,103,1856.3,-4416.08,6.07582,0,0,0,100,0),
(@PATH,104,1876.37,-4416.82,9.24696,0,0,0,100,0),
(@PATH,105,1885.5,-4418.79,11.3314,0,0,0,100,0),
(@PATH,106,1894.04,-4426.05,13.9888,0,0,0,100,0),
(@PATH,107,1896.97,-4437.62,16.2806,0,0,0,100,0),
(@PATH,108,1894.99,-4448.4,18.1421,0,0,0,100,0),
(@PATH,109,1891.65,-4462.73,19.5832,0,0,0,100,0),
(@PATH,110,1893.16,-4474.82,20.6826,0,0,0,100,0),
(@PATH,111,1900.89,-4482.65,21.1357,0,0,0,100,0),
(@PATH,112,1907.86,-4490.92,22.9967,0,0,0,100,0),
(@PATH,113,1906.73,-4505.23,24.9591,0,0,0,100,0),
(@PATH,114,1899.83,-4517.27,27.3582,0,0,0,100,0),
(@PATH,115,1893.45,-4526.07,28.581,0,0,0,100,0),
(@PATH,116,1893,-4531.73,28.0416,0,0,0,100,0),
(@PATH,117,1904.4,-4549.83,28.7954,0,0,0,100,0),
(@PATH,118,1909.95,-4559.76,34.1195,0,0,0,100,0),
(@PATH,119,1925.42,-4584.78,34.1211,0,0,0,100,0),
(@PATH,120,1894.59,-4605.89,34.1211,0,0,0,100,0),
(@PATH,121,1907.75,-4627.89,34.119,0,0,0,100,0),
(@PATH,122,1909.86,-4631.36,32.9827,0,0,0,100,0),
(@PATH,123,1937.36,-4669.2,26.5256,0,0,0,100,0),
(@PATH,124,1945.38,-4681.89,25.2457,0,0,0,100,0),
(@PATH,125,1948.98,-4697.22,28.9954,0,0,0,100,0),
(@PATH,126,1951.09,-4714.8,36.9093,0,0,0,100,0),
(@PATH,127,1954.46,-4722.56,42.6743,0,0,0,100,0);

/* SILVERMOON */
SET @Event:=18; -- Call to Arms: Alterac Valley!
SET @CGUID:=@TCGUID+715; -- Set by TDB Team (need 12) - creature.guid
SET @GGUID:=@TGGUID+310; -- Set by TDB team (need 5) - gameobject.guid
SET @Banner:=180395; -- PVP HOLIDAY HORDE AV
SET @Envoy:=15106; -- Frostwolf Emissary
-- Creature spawns
DELETE FROM `creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+11) AND `id` IN (@Envoy);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(@CGUID+0,@Envoy,530,1,1,0,0,9513.941,-7302.81,14.5484838,1.57079637,120,0,0,1,0,0,0),
(@CGUID+1,@Envoy,530,1,1,0,0,9514.062,-7298.58838,14.541461,4.660029,120,0,0,1,0,0,0),
(@CGUID+2,@Envoy,530,1,1,0,0,9513.214,-7281.772,14.01535,3.16164875,120,0,0,1,0,0,0), -- WP
(@CGUID+3,@Envoy,530,1,1,0,0,9511.7168,-7278.0732,14.01535,3.16138148,120,0,0,1,0,0,0), -- WP
(@CGUID+4,@Envoy,530,1,1,0,0,9592.06,-7183.31641,14.3327312,5.6548667,120,0,0,1,0,0,0),
(@CGUID+5,@Envoy,530,1,1,0,0,9594.87,-7184.94,14.335866,2.54818058,120,0,0,1,0,0,0),
(@CGUID+6,@Envoy,530,1,1,0,0,9649.149,-7415.191,13.6920271,5.98647928,120,0,0,1,0,0,0),
(@CGUID+7,@Envoy,530,1,1,0,0,9652.968,-7416.212,13.693347,2.79252672,120,0,0,1,0,0,0),
(@CGUID+8,@Envoy,530,1,1,0,0,9798.27051,-7267.862,26.4264221,1.16937053,120,0,0,1,0,0,0),
(@CGUID+9,@Envoy,530,1,1,0,0,9799.57,-7264.226,26.3963127,4.537856,120,0,0,1,0,0,0),
(@CGUID+10,@Envoy,530,1,1,0,0,9824.462,-7396.88965,13.6924553,0.5061455,120,0,0,1,0,0,0),
(@CGUID+11,@Envoy,530,1,1,0,0,9828.81,-7395.158,13.6879005,3.59537816,120,0,0,1,0,0,0);
-- Event handling
DELETE FROM `game_event_creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+11) AND `event`=@Event;
INSERT INTO `game_event_creature` (`guid`,`event`) VALUES
(@CGUID+0,@Event),
(@CGUID+1,@Event),
(@CGUID+2,@Event),
(@CGUID+3,@Event),
(@CGUID+4,@Event),
(@CGUID+5,@Event),
(@CGUID+6,@Event),
(@CGUID+7,@Event),
(@CGUID+8,@Event),
(@CGUID+9,@Event),
(@CGUID+10,@Event),
(@CGUID+11,@Event);
-- GOs spawns
DELETE FROM `gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+4) AND `id`=@Banner;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@GGUID+0,@Banner,530,1,1,9516.674,-7300.513,14.4416132,-3.10665226,0,0,0,0,120,0,1),
(@GGUID+1,@Banner,530,1,1,9589.491,-7185.61572,14.2429934,0.9773831,0,0,0,0,120,0,1),
(@GGUID+2,@Banner,530,1,1,9652.128,-7413.588,13.6095781,-1.83259487,0,0,0,0,120,0,1),
(@GGUID+3,@Banner,530,1,1,9796.968,-7265.08838,26.3168583,-0.244345576,0,0,0,0,120,0,1),
(@GGUID+4,@Banner,530,1,1,9826.107,-7393.75537,13.6033831,-1.27409065,0,0,0,0,120,0,1);
-- Event Handling
DELETE FROM `game_event_gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+3) AND `event`=@Event;
INSERT INTO `game_event_gameobject` (`guid`,`event`) VALUES
(@GGUID+0,@Event),
(@GGUID+1,@Event),
(@GGUID+2,@Event),
(@GGUID+3,@Event),
(@GGUID+4,@Event);
-- Pathing
SET @NPC :=@CGUID+2;
SET @PATH :=@NPC*10;
DELETE FROM `creature_formations` WHERE `leaderGUID`=@CGUID+2;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES 
(@CGUID+2,@CGUID+2,0,0,2),
(@CGUID+2,@CGUID+3,3,90,2);
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@NPC,@PATH);
DELETE FROM `waypoint_data` WHERE `id`=@PATH; 
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,9513.214,-7281.772,14.01535,0,0,0,100,0),
(@PATH,2,9507.633,-7299.162,14.11536,0,0,0,100,0),
(@PATH,3,9515.567,-7319.607,14.11891,0,0,0,100,0),
(@PATH,4,9542.465,-7320.012,14.10067,0,0,0,100,0),
(@PATH,5,9585.503,-7322.018,14.11103,0,0,0,100,0),
(@PATH,6,9599.195,-7335.315,14.09654,0,0,0,100,0),
(@PATH,7,9599.586,-7363.958,13.43863,0,0,0,100,0),
(@PATH,8,9618.385,-7369.913,14.36679,0,0,0,100,0),
(@PATH,9,9619.293,-7383.71,14.7318,0,0,0,100,0),
(@PATH,10,9590.54,-7383.633,13.45894,0,0,0,100,0),
(@PATH,11,9589.816,-7400.06,13.30313,0,0,0,100,0),
(@PATH,12,9595.088,-7419.608,13.30509,0,0,0,100,0),
(@PATH,13,9611.4,-7432.204,13.30687,0,0,0,100,0),
(@PATH,14,9647.761,-7431.502,13.29397,0,0,0,100,0),
(@PATH,15,9662.456,-7434.238,13.29329,0,0,0,100,0),
(@PATH,16,9688.15,-7441.575,13.29329,0,0,0,100,0),
(@PATH,17,9719.505,-7424.932,13.2933,0,0,0,100,0),
(@PATH,18,9768.133,-7424.334,13.38612,0,0,0,100,0),
(@PATH,19,9768.676,-7441.696,14.3929,0,0,0,100,0),
(@PATH,20,9793.075,-7442.292,14.37667,0,0,0,100,0),
(@PATH,21,9794.432,-7424.119,13.50463,0,0,0,100,0),
(@PATH,22,9821.163,-7424.121,13.30383,0,0,0,100,0),
(@PATH,23,9867.966,-7425.045,13.28291,0,0,0,100,0),
(@PATH,24,9884.413,-7422.779,13.26507,0,0,0,100,0),
(@PATH,25,9890.151,-7413.509,13.26493,0,0,0,100,0),
(@PATH,26,9892.013,-7389.04,13.55907,0,0,0,100,0),
(@PATH,27,9895.587,-7384.541,15.30575,0,0,0,100,0),
(@PATH,28,9895.596,-7365.38,20.71129,0,0,0,100,0),
(@PATH,29,9895.521,-7319.915,23.22036,0,0,0,100,0),
(@PATH,30,9874.085,-7314.135,26.28392,0,0,0,100,0),
(@PATH,31,9855.794,-7311.015,26.29892,0,0,0,100,0),
(@PATH,32,9838.252,-7288.563,26.31572,0,0,0,100,0),
(@PATH,33,9815.983,-7278.051,26.32373,0,0,0,100,0),
(@PATH,34,9785.606,-7298.038,25.8062,0,0,0,100,0),
(@PATH,35,9757.028,-7316.117,24.41102,0,0,0,100,0),
(@PATH,36,9733.631,-7326.162,24.41109,0,0,0,100,0),
(@PATH,37,9704.811,-7331.627,11.82546,0,0,0,100,0),
(@PATH,38,9685.28,-7334.177,12.37835,0,0,0,100,0),
(@PATH,39,9673.971,-7334.175,12.36667,0,0,0,100,0),
(@PATH,40,9671.039,-7311.83,13.92853,0,0,0,100,0),
(@PATH,41,9653.957,-7310.703,14.95515,0,0,0,100,0),
(@PATH,42,9653.583,-7297.513,14.95706,0,0,0,100,0),
(@PATH,43,9672.948,-7296.592,13.93566,0,0,0,100,0),
(@PATH,44,9673.49,-7280.959,14.05055,0,0,0,100,0),
(@PATH,45,9641.167,-7280.803,13.99142,0,0,0,100,0),
(@PATH,46,9600.858,-7280.092,13.98697,0,0,0,100,0),
(@PATH,47,9575.566,-7279.784,13.98546,0,0,0,100,0),
(@PATH,48,9539.295,-7280.512,13.99414,0,0,0,100,0);

SET @Event:=19; -- Call to Arms: Warsong Gulch!
SET @CGUID:=@TCGUID+728; -- Set by TDB Team (need 2) - creature.guid
SET @GGUID:=@TGGUID+315; -- Set by TDB team (need 5) - gameobject.guid
SET @Banner:=180394; -- PVP HOLIDAY HORDE CTF
SET @Envoy:=15105; -- Warsong Emissary
-- Creature spawns
DELETE FROM `creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+11) AND `id` IN (@Envoy);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(@CGUID+0,@Envoy,530,1,1,0,0,9513.941,-7302.81,14.5484838,1.57079637,120,0,0,1,0,0,0),
(@CGUID+1,@Envoy,530,1,1,0,0,9514.062,-7298.58838,14.541461,4.660029,120,0,0,1,0,0,0),
(@CGUID+2,@Envoy,530,1,1,0,0,9513.214,-7281.772,14.01535,3.16164875,120,0,0,1,0,0,0), -- WP
(@CGUID+3,@Envoy,530,1,1,0,0,9511.7168,-7278.0732,14.01535,3.16138148,120,0,0,1,0,0,0), -- WP
(@CGUID+4,@Envoy,530,1,1,0,0,9592.06,-7183.31641,14.3327312,5.6548667,120,0,0,1,0,0,0),
(@CGUID+5,@Envoy,530,1,1,0,0,9594.87,-7184.94,14.335866,2.54818058,120,0,0,1,0,0,0),
(@CGUID+6,@Envoy,530,1,1,0,0,9649.149,-7415.191,13.6920271,5.98647928,120,0,0,1,0,0,0),
(@CGUID+7,@Envoy,530,1,1,0,0,9652.968,-7416.212,13.693347,2.79252672,120,0,0,1,0,0,0),
(@CGUID+8,@Envoy,530,1,1,0,0,9798.27051,-7267.862,26.4264221,1.16937053,120,0,0,1,0,0,0),
(@CGUID+9,@Envoy,530,1,1,0,0,9799.57,-7264.226,26.3963127,4.537856,120,0,0,1,0,0,0),
(@CGUID+10,@Envoy,530,1,1,0,0,9824.462,-7396.88965,13.6924553,0.5061455,120,0,0,1,0,0,0),
(@CGUID+11,@Envoy,530,1,1,0,0,9828.81,-7395.158,13.6879005,3.59537816,120,0,0,1,0,0,0);
-- Event handling
DELETE FROM `game_event_creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+11) AND `event`=@Event;
INSERT INTO `game_event_creature` (`guid`,`event`) VALUES
(@CGUID+0,@Event),
(@CGUID+1,@Event),
(@CGUID+2,@Event),
(@CGUID+3,@Event),
(@CGUID+4,@Event),
(@CGUID+5,@Event),
(@CGUID+6,@Event),
(@CGUID+7,@Event),
(@CGUID+8,@Event),
(@CGUID+9,@Event),
(@CGUID+10,@Event),
(@CGUID+11,@Event);
-- GOs spawns
DELETE FROM `gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+4) AND `id`=@Banner;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@GGUID+0,@Banner,530,1,1,9516.674,-7300.513,14.4416132,-3.10665226,0,0,0,0,120,0,1),
(@GGUID+1,@Banner,530,1,1,9589.491,-7185.61572,14.2429934,0.9773831,0,0,0,0,120,0,1),
(@GGUID+2,@Banner,530,1,1,9652.128,-7413.588,13.6095781,-1.83259487,0,0,0,0,120,0,1),
(@GGUID+3,@Banner,530,1,1,9796.968,-7265.08838,26.3168583,-0.244345576,0,0,0,0,120,0,1),
(@GGUID+4,@Banner,530,1,1,9826.107,-7393.75537,13.6033831,-1.27409065,0,0,0,0,120,0,1);
-- Event Handling
DELETE FROM `game_event_gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+3) AND `event`=@Event;
INSERT INTO `game_event_gameobject` (`guid`,`event`) VALUES
(@GGUID+0,@Event),
(@GGUID+1,@Event),
(@GGUID+2,@Event),
(@GGUID+3,@Event),
(@GGUID+4,@Event);
-- Pathing
SET @NPC :=@CGUID+2;
SET @PATH :=@NPC*10;
DELETE FROM `creature_formations` WHERE `leaderGUID`=@CGUID+2;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES 
(@CGUID+2,@CGUID+2,0,0,2),
(@CGUID+2,@CGUID+3,3,90,2);
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@NPC,@PATH);
DELETE FROM `waypoint_data` WHERE `id`=@PATH; 
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,9513.214,-7281.772,14.01535,0,0,0,100,0),
(@PATH,2,9507.633,-7299.162,14.11536,0,0,0,100,0),
(@PATH,3,9515.567,-7319.607,14.11891,0,0,0,100,0),
(@PATH,4,9542.465,-7320.012,14.10067,0,0,0,100,0),
(@PATH,5,9585.503,-7322.018,14.11103,0,0,0,100,0),
(@PATH,6,9599.195,-7335.315,14.09654,0,0,0,100,0),
(@PATH,7,9599.586,-7363.958,13.43863,0,0,0,100,0),
(@PATH,8,9618.385,-7369.913,14.36679,0,0,0,100,0),
(@PATH,9,9619.293,-7383.71,14.7318,0,0,0,100,0),
(@PATH,10,9590.54,-7383.633,13.45894,0,0,0,100,0),
(@PATH,11,9589.816,-7400.06,13.30313,0,0,0,100,0),
(@PATH,12,9595.088,-7419.608,13.30509,0,0,0,100,0),
(@PATH,13,9611.4,-7432.204,13.30687,0,0,0,100,0),
(@PATH,14,9647.761,-7431.502,13.29397,0,0,0,100,0),
(@PATH,15,9662.456,-7434.238,13.29329,0,0,0,100,0),
(@PATH,16,9688.15,-7441.575,13.29329,0,0,0,100,0),
(@PATH,17,9719.505,-7424.932,13.2933,0,0,0,100,0),
(@PATH,18,9768.133,-7424.334,13.38612,0,0,0,100,0),
(@PATH,19,9768.676,-7441.696,14.3929,0,0,0,100,0),
(@PATH,20,9793.075,-7442.292,14.37667,0,0,0,100,0),
(@PATH,21,9794.432,-7424.119,13.50463,0,0,0,100,0),
(@PATH,22,9821.163,-7424.121,13.30383,0,0,0,100,0),
(@PATH,23,9867.966,-7425.045,13.28291,0,0,0,100,0),
(@PATH,24,9884.413,-7422.779,13.26507,0,0,0,100,0),
(@PATH,25,9890.151,-7413.509,13.26493,0,0,0,100,0),
(@PATH,26,9892.013,-7389.04,13.55907,0,0,0,100,0),
(@PATH,27,9895.587,-7384.541,15.30575,0,0,0,100,0),
(@PATH,28,9895.596,-7365.38,20.71129,0,0,0,100,0),
(@PATH,29,9895.521,-7319.915,23.22036,0,0,0,100,0),
(@PATH,30,9874.085,-7314.135,26.28392,0,0,0,100,0),
(@PATH,31,9855.794,-7311.015,26.29892,0,0,0,100,0),
(@PATH,32,9838.252,-7288.563,26.31572,0,0,0,100,0),
(@PATH,33,9815.983,-7278.051,26.32373,0,0,0,100,0),
(@PATH,34,9785.606,-7298.038,25.8062,0,0,0,100,0),
(@PATH,35,9757.028,-7316.117,24.41102,0,0,0,100,0),
(@PATH,36,9733.631,-7326.162,24.41109,0,0,0,100,0),
(@PATH,37,9704.811,-7331.627,11.82546,0,0,0,100,0),
(@PATH,38,9685.28,-7334.177,12.37835,0,0,0,100,0),
(@PATH,39,9673.971,-7334.175,12.36667,0,0,0,100,0),
(@PATH,40,9671.039,-7311.83,13.92853,0,0,0,100,0),
(@PATH,41,9653.957,-7310.703,14.95515,0,0,0,100,0),
(@PATH,42,9653.583,-7297.513,14.95706,0,0,0,100,0),
(@PATH,43,9672.948,-7296.592,13.93566,0,0,0,100,0),
(@PATH,44,9673.49,-7280.959,14.05055,0,0,0,100,0),
(@PATH,45,9641.167,-7280.803,13.99142,0,0,0,100,0),
(@PATH,46,9600.858,-7280.092,13.98697,0,0,0,100,0),
(@PATH,47,9575.566,-7279.784,13.98546,0,0,0,100,0),
(@PATH,48,9539.295,-7280.512,13.99414,0,0,0,100,0);

SET @Event:=21; -- Call to Arms: Eye of the Storm!
SET @CGUID:=@TCGUID+741; -- Set by TDB Team (need 12) - creature.guid
SET @GGUID:=@TGGUID+320; -- Set by TDB team (need 5) - gameobject.guid
SET @Banner:=185106; -- Blood Elf Banner
SET @Envoy:=22015; -- Eye of the Storm Envoy
-- Creature spawns
DELETE FROM `creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+11) AND `id` IN (@Envoy);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(@CGUID+0,@Envoy,530,1,1,0,0,9513.941,-7302.81,14.5484838,1.57079637,120,0,0,1,0,0,0),
(@CGUID+1,@Envoy,530,1,1,0,0,9514.062,-7298.58838,14.541461,4.660029,120,0,0,1,0,0,0),
(@CGUID+2,@Envoy,530,1,1,0,0,9513.214,-7281.772,14.01535,3.16164875,120,0,0,1,0,0,0), -- WP
(@CGUID+3,@Envoy,530,1,1,0,0,9511.7168,-7278.0732,14.01535,3.16138148,120,0,0,1,0,0,0), -- WP
(@CGUID+4,@Envoy,530,1,1,0,0,9592.06,-7183.31641,14.3327312,5.6548667,120,0,0,1,0,0,0),
(@CGUID+5,@Envoy,530,1,1,0,0,9594.87,-7184.94,14.335866,2.54818058,120,0,0,1,0,0,0),
(@CGUID+6,@Envoy,530,1,1,0,0,9649.149,-7415.191,13.6920271,5.98647928,120,0,0,1,0,0,0),
(@CGUID+7,@Envoy,530,1,1,0,0,9652.968,-7416.212,13.693347,2.79252672,120,0,0,1,0,0,0),
(@CGUID+8,@Envoy,530,1,1,0,0,9798.27051,-7267.862,26.4264221,1.16937053,120,0,0,1,0,0,0),
(@CGUID+9,@Envoy,530,1,1,0,0,9799.57,-7264.226,26.3963127,4.537856,120,0,0,1,0,0,0),
(@CGUID+10,@Envoy,530,1,1,0,0,9824.462,-7396.88965,13.6924553,0.5061455,120,0,0,1,0,0,0),
(@CGUID+11,@Envoy,530,1,1,0,0,9828.81,-7395.158,13.6879005,3.59537816,120,0,0,1,0,0,0);
-- Event handling
DELETE FROM `game_event_creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+11) AND `event`=@Event;
INSERT INTO `game_event_creature` (`guid`,`event`) VALUES
(@CGUID+0,@Event),
(@CGUID+1,@Event),
(@CGUID+2,@Event),
(@CGUID+3,@Event),
(@CGUID+4,@Event),
(@CGUID+5,@Event),
(@CGUID+6,@Event),
(@CGUID+7,@Event),
(@CGUID+8,@Event),
(@CGUID+9,@Event),
(@CGUID+10,@Event),
(@CGUID+11,@Event);
-- GOs spawns
DELETE FROM `gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+4) AND `id`=@Banner;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@GGUID+0,@Banner,530,1,1,9516.674,-7300.513,14.4416132,-3.10665226,0,0,0,0,120,0,1),
(@GGUID+1,@Banner,530,1,1,9589.491,-7185.61572,14.2429934,0.9773831,0,0,0,0,120,0,1),
(@GGUID+2,@Banner,530,1,1,9652.128,-7413.588,13.6095781,-1.83259487,0,0,0,0,120,0,1),
(@GGUID+3,@Banner,530,1,1,9796.968,-7265.08838,26.3168583,-0.244345576,0,0,0,0,120,0,1),
(@GGUID+4,@Banner,530,1,1,9826.107,-7393.75537,13.6033831,-1.27409065,0,0,0,0,120,0,1);
-- Event Handling
DELETE FROM `game_event_gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+3) AND `event`=@Event;
INSERT INTO `game_event_gameobject` (`guid`,`event`) VALUES
(@GGUID+0,@Event),
(@GGUID+1,@Event),
(@GGUID+2,@Event),
(@GGUID+3,@Event),
(@GGUID+4,@Event);
-- Pathing
SET @NPC :=@CGUID+2;
SET @PATH :=@NPC*10;
DELETE FROM `creature_formations` WHERE `leaderGUID`=@CGUID+2;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES 
(@CGUID+2,@CGUID+2,0,0,2),
(@CGUID+2,@CGUID+3,3,90,2);
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@NPC,@PATH);
DELETE FROM `waypoint_data` WHERE `id`=@PATH; 
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,9513.214,-7281.772,14.01535,0,0,0,100,0),
(@PATH,2,9507.633,-7299.162,14.11536,0,0,0,100,0),
(@PATH,3,9515.567,-7319.607,14.11891,0,0,0,100,0),
(@PATH,4,9542.465,-7320.012,14.10067,0,0,0,100,0),
(@PATH,5,9585.503,-7322.018,14.11103,0,0,0,100,0),
(@PATH,6,9599.195,-7335.315,14.09654,0,0,0,100,0),
(@PATH,7,9599.586,-7363.958,13.43863,0,0,0,100,0),
(@PATH,8,9618.385,-7369.913,14.36679,0,0,0,100,0),
(@PATH,9,9619.293,-7383.71,14.7318,0,0,0,100,0),
(@PATH,10,9590.54,-7383.633,13.45894,0,0,0,100,0),
(@PATH,11,9589.816,-7400.06,13.30313,0,0,0,100,0),
(@PATH,12,9595.088,-7419.608,13.30509,0,0,0,100,0),
(@PATH,13,9611.4,-7432.204,13.30687,0,0,0,100,0),
(@PATH,14,9647.761,-7431.502,13.29397,0,0,0,100,0),
(@PATH,15,9662.456,-7434.238,13.29329,0,0,0,100,0),
(@PATH,16,9688.15,-7441.575,13.29329,0,0,0,100,0),
(@PATH,17,9719.505,-7424.932,13.2933,0,0,0,100,0),
(@PATH,18,9768.133,-7424.334,13.38612,0,0,0,100,0),
(@PATH,19,9768.676,-7441.696,14.3929,0,0,0,100,0),
(@PATH,20,9793.075,-7442.292,14.37667,0,0,0,100,0),
(@PATH,21,9794.432,-7424.119,13.50463,0,0,0,100,0),
(@PATH,22,9821.163,-7424.121,13.30383,0,0,0,100,0),
(@PATH,23,9867.966,-7425.045,13.28291,0,0,0,100,0),
(@PATH,24,9884.413,-7422.779,13.26507,0,0,0,100,0),
(@PATH,25,9890.151,-7413.509,13.26493,0,0,0,100,0),
(@PATH,26,9892.013,-7389.04,13.55907,0,0,0,100,0),
(@PATH,27,9895.587,-7384.541,15.30575,0,0,0,100,0),
(@PATH,28,9895.596,-7365.38,20.71129,0,0,0,100,0),
(@PATH,29,9895.521,-7319.915,23.22036,0,0,0,100,0),
(@PATH,30,9874.085,-7314.135,26.28392,0,0,0,100,0),
(@PATH,31,9855.794,-7311.015,26.29892,0,0,0,100,0),
(@PATH,32,9838.252,-7288.563,26.31572,0,0,0,100,0),
(@PATH,33,9815.983,-7278.051,26.32373,0,0,0,100,0),
(@PATH,34,9785.606,-7298.038,25.8062,0,0,0,100,0),
(@PATH,35,9757.028,-7316.117,24.41102,0,0,0,100,0),
(@PATH,36,9733.631,-7326.162,24.41109,0,0,0,100,0),
(@PATH,37,9704.811,-7331.627,11.82546,0,0,0,100,0),
(@PATH,38,9685.28,-7334.177,12.37835,0,0,0,100,0),
(@PATH,39,9673.971,-7334.175,12.36667,0,0,0,100,0),
(@PATH,40,9671.039,-7311.83,13.92853,0,0,0,100,0),
(@PATH,41,9653.957,-7310.703,14.95515,0,0,0,100,0),
(@PATH,42,9653.583,-7297.513,14.95706,0,0,0,100,0),
(@PATH,43,9672.948,-7296.592,13.93566,0,0,0,100,0),
(@PATH,44,9673.49,-7280.959,14.05055,0,0,0,100,0),
(@PATH,45,9641.167,-7280.803,13.99142,0,0,0,100,0),
(@PATH,46,9600.858,-7280.092,13.98697,0,0,0,100,0),
(@PATH,47,9575.566,-7279.784,13.98546,0,0,0,100,0),
(@PATH,48,9539.295,-7280.512,13.99414,0,0,0,100,0);

SET @Event:=20; -- Call to Arms: Arathi Basin!
SET @CGUID:=@TCGUID+755; -- Set by TDB Team (need 13) - creature.guid
SET @GGUID:=@TGGUID+325; -- Set by TDB team (need 5) - gameobject.guid
SET @Banner:=180396; -- PVP HOLIDAY HORDE ARATHI
SET @Envoy:=14990; -- Defilers Emissary
-- Creature spawns
DELETE FROM `creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+11) AND `id` IN (@Envoy);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(@CGUID+0,@Envoy,530,1,1,0,0,9513.941,-7302.81,14.5484838,1.57079637,120,0,0,1,0,0,0),
(@CGUID+1,@Envoy,530,1,1,0,0,9514.062,-7298.58838,14.541461,4.660029,120,0,0,1,0,0,0),
(@CGUID+2,@Envoy,530,1,1,0,0,9513.214,-7281.772,14.01535,3.16164875,120,0,0,1,0,0,0), -- WP
(@CGUID+3,@Envoy,530,1,1,0,0,9511.7168,-7278.0732,14.01535,3.16138148,120,0,0,1,0,0,0), -- WP
(@CGUID+4,@Envoy,530,1,1,0,0,9592.06,-7183.31641,14.3327312,5.6548667,120,0,0,1,0,0,0),
(@CGUID+5,@Envoy,530,1,1,0,0,9594.87,-7184.94,14.335866,2.54818058,120,0,0,1,0,0,0),
(@CGUID+6,@Envoy,530,1,1,0,0,9649.149,-7415.191,13.6920271,5.98647928,120,0,0,1,0,0,0),
(@CGUID+7,@Envoy,530,1,1,0,0,9652.968,-7416.212,13.693347,2.79252672,120,0,0,1,0,0,0),
(@CGUID+8,@Envoy,530,1,1,0,0,9798.27051,-7267.862,26.4264221,1.16937053,120,0,0,1,0,0,0),
(@CGUID+9,@Envoy,530,1,1,0,0,9799.57,-7264.226,26.3963127,4.537856,120,0,0,1,0,0,0),
(@CGUID+10,@Envoy,530,1,1,0,0,9824.462,-7396.88965,13.6924553,0.5061455,120,0,0,1,0,0,0),
(@CGUID+11,@Envoy,530,1,1,0,0,9828.81,-7395.158,13.6879005,3.59537816,120,0,0,1,0,0,0);
-- Event handling
DELETE FROM `game_event_creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+11) AND `event`=@Event;
INSERT INTO `game_event_creature` (`guid`,`event`) VALUES
(@CGUID+0,@Event),
(@CGUID+1,@Event),
(@CGUID+2,@Event),
(@CGUID+3,@Event),
(@CGUID+4,@Event),
(@CGUID+5,@Event),
(@CGUID+6,@Event),
(@CGUID+7,@Event),
(@CGUID+8,@Event),
(@CGUID+9,@Event),
(@CGUID+10,@Event),
(@CGUID+11,@Event);
-- GOs spawns
DELETE FROM `gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+4) AND `id`=@Banner;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@GGUID+0,@Banner,530,1,1,9516.674,-7300.513,14.4416132,-3.10665226,0,0,0,0,120,0,1),
(@GGUID+1,@Banner,530,1,1,9589.491,-7185.61572,14.2429934,0.9773831,0,0,0,0,120,0,1),
(@GGUID+2,@Banner,530,1,1,9652.128,-7413.588,13.6095781,-1.83259487,0,0,0,0,120,0,1),
(@GGUID+3,@Banner,530,1,1,9796.968,-7265.08838,26.3168583,-0.244345576,0,0,0,0,120,0,1),
(@GGUID+4,@Banner,530,1,1,9826.107,-7393.75537,13.6033831,-1.27409065,0,0,0,0,120,0,1);
-- Event Handling
DELETE FROM `game_event_gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+3) AND `event`=@Event;
INSERT INTO `game_event_gameobject` (`guid`,`event`) VALUES
(@GGUID+0,@Event),
(@GGUID+1,@Event),
(@GGUID+2,@Event),
(@GGUID+3,@Event),
(@GGUID+4,@Event);
-- Pathing
SET @NPC :=@CGUID+2;
SET @PATH :=@NPC*10;
DELETE FROM `creature_formations` WHERE `leaderGUID`=@CGUID+2;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES 
(@CGUID+2,@CGUID+2,0,0,2),
(@CGUID+2,@CGUID+3,3,90,2);
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@NPC,@PATH);
DELETE FROM `waypoint_data` WHERE `id`=@PATH; 
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,9513.214,-7281.772,14.01535,0,0,0,100,0),
(@PATH,2,9507.633,-7299.162,14.11536,0,0,0,100,0),
(@PATH,3,9515.567,-7319.607,14.11891,0,0,0,100,0),
(@PATH,4,9542.465,-7320.012,14.10067,0,0,0,100,0),
(@PATH,5,9585.503,-7322.018,14.11103,0,0,0,100,0),
(@PATH,6,9599.195,-7335.315,14.09654,0,0,0,100,0),
(@PATH,7,9599.586,-7363.958,13.43863,0,0,0,100,0),
(@PATH,8,9618.385,-7369.913,14.36679,0,0,0,100,0),
(@PATH,9,9619.293,-7383.71,14.7318,0,0,0,100,0),
(@PATH,10,9590.54,-7383.633,13.45894,0,0,0,100,0),
(@PATH,11,9589.816,-7400.06,13.30313,0,0,0,100,0),
(@PATH,12,9595.088,-7419.608,13.30509,0,0,0,100,0),
(@PATH,13,9611.4,-7432.204,13.30687,0,0,0,100,0),
(@PATH,14,9647.761,-7431.502,13.29397,0,0,0,100,0),
(@PATH,15,9662.456,-7434.238,13.29329,0,0,0,100,0),
(@PATH,16,9688.15,-7441.575,13.29329,0,0,0,100,0),
(@PATH,17,9719.505,-7424.932,13.2933,0,0,0,100,0),
(@PATH,18,9768.133,-7424.334,13.38612,0,0,0,100,0),
(@PATH,19,9768.676,-7441.696,14.3929,0,0,0,100,0),
(@PATH,20,9793.075,-7442.292,14.37667,0,0,0,100,0),
(@PATH,21,9794.432,-7424.119,13.50463,0,0,0,100,0),
(@PATH,22,9821.163,-7424.121,13.30383,0,0,0,100,0),
(@PATH,23,9867.966,-7425.045,13.28291,0,0,0,100,0),
(@PATH,24,9884.413,-7422.779,13.26507,0,0,0,100,0),
(@PATH,25,9890.151,-7413.509,13.26493,0,0,0,100,0),
(@PATH,26,9892.013,-7389.04,13.55907,0,0,0,100,0),
(@PATH,27,9895.587,-7384.541,15.30575,0,0,0,100,0),
(@PATH,28,9895.596,-7365.38,20.71129,0,0,0,100,0),
(@PATH,29,9895.521,-7319.915,23.22036,0,0,0,100,0),
(@PATH,30,9874.085,-7314.135,26.28392,0,0,0,100,0),
(@PATH,31,9855.794,-7311.015,26.29892,0,0,0,100,0),
(@PATH,32,9838.252,-7288.563,26.31572,0,0,0,100,0),
(@PATH,33,9815.983,-7278.051,26.32373,0,0,0,100,0),
(@PATH,34,9785.606,-7298.038,25.8062,0,0,0,100,0),
(@PATH,35,9757.028,-7316.117,24.41102,0,0,0,100,0),
(@PATH,36,9733.631,-7326.162,24.41109,0,0,0,100,0),
(@PATH,37,9704.811,-7331.627,11.82546,0,0,0,100,0),
(@PATH,38,9685.28,-7334.177,12.37835,0,0,0,100,0),
(@PATH,39,9673.971,-7334.175,12.36667,0,0,0,100,0),
(@PATH,40,9671.039,-7311.83,13.92853,0,0,0,100,0),
(@PATH,41,9653.957,-7310.703,14.95515,0,0,0,100,0),
(@PATH,42,9653.583,-7297.513,14.95706,0,0,0,100,0),
(@PATH,43,9672.948,-7296.592,13.93566,0,0,0,100,0),
(@PATH,44,9673.49,-7280.959,14.05055,0,0,0,100,0),
(@PATH,45,9641.167,-7280.803,13.99142,0,0,0,100,0),
(@PATH,46,9600.858,-7280.092,13.98697,0,0,0,100,0),
(@PATH,47,9575.566,-7279.784,13.98546,0,0,0,100,0),
(@PATH,48,9539.295,-7280.512,13.99414,0,0,0,100,0);

/* THUNDER BLUFF */
SET @Event:=18; -- Call to Arms: Alterac Valley!
SET @CGUID:=@TCGUID+793; -- Set by TDB Team (need 12) - creature.guid
SET @GGUID:=@TGGUID+342; -- Set by TDB team (need 6) - gameobject.guid
SET @Banner:=180395; -- PVP HOLIDAY HORDE AV
SET @Envoy:=15106; -- Frostwolf Emissary
-- Creature spawns
DELETE FROM `creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+11) AND `id` IN (@Envoy);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(@CGUID+0,@Envoy,1,1,1,0,0,-1091.69934,-17.9969616,140.474731,1.134464,120,0,0,1,0,0,0),
(@CGUID+1,@Envoy,1,1,1,0,0,-1391.53,-85.9722,158.985,2.35895681,120,0,0,1,0,0,0), -- WP
(@CGUID+2,@Envoy,1,1,1,0,0,-1247.7478,54.7024231,127.217125,1.04719758,120,0,0,1,0,0,0),
(@CGUID+3,@Envoy,1,1,1,0,0,-1277.9386,138.4697,131.9397,5.358161,120,0,0,1,0,0,0),
(@CGUID+4,@Envoy,1,1,1,0,0,-1377.61963,-61.9991341,159.278778,2.93215322,120,0,0,1,0,0,0),
(@CGUID+5,@Envoy,1,1,1,0,0,-1090.22229,-15.3546553,140.657089,4.15388346,120,0,0,1,0,0,0),
(@CGUID+6,@Envoy,1,1,1,0,0,-1394.13,-86.12,158.935,2.19541,120,0,0,1,0,0,0), -- WP
(@CGUID+7,@Envoy,1,1,1,0,0,-1245.34827,58.3835068,127.08857,4.118977,120,0,0,1,0,0,0),
(@CGUID+8,@Envoy,1,1,1,0,0,-1275.748,135.879883,132.09964,2.32128787,120,0,0,1,0,0,0),
(@CGUID+9,@Envoy,1,1,1,0,0,-1381.2959,-61.66878,159.13475,0.0174532924,120,0,0,1,0,0,0),
(@CGUID+10,@Envoy,1,1,1,0,0,-1049.1615,234.1441,134.6394,2.32128787,120,0,0,1,0,0,0),
(@CGUID+11,@Envoy,1,1,1,0,0,-1051.35242,236.734375,134.639557,5.358161,120,0,0,1,0,0,0);
-- Event handling
DELETE FROM `game_event_creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+11) AND `event`=@Event;
INSERT INTO `game_event_creature` (`guid`,`event`) VALUES
(@CGUID+0,@Event),
(@CGUID+1,@Event),
(@CGUID+2,@Event),
(@CGUID+3,@Event),
(@CGUID+4,@Event),
(@CGUID+5,@Event),
(@CGUID+6,@Event),
(@CGUID+7,@Event),
(@CGUID+8,@Event),
(@CGUID+9,@Event),
(@CGUID+10,@Event),
(@CGUID+11,@Event);
-- GOs spawns
DELETE FROM `gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+5) AND `id`=@Banner;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@GGUID+0,@Banner,1,1,1,-1091.861,-20.8769,140.128708,0.2792516,0,0,0,0,120,0,1),
(@GGUID+1,@Banner,1,1,1,-1249.68408,52.445694,127.180206,1.902409,0,0,0,0,120,0,1),
(@GGUID+2,@Banner,1,1,1,-1273.505,134.156662,132.077591,-2.35619,0,0,0,0,120,0,1),
(@GGUID+3,@Banner,1,1,1,-1377.53455,-58.15419,158.908752,-3.01941323,0,0,0,0,120,0,1),
(@GGUID+4,@Banner,1,1,1,-1383.05383,-85.3854141,159.173157,3.03683829,0,0,0,0,120,0,1),
(@GGUID+5,@Banner,1,1,1,-1051.39587,234.5052,134.55661,0.785396755,0,0,0,0,120,0,1);
-- Event Handling
DELETE FROM `game_event_gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+5) AND `event`=@Event;
INSERT INTO `game_event_gameobject` (`guid`,`event`) VALUES
(@GGUID+0,@Event),
(@GGUID+1,@Event),
(@GGUID+2,@Event),
(@GGUID+3,@Event),
(@GGUID+4,@Event),
(@GGUID+5,@Event);
-- Pathing
SET @NPC :=@CGUID+1;
SET @PATH :=@NPC*10;
DELETE FROM `creature_formations` WHERE `leaderGUID`=@CGUID+1;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES 
(@CGUID+1,@CGUID+1,0,0,2),
(@CGUID+1,@CGUID+6,3,90,2);
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@NPC,@PATH);
DELETE FROM `waypoint_data` WHERE `id`=@PATH; 
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-1391.53,-85.9722,158.985,0,0,0,100,0),
(@PATH,2,-1392.84,-70.6216,158.953,0,0,0,100,0),
(@PATH,3,-1397.17,-63.2994,158.48,0,0,0,100,0),
(@PATH,4,-1385.78,-48.623,160.41,0,0,0,100,0),
(@PATH,5,-1355.33,-12.8232,142.476,0,0,0,100,0),
(@PATH,6,-1329.13,16.6672,138.367,0,0,0,100,0),
(@PATH,7,-1322.95,27.8675,138.336,0,0,0,100,0),
(@PATH,8,-1317.07,29.013,137.436,0,0,0,100,0),
(@PATH,9,-1309.84,26.0727,137.436,0,0,0,100,0),
(@PATH,10,-1295.25,33.1151,129.209,0,0,0,100,0),
(@PATH,11,-1292.36,39.2755,129.209,0,0,0,100,0),
(@PATH,12,-1279.27,46.8591,128.935,0,0,0,100,0),
(@PATH,13,-1267.41,56.4666,127.176,0,0,0,100,0),
(@PATH,14,-1264.5,73.6123,127.693,0,0,0,100,0),
(@PATH,15,-1284.97,98.3124,130.204,0,0,0,100,0),
(@PATH,16,-1286.55,107.812,130.943,0,0,0,100,0),
(@PATH,17,-1277.37,119.394,131.171,0,0,0,100,0),
(@PATH,18,-1243.35,133.647,132.448,0,0,0,100,0),
(@PATH,19,-1224.07,134.804,133.206,0,0,0,100,0),
(@PATH,20,-1212.96,128.896,134.073,0,0,0,100,0),
(@PATH,21,-1206.33,117.248,134.406,0,0,0,100,0),
(@PATH,22,-1185.65,119.227,135.216,0,0,0,100,0),
(@PATH,23,-1144.61,116.924,135.302,0,0,0,100,0),
(@PATH,24,-1119.91,119.143,140.139,0,0,0,100,0),
(@PATH,25,-1097.18,112.477,141.61,0,0,0,100,0),
(@PATH,26,-1092.25,101.523,141.349,0,0,0,100,0),
(@PATH,27,-1095.62,77.6066,140.762,0,0,0,100,0),
(@PATH,28,-1080.86,54.2081,139.809,0,0,0,100,0),
(@PATH,29,-1070.34,43.3666,140.655,0,0,0,100,0),
(@PATH,30,-1064.75,33.6603,141.13,0,0,0,100,0),
(@PATH,31,-1062.9,20.0719,140.94,0,0,0,100,0),
(@PATH,32,-1066.26,-6.02389,140.792,0,0,0,100,0),
(@PATH,33,-1074.74,-15.8266,140.093,1000,0,0,100,0),
(@PATH,34,-1066.26,-6.02389,140.792,0,0,0,100,0),
(@PATH,35,-1062.9,20.0719,140.94,0,0,0,100,0),
(@PATH,36,-1064.75,33.6603,141.13,0,0,0,100,0),
(@PATH,37,-1070.34,43.3666,140.655,0,0,0,100,0),
(@PATH,38,-1080.86,54.2081,139.809,0,0,0,100,0),
(@PATH,39,-1095.62,77.6066,140.762,0,0,0,100,0),
(@PATH,40,-1092.25,101.523,141.349,0,0,0,100,0),
(@PATH,41,-1097.18,112.477,141.61,0,0,0,100,0),
(@PATH,42,-1119.91,119.143,140.139,0,0,0,100,0),
(@PATH,43,-1144.61,116.924,135.302,0,0,0,100,0),
(@PATH,44,-1185.65,119.227,135.216,0,0,0,100,0),
(@PATH,45,-1206.33,117.248,134.406,0,0,0,100,0),
(@PATH,46,-1212.96,128.896,134.073,0,0,0,100,0),
(@PATH,47,-1224.07,134.804,133.206,0,0,0,100,0),
(@PATH,48,-1243.35,133.647,132.448,0,0,0,100,0),
(@PATH,49,-1277.37,119.394,131.171,0,0,0,100,0),
(@PATH,50,-1286.55,107.812,130.943,0,0,0,100,0),
(@PATH,51,-1284.97,98.3124,130.204,0,0,0,100,0),
(@PATH,52,-1264.5,73.6123,127.693,0,0,0,100,0),
(@PATH,53,-1267.41,56.4666,127.176,0,0,0,100,0),
(@PATH,54,-1279.27,46.8591,128.935,0,0,0,100,0),
(@PATH,55,-1292.36,39.2755,129.209,0,0,0,100,0),
(@PATH,56,-1295.25,33.1151,129.209,0,0,0,100,0),
(@PATH,57,-1309.84,26.0727,137.436,0,0,0,100,0),
(@PATH,58,-1317.07,29.013,137.436,0,0,0,100,0),
(@PATH,59,-1322.95,27.8675,138.336,0,0,0,100,0),
(@PATH,60,-1329.13,16.6672,138.367,0,0,0,100,0),
(@PATH,61,-1355.33,-12.8232,142.476,0,0,0,100,0),
(@PATH,62,-1385.78,-48.623,160.41,0,0,0,100,0),
(@PATH,63,-1397.17,-63.2994,158.48,0,0,0,100,0),
(@PATH,64,-1392.84,-70.6216,158.953,0,0,0,100,0),
(@PATH,65,-1391.53,-85.9722,158.985,0,0,0,100,0);

SET @Event:=21; -- Call to Arms: Eye of the Storm!
SET @CGUID:=@TCGUID+806; -- Set by TDB Team (need 12) - creature.guid
SET @GGUID:=@TGGUID+348; -- Set by TDB team (need 6) - gameobject.guid
SET @Banner:=185106; -- Blood Elf Banner
SET @Envoy:=22015; -- Eye of the Storm Envoy
-- Creature spawns
DELETE FROM `creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+11) AND `id` IN (@Envoy);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(@CGUID+0,@Envoy,1,1,1,0,0,-1091.69934,-17.9969616,140.474731,1.134464,120,0,0,1,0,0,0),
(@CGUID+1,@Envoy,1,1,1,0,0,-1391.53,-85.9722,158.985,2.35895681,120,0,0,1,0,0,0), -- WP
(@CGUID+2,@Envoy,1,1,1,0,0,-1247.7478,54.7024231,127.217125,1.04719758,120,0,0,1,0,0,0),
(@CGUID+3,@Envoy,1,1,1,0,0,-1277.9386,138.4697,131.9397,5.358161,120,0,0,1,0,0,0),
(@CGUID+4,@Envoy,1,1,1,0,0,-1377.61963,-61.9991341,159.278778,2.93215322,120,0,0,1,0,0,0),
(@CGUID+5,@Envoy,1,1,1,0,0,-1090.22229,-15.3546553,140.657089,4.15388346,120,0,0,1,0,0,0),
(@CGUID+6,@Envoy,1,1,1,0,0,-1394.13,-86.12,158.935,2.19541,120,0,0,1,0,0,0), -- WP
(@CGUID+7,@Envoy,1,1,1,0,0,-1245.34827,58.3835068,127.08857,4.118977,120,0,0,1,0,0,0),
(@CGUID+8,@Envoy,1,1,1,0,0,-1275.748,135.879883,132.09964,2.32128787,120,0,0,1,0,0,0),
(@CGUID+9,@Envoy,1,1,1,0,0,-1381.2959,-61.66878,159.13475,0.0174532924,120,0,0,1,0,0,0),
(@CGUID+10,@Envoy,1,1,1,0,0,-1049.1615,234.1441,134.6394,2.32128787,120,0,0,1,0,0,0),
(@CGUID+11,@Envoy,1,1,1,0,0,-1051.35242,236.734375,134.639557,5.358161,120,0,0,1,0,0,0);
-- Event handling
DELETE FROM `game_event_creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+11) AND `event`=@Event;
INSERT INTO `game_event_creature` (`guid`,`event`) VALUES
(@CGUID+0,@Event),
(@CGUID+1,@Event),
(@CGUID+2,@Event),
(@CGUID+3,@Event),
(@CGUID+4,@Event),
(@CGUID+5,@Event),
(@CGUID+6,@Event),
(@CGUID+7,@Event),
(@CGUID+8,@Event),
(@CGUID+9,@Event),
(@CGUID+10,@Event),
(@CGUID+11,@Event);
-- GOs spawns
DELETE FROM `gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+5) AND `id`=@Banner;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@GGUID+0,@Banner,1,1,1,-1091.861,-20.8769,140.128708,0.2792516,0,0,0,0,120,0,1),
(@GGUID+1,@Banner,1,1,1,-1249.68408,52.445694,127.180206,1.902409,0,0,0,0,120,0,1),
(@GGUID+2,@Banner,1,1,1,-1273.505,134.156662,132.077591,-2.35619,0,0,0,0,120,0,1),
(@GGUID+3,@Banner,1,1,1,-1377.53455,-58.15419,158.908752,-3.01941323,0,0,0,0,120,0,1),
(@GGUID+4,@Banner,1,1,1,-1383.05383,-85.3854141,159.173157,3.03683829,0,0,0,0,120,0,1),
(@GGUID+5,@Banner,1,1,1,-1051.39587,234.5052,134.55661,0.785396755,0,0,0,0,120,0,1);
-- Event Handling
DELETE FROM `game_event_gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+5) AND `event`=@Event;
INSERT INTO `game_event_gameobject` (`guid`,`event`) VALUES
(@GGUID+0,@Event),
(@GGUID+1,@Event),
(@GGUID+2,@Event),
(@GGUID+3,@Event),
(@GGUID+4,@Event),
(@GGUID+5,@Event);
-- Pathing
SET @NPC :=@CGUID+1;
SET @PATH :=@NPC*10;
DELETE FROM `creature_formations` WHERE `leaderGUID`=@CGUID+1;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES 
(@CGUID+1,@CGUID+1,0,0,2),
(@CGUID+1,@CGUID+6,3,90,2);
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@NPC,@PATH);
DELETE FROM `waypoint_data` WHERE `id`=@PATH; 
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-1391.53,-85.9722,158.985,0,0,0,100,0),
(@PATH,2,-1392.84,-70.6216,158.953,0,0,0,100,0),
(@PATH,3,-1397.17,-63.2994,158.48,0,0,0,100,0),
(@PATH,4,-1385.78,-48.623,160.41,0,0,0,100,0),
(@PATH,5,-1355.33,-12.8232,142.476,0,0,0,100,0),
(@PATH,6,-1329.13,16.6672,138.367,0,0,0,100,0),
(@PATH,7,-1322.95,27.8675,138.336,0,0,0,100,0),
(@PATH,8,-1317.07,29.013,137.436,0,0,0,100,0),
(@PATH,9,-1309.84,26.0727,137.436,0,0,0,100,0),
(@PATH,10,-1295.25,33.1151,129.209,0,0,0,100,0),
(@PATH,11,-1292.36,39.2755,129.209,0,0,0,100,0),
(@PATH,12,-1279.27,46.8591,128.935,0,0,0,100,0),
(@PATH,13,-1267.41,56.4666,127.176,0,0,0,100,0),
(@PATH,14,-1264.5,73.6123,127.693,0,0,0,100,0),
(@PATH,15,-1284.97,98.3124,130.204,0,0,0,100,0),
(@PATH,16,-1286.55,107.812,130.943,0,0,0,100,0),
(@PATH,17,-1277.37,119.394,131.171,0,0,0,100,0),
(@PATH,18,-1243.35,133.647,132.448,0,0,0,100,0),
(@PATH,19,-1224.07,134.804,133.206,0,0,0,100,0),
(@PATH,20,-1212.96,128.896,134.073,0,0,0,100,0),
(@PATH,21,-1206.33,117.248,134.406,0,0,0,100,0),
(@PATH,22,-1185.65,119.227,135.216,0,0,0,100,0),
(@PATH,23,-1144.61,116.924,135.302,0,0,0,100,0),
(@PATH,24,-1119.91,119.143,140.139,0,0,0,100,0),
(@PATH,25,-1097.18,112.477,141.61,0,0,0,100,0),
(@PATH,26,-1092.25,101.523,141.349,0,0,0,100,0),
(@PATH,27,-1095.62,77.6066,140.762,0,0,0,100,0),
(@PATH,28,-1080.86,54.2081,139.809,0,0,0,100,0),
(@PATH,29,-1070.34,43.3666,140.655,0,0,0,100,0),
(@PATH,30,-1064.75,33.6603,141.13,0,0,0,100,0),
(@PATH,31,-1062.9,20.0719,140.94,0,0,0,100,0),
(@PATH,32,-1066.26,-6.02389,140.792,0,0,0,100,0),
(@PATH,33,-1074.74,-15.8266,140.093,1000,0,0,100,0),
(@PATH,34,-1066.26,-6.02389,140.792,0,0,0,100,0),
(@PATH,35,-1062.9,20.0719,140.94,0,0,0,100,0),
(@PATH,36,-1064.75,33.6603,141.13,0,0,0,100,0),
(@PATH,37,-1070.34,43.3666,140.655,0,0,0,100,0),
(@PATH,38,-1080.86,54.2081,139.809,0,0,0,100,0),
(@PATH,39,-1095.62,77.6066,140.762,0,0,0,100,0),
(@PATH,40,-1092.25,101.523,141.349,0,0,0,100,0),
(@PATH,41,-1097.18,112.477,141.61,0,0,0,100,0),
(@PATH,42,-1119.91,119.143,140.139,0,0,0,100,0),
(@PATH,43,-1144.61,116.924,135.302,0,0,0,100,0),
(@PATH,44,-1185.65,119.227,135.216,0,0,0,100,0),
(@PATH,45,-1206.33,117.248,134.406,0,0,0,100,0),
(@PATH,46,-1212.96,128.896,134.073,0,0,0,100,0),
(@PATH,47,-1224.07,134.804,133.206,0,0,0,100,0),
(@PATH,48,-1243.35,133.647,132.448,0,0,0,100,0),
(@PATH,49,-1277.37,119.394,131.171,0,0,0,100,0),
(@PATH,50,-1286.55,107.812,130.943,0,0,0,100,0),
(@PATH,51,-1284.97,98.3124,130.204,0,0,0,100,0),
(@PATH,52,-1264.5,73.6123,127.693,0,0,0,100,0),
(@PATH,53,-1267.41,56.4666,127.176,0,0,0,100,0),
(@PATH,54,-1279.27,46.8591,128.935,0,0,0,100,0),
(@PATH,55,-1292.36,39.2755,129.209,0,0,0,100,0),
(@PATH,56,-1295.25,33.1151,129.209,0,0,0,100,0),
(@PATH,57,-1309.84,26.0727,137.436,0,0,0,100,0),
(@PATH,58,-1317.07,29.013,137.436,0,0,0,100,0),
(@PATH,59,-1322.95,27.8675,138.336,0,0,0,100,0),
(@PATH,60,-1329.13,16.6672,138.367,0,0,0,100,0),
(@PATH,61,-1355.33,-12.8232,142.476,0,0,0,100,0),
(@PATH,62,-1385.78,-48.623,160.41,0,0,0,100,0),
(@PATH,63,-1397.17,-63.2994,158.48,0,0,0,100,0),
(@PATH,64,-1392.84,-70.6216,158.953,0,0,0,100,0),
(@PATH,65,-1391.53,-85.9722,158.985,0,0,0,100,0);

SET @Event:=19; -- Call to Arms: Warsong Gulch!
SET @CGUID:=@TCGUID+819; -- Set by TDB Team (need 12) - creature.guid
SET @GGUID:=@TGGUID+354; -- Set by TDB team (need 6) - gameobject.guid
SET @Banner:=180394; -- PVP HOLIDAY HORDE CTF
SET @Envoy:=15105; -- Warsong Emissary
-- Creature spawns
DELETE FROM `creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+11) AND `id` IN (@Envoy);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(@CGUID+0,@Envoy,1,1,1,0,0,-1091.69934,-17.9969616,140.474731,1.134464,120,0,0,1,0,0,0),
(@CGUID+1,@Envoy,1,1,1,0,0,-1391.53,-85.9722,158.985,2.35895681,120,0,0,1,0,0,0), -- WP
(@CGUID+2,@Envoy,1,1,1,0,0,-1247.7478,54.7024231,127.217125,1.04719758,120,0,0,1,0,0,0),
(@CGUID+3,@Envoy,1,1,1,0,0,-1277.9386,138.4697,131.9397,5.358161,120,0,0,1,0,0,0),
(@CGUID+4,@Envoy,1,1,1,0,0,-1377.61963,-61.9991341,159.278778,2.93215322,120,0,0,1,0,0,0),
(@CGUID+5,@Envoy,1,1,1,0,0,-1090.22229,-15.3546553,140.657089,4.15388346,120,0,0,1,0,0,0),
(@CGUID+6,@Envoy,1,1,1,0,0,-1394.13,-86.12,158.935,2.19541,120,0,0,1,0,0,0), -- WP
(@CGUID+7,@Envoy,1,1,1,0,0,-1245.34827,58.3835068,127.08857,4.118977,120,0,0,1,0,0,0),
(@CGUID+8,@Envoy,1,1,1,0,0,-1275.748,135.879883,132.09964,2.32128787,120,0,0,1,0,0,0),
(@CGUID+9,@Envoy,1,1,1,0,0,-1381.2959,-61.66878,159.13475,0.0174532924,120,0,0,1,0,0,0),
(@CGUID+10,@Envoy,1,1,1,0,0,-1049.1615,234.1441,134.6394,2.32128787,120,0,0,1,0,0,0),
(@CGUID+11,@Envoy,1,1,1,0,0,-1051.35242,236.734375,134.639557,5.358161,120,0,0,1,0,0,0);
-- Event handling
DELETE FROM `game_event_creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+11) AND `event`=@Event;
INSERT INTO `game_event_creature` (`guid`,`event`) VALUES
(@CGUID+0,@Event),
(@CGUID+1,@Event),
(@CGUID+2,@Event),
(@CGUID+3,@Event),
(@CGUID+4,@Event),
(@CGUID+5,@Event),
(@CGUID+6,@Event),
(@CGUID+7,@Event),
(@CGUID+8,@Event),
(@CGUID+9,@Event),
(@CGUID+10,@Event),
(@CGUID+11,@Event);
-- GOs spawns
DELETE FROM `gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+5) AND `id`=@Banner;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@GGUID+0,@Banner,1,1,1,-1091.861,-20.8769,140.128708,0.2792516,0,0,0,0,120,0,1),
(@GGUID+1,@Banner,1,1,1,-1249.68408,52.445694,127.180206,1.902409,0,0,0,0,120,0,1),
(@GGUID+2,@Banner,1,1,1,-1273.505,134.156662,132.077591,-2.35619,0,0,0,0,120,0,1),
(@GGUID+3,@Banner,1,1,1,-1377.53455,-58.15419,158.908752,-3.01941323,0,0,0,0,120,0,1),
(@GGUID+4,@Banner,1,1,1,-1383.05383,-85.3854141,159.173157,3.03683829,0,0,0,0,120,0,1),
(@GGUID+5,@Banner,1,1,1,-1051.39587,234.5052,134.55661,0.785396755,0,0,0,0,120,0,1);
-- Event Handling
DELETE FROM `game_event_gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+5) AND `event`=@Event;
INSERT INTO `game_event_gameobject` (`guid`,`event`) VALUES
(@GGUID+0,@Event),
(@GGUID+1,@Event),
(@GGUID+2,@Event),
(@GGUID+3,@Event),
(@GGUID+4,@Event),
(@GGUID+5,@Event);
-- Pathing
SET @NPC :=@CGUID+1;
SET @PATH :=@NPC*10;
DELETE FROM `creature_formations` WHERE `leaderGUID`=@CGUID+1;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES 
(@CGUID+1,@CGUID+1,0,0,2),
(@CGUID+1,@CGUID+6,3,90,2);
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@NPC,@PATH);
DELETE FROM `waypoint_data` WHERE `id`=@PATH; 
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-1391.53,-85.9722,158.985,0,0,0,100,0),
(@PATH,2,-1392.84,-70.6216,158.953,0,0,0,100,0),
(@PATH,3,-1397.17,-63.2994,158.48,0,0,0,100,0),
(@PATH,4,-1385.78,-48.623,160.41,0,0,0,100,0),
(@PATH,5,-1355.33,-12.8232,142.476,0,0,0,100,0),
(@PATH,6,-1329.13,16.6672,138.367,0,0,0,100,0),
(@PATH,7,-1322.95,27.8675,138.336,0,0,0,100,0),
(@PATH,8,-1317.07,29.013,137.436,0,0,0,100,0),
(@PATH,9,-1309.84,26.0727,137.436,0,0,0,100,0),
(@PATH,10,-1295.25,33.1151,129.209,0,0,0,100,0),
(@PATH,11,-1292.36,39.2755,129.209,0,0,0,100,0),
(@PATH,12,-1279.27,46.8591,128.935,0,0,0,100,0),
(@PATH,13,-1267.41,56.4666,127.176,0,0,0,100,0),
(@PATH,14,-1264.5,73.6123,127.693,0,0,0,100,0),
(@PATH,15,-1284.97,98.3124,130.204,0,0,0,100,0),
(@PATH,16,-1286.55,107.812,130.943,0,0,0,100,0),
(@PATH,17,-1277.37,119.394,131.171,0,0,0,100,0),
(@PATH,18,-1243.35,133.647,132.448,0,0,0,100,0),
(@PATH,19,-1224.07,134.804,133.206,0,0,0,100,0),
(@PATH,20,-1212.96,128.896,134.073,0,0,0,100,0),
(@PATH,21,-1206.33,117.248,134.406,0,0,0,100,0),
(@PATH,22,-1185.65,119.227,135.216,0,0,0,100,0),
(@PATH,23,-1144.61,116.924,135.302,0,0,0,100,0),
(@PATH,24,-1119.91,119.143,140.139,0,0,0,100,0),
(@PATH,25,-1097.18,112.477,141.61,0,0,0,100,0),
(@PATH,26,-1092.25,101.523,141.349,0,0,0,100,0),
(@PATH,27,-1095.62,77.6066,140.762,0,0,0,100,0),
(@PATH,28,-1080.86,54.2081,139.809,0,0,0,100,0),
(@PATH,29,-1070.34,43.3666,140.655,0,0,0,100,0),
(@PATH,30,-1064.75,33.6603,141.13,0,0,0,100,0),
(@PATH,31,-1062.9,20.0719,140.94,0,0,0,100,0),
(@PATH,32,-1066.26,-6.02389,140.792,0,0,0,100,0),
(@PATH,33,-1074.74,-15.8266,140.093,1000,0,0,100,0),
(@PATH,34,-1066.26,-6.02389,140.792,0,0,0,100,0),
(@PATH,35,-1062.9,20.0719,140.94,0,0,0,100,0),
(@PATH,36,-1064.75,33.6603,141.13,0,0,0,100,0),
(@PATH,37,-1070.34,43.3666,140.655,0,0,0,100,0),
(@PATH,38,-1080.86,54.2081,139.809,0,0,0,100,0),
(@PATH,39,-1095.62,77.6066,140.762,0,0,0,100,0),
(@PATH,40,-1092.25,101.523,141.349,0,0,0,100,0),
(@PATH,41,-1097.18,112.477,141.61,0,0,0,100,0),
(@PATH,42,-1119.91,119.143,140.139,0,0,0,100,0),
(@PATH,43,-1144.61,116.924,135.302,0,0,0,100,0),
(@PATH,44,-1185.65,119.227,135.216,0,0,0,100,0),
(@PATH,45,-1206.33,117.248,134.406,0,0,0,100,0),
(@PATH,46,-1212.96,128.896,134.073,0,0,0,100,0),
(@PATH,47,-1224.07,134.804,133.206,0,0,0,100,0),
(@PATH,48,-1243.35,133.647,132.448,0,0,0,100,0),
(@PATH,49,-1277.37,119.394,131.171,0,0,0,100,0),
(@PATH,50,-1286.55,107.812,130.943,0,0,0,100,0),
(@PATH,51,-1284.97,98.3124,130.204,0,0,0,100,0),
(@PATH,52,-1264.5,73.6123,127.693,0,0,0,100,0),
(@PATH,53,-1267.41,56.4666,127.176,0,0,0,100,0),
(@PATH,54,-1279.27,46.8591,128.935,0,0,0,100,0),
(@PATH,55,-1292.36,39.2755,129.209,0,0,0,100,0),
(@PATH,56,-1295.25,33.1151,129.209,0,0,0,100,0),
(@PATH,57,-1309.84,26.0727,137.436,0,0,0,100,0),
(@PATH,58,-1317.07,29.013,137.436,0,0,0,100,0),
(@PATH,59,-1322.95,27.8675,138.336,0,0,0,100,0),
(@PATH,60,-1329.13,16.6672,138.367,0,0,0,100,0),
(@PATH,61,-1355.33,-12.8232,142.476,0,0,0,100,0),
(@PATH,62,-1385.78,-48.623,160.41,0,0,0,100,0),
(@PATH,63,-1397.17,-63.2994,158.48,0,0,0,100,0),
(@PATH,64,-1392.84,-70.6216,158.953,0,0,0,100,0),
(@PATH,65,-1391.53,-85.9722,158.985,0,0,0,100,0);

SET @Event:=20; -- Call to Arms: Arathi Basin!
SET @CGUID:=@TCGUID+832; -- Set by TDB Team (need 12) - creature.guid
SET @GGUID:=@TGGUID+360; -- Set by TDB team (need 6) - gameobject.guid
SET @Banner:=180396; -- PVP HOLIDAY HORDE ARATHI
SET @Envoy:=14990; -- Defilers Emissary
-- Creature spawns
DELETE FROM `creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+11) AND `id` IN (@Envoy);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(@CGUID+0,@Envoy,1,1,1,0,0,-1091.69934,-17.9969616,140.474731,1.134464,120,0,0,1,0,0,0),
(@CGUID+1,@Envoy,1,1,1,0,0,-1391.53,-85.9722,158.985,2.35895681,120,0,0,1,0,0,0), -- WP
(@CGUID+2,@Envoy,1,1,1,0,0,-1247.7478,54.7024231,127.217125,1.04719758,120,0,0,1,0,0,0),
(@CGUID+3,@Envoy,1,1,1,0,0,-1277.9386,138.4697,131.9397,5.358161,120,0,0,1,0,0,0),
(@CGUID+4,@Envoy,1,1,1,0,0,-1377.61963,-61.9991341,159.278778,2.93215322,120,0,0,1,0,0,0),
(@CGUID+5,@Envoy,1,1,1,0,0,-1090.22229,-15.3546553,140.657089,4.15388346,120,0,0,1,0,0,0),
(@CGUID+6,@Envoy,1,1,1,0,0,-1394.13,-86.12,158.935,2.19541,120,0,0,1,0,0,0), -- WP
(@CGUID+7,@Envoy,1,1,1,0,0,-1245.34827,58.3835068,127.08857,4.118977,120,0,0,1,0,0,0),
(@CGUID+8,@Envoy,1,1,1,0,0,-1275.748,135.879883,132.09964,2.32128787,120,0,0,1,0,0,0),
(@CGUID+9,@Envoy,1,1,1,0,0,-1381.2959,-61.66878,159.13475,0.0174532924,120,0,0,1,0,0,0),
(@CGUID+10,@Envoy,1,1,1,0,0,-1049.1615,234.1441,134.6394,2.32128787,120,0,0,1,0,0,0),
(@CGUID+11,@Envoy,1,1,1,0,0,-1051.35242,236.734375,134.639557,5.358161,120,0,0,1,0,0,0);
-- Event handling
DELETE FROM `game_event_creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+11) AND `event`=@Event;
INSERT INTO `game_event_creature` (`guid`,`event`) VALUES
(@CGUID+0,@Event),
(@CGUID+1,@Event),
(@CGUID+2,@Event),
(@CGUID+3,@Event),
(@CGUID+4,@Event),
(@CGUID+5,@Event),
(@CGUID+6,@Event),
(@CGUID+7,@Event),
(@CGUID+8,@Event),
(@CGUID+9,@Event),
(@CGUID+10,@Event),
(@CGUID+11,@Event);
-- GOs spawns
DELETE FROM `gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+5) AND `id`=@Banner;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@GGUID+0,@Banner,1,1,1,-1091.861,-20.8769,140.128708,0.2792516,0,0,0,0,120,0,1),
(@GGUID+1,@Banner,1,1,1,-1249.68408,52.445694,127.180206,1.902409,0,0,0,0,120,0,1),
(@GGUID+2,@Banner,1,1,1,-1273.505,134.156662,132.077591,-2.35619,0,0,0,0,120,0,1),
(@GGUID+3,@Banner,1,1,1,-1377.53455,-58.15419,158.908752,-3.01941323,0,0,0,0,120,0,1),
(@GGUID+4,@Banner,1,1,1,-1383.05383,-85.3854141,159.173157,3.03683829,0,0,0,0,120,0,1),
(@GGUID+5,@Banner,1,1,1,-1051.39587,234.5052,134.55661,0.785396755,0,0,0,0,120,0,1);
-- Event Handling
DELETE FROM `game_event_gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+5) AND `event`=@Event;
INSERT INTO `game_event_gameobject` (`guid`,`event`) VALUES
(@GGUID+0,@Event),
(@GGUID+1,@Event),
(@GGUID+2,@Event),
(@GGUID+3,@Event),
(@GGUID+4,@Event),
(@GGUID+5,@Event);
-- Pathing
SET @NPC :=@CGUID+1;
SET @PATH :=@NPC*10;
DELETE FROM `creature_formations` WHERE `leaderGUID`=@CGUID+1;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES 
(@CGUID+1,@CGUID+1,0,0,2),
(@CGUID+1,@CGUID+6,3,90,2);
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@NPC,@PATH);
DELETE FROM `waypoint_data` WHERE `id`=@PATH; 
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-1391.53,-85.9722,158.985,0,0,0,100,0),
(@PATH,2,-1392.84,-70.6216,158.953,0,0,0,100,0),
(@PATH,3,-1397.17,-63.2994,158.48,0,0,0,100,0),
(@PATH,4,-1385.78,-48.623,160.41,0,0,0,100,0),
(@PATH,5,-1355.33,-12.8232,142.476,0,0,0,100,0),
(@PATH,6,-1329.13,16.6672,138.367,0,0,0,100,0),
(@PATH,7,-1322.95,27.8675,138.336,0,0,0,100,0),
(@PATH,8,-1317.07,29.013,137.436,0,0,0,100,0),
(@PATH,9,-1309.84,26.0727,137.436,0,0,0,100,0),
(@PATH,10,-1295.25,33.1151,129.209,0,0,0,100,0),
(@PATH,11,-1292.36,39.2755,129.209,0,0,0,100,0),
(@PATH,12,-1279.27,46.8591,128.935,0,0,0,100,0),
(@PATH,13,-1267.41,56.4666,127.176,0,0,0,100,0),
(@PATH,14,-1264.5,73.6123,127.693,0,0,0,100,0),
(@PATH,15,-1284.97,98.3124,130.204,0,0,0,100,0),
(@PATH,16,-1286.55,107.812,130.943,0,0,0,100,0),
(@PATH,17,-1277.37,119.394,131.171,0,0,0,100,0),
(@PATH,18,-1243.35,133.647,132.448,0,0,0,100,0),
(@PATH,19,-1224.07,134.804,133.206,0,0,0,100,0),
(@PATH,20,-1212.96,128.896,134.073,0,0,0,100,0),
(@PATH,21,-1206.33,117.248,134.406,0,0,0,100,0),
(@PATH,22,-1185.65,119.227,135.216,0,0,0,100,0),
(@PATH,23,-1144.61,116.924,135.302,0,0,0,100,0),
(@PATH,24,-1119.91,119.143,140.139,0,0,0,100,0),
(@PATH,25,-1097.18,112.477,141.61,0,0,0,100,0),
(@PATH,26,-1092.25,101.523,141.349,0,0,0,100,0),
(@PATH,27,-1095.62,77.6066,140.762,0,0,0,100,0),
(@PATH,28,-1080.86,54.2081,139.809,0,0,0,100,0),
(@PATH,29,-1070.34,43.3666,140.655,0,0,0,100,0),
(@PATH,30,-1064.75,33.6603,141.13,0,0,0,100,0),
(@PATH,31,-1062.9,20.0719,140.94,0,0,0,100,0),
(@PATH,32,-1066.26,-6.02389,140.792,0,0,0,100,0),
(@PATH,33,-1074.74,-15.8266,140.093,1000,0,0,100,0),
(@PATH,34,-1066.26,-6.02389,140.792,0,0,0,100,0),
(@PATH,35,-1062.9,20.0719,140.94,0,0,0,100,0),
(@PATH,36,-1064.75,33.6603,141.13,0,0,0,100,0),
(@PATH,37,-1070.34,43.3666,140.655,0,0,0,100,0),
(@PATH,38,-1080.86,54.2081,139.809,0,0,0,100,0),
(@PATH,39,-1095.62,77.6066,140.762,0,0,0,100,0),
(@PATH,40,-1092.25,101.523,141.349,0,0,0,100,0),
(@PATH,41,-1097.18,112.477,141.61,0,0,0,100,0),
(@PATH,42,-1119.91,119.143,140.139,0,0,0,100,0),
(@PATH,43,-1144.61,116.924,135.302,0,0,0,100,0),
(@PATH,44,-1185.65,119.227,135.216,0,0,0,100,0),
(@PATH,45,-1206.33,117.248,134.406,0,0,0,100,0),
(@PATH,46,-1212.96,128.896,134.073,0,0,0,100,0),
(@PATH,47,-1224.07,134.804,133.206,0,0,0,100,0),
(@PATH,48,-1243.35,133.647,132.448,0,0,0,100,0),
(@PATH,49,-1277.37,119.394,131.171,0,0,0,100,0),
(@PATH,50,-1286.55,107.812,130.943,0,0,0,100,0),
(@PATH,51,-1284.97,98.3124,130.204,0,0,0,100,0),
(@PATH,52,-1264.5,73.6123,127.693,0,0,0,100,0),
(@PATH,53,-1267.41,56.4666,127.176,0,0,0,100,0),
(@PATH,54,-1279.27,46.8591,128.935,0,0,0,100,0),
(@PATH,55,-1292.36,39.2755,129.209,0,0,0,100,0),
(@PATH,56,-1295.25,33.1151,129.209,0,0,0,100,0),
(@PATH,57,-1309.84,26.0727,137.436,0,0,0,100,0),
(@PATH,58,-1317.07,29.013,137.436,0,0,0,100,0),
(@PATH,59,-1322.95,27.8675,138.336,0,0,0,100,0),
(@PATH,60,-1329.13,16.6672,138.367,0,0,0,100,0),
(@PATH,61,-1355.33,-12.8232,142.476,0,0,0,100,0),
(@PATH,62,-1385.78,-48.623,160.41,0,0,0,100,0),
(@PATH,63,-1397.17,-63.2994,158.48,0,0,0,100,0),
(@PATH,64,-1392.84,-70.6216,158.953,0,0,0,100,0),
(@PATH,65,-1391.53,-85.9722,158.985,0,0,0,100,0);

/* UNDERCITY */
SET @Event:=19; -- Call to Arms: Warsong Gulch!
SET @CGUID:=@TCGUID+856; -- Set by TDB Team (need 10) - creature.guid
SET @GGUID:=@TGGUID+371; -- Set by TDB team (need 5) - gameobject.guid
SET @Banner:=180394; -- PVP HOLIDAY HORDE CTF
SET @Envoy:=15105; -- Warsong Emissary
-- Creature spawns
DELETE FROM `creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+9) AND `id` IN (@Envoy);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(@CGUID+0,@Envoy,0,1,1,0,0,1265.31421,353.74826,-63.63676,4.15388346,120,0,0,1,0,0,0),
(@CGUID+1,@Envoy,0,1,1,0,0,1522.566,242.054855,-41.30655,4.25860357,120,0,0,1,0,0,0),
(@CGUID+2,@Envoy,0,1,1,0,0,1593.7085,316.030426,-41.34109,6.213372,120,0,0,1,0,0,0),
(@CGUID+3,@Envoy,0,1,1,0,0,1597.45679,164.685333,-41.341095,2.65290046,120,0,0,1,0,0,0),
(@CGUID+4,@Envoy,0,1,1,0,0,1632.72327,182.795151,-62.1830444,0.313486964,120,0,0,1,0,0,0), -- WP
(@CGUID+5,@Envoy,0,1,1,0,0,1263.18408,350.777771,-63.64588,0.9773844,120,0,0,1,0,0,0),
(@CGUID+6,@Envoy,0,1,1,0,0,1521.08557,238.709366,-41.30655,1.18682384,120,0,0,1,0,0,0),
(@CGUID+7,@Envoy,0,1,1,0,0,1593.21692,166.867783,-41.341095,5.81194639,120,0,0,1,0,0,0),
(@CGUID+8,@Envoy,0,1,1,0,0,1596.566,315.891174,-41.341095,3.12413931,120,0,0,1,0,0,0),
(@CGUID+9,@Envoy,0,1,1,0,0,1633.34631,180.894547,-62.1827049,0.3135093,120,0,0,1,0,0,0); -- WP
-- Event handling
DELETE FROM `game_event_creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+9) AND `event`=@Event;
INSERT INTO `game_event_creature` (`guid`,`event`) VALUES
(@CGUID+0,@Event),
(@CGUID+1,@Event),
(@CGUID+2,@Event),
(@CGUID+3,@Event),
(@CGUID+4,@Event),
(@CGUID+5,@Event),
(@CGUID+6,@Event),
(@CGUID+7,@Event),
(@CGUID+8,@Event),
(@CGUID+9,@Event);
-- GOs spawns
DELETE FROM `gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+4) AND `id`=@Banner;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@GGUID+0,@Banner,0,1,1,1262.533,353.829865,-63.6908836,-0.8028509,0,0,0,0,120,0,1),
(@GGUID+1,@Banner,0,1,1,1332.81946,334.003479,-64.23478,-2.91468954,0,0,0,0,120,0,1),
(@GGUID+2,@Banner,0,1,1,1524.69141,243.914124,-41.38988,-1.55334139,0,0,0,0,120,0,1),
(@GGUID+3,@Banner,0,1,1,1592.19531,168.616531,-41.424427,0,0,0,0,0,120,0,1),
(@GGUID+4,@Banner,0,1,1,1599.00293,311.549225,-41.4244232,-3.124123,0,0,0,0,120,0,1);
-- Event Handling
DELETE FROM `game_event_gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+4) AND `event`=@Event;
INSERT INTO `game_event_gameobject` (`guid`,`event`) VALUES
(@GGUID+0,@Event),
(@GGUID+1,@Event),
(@GGUID+2,@Event),
(@GGUID+3,@Event),
(@GGUID+4,@Event);
-- Pathing
SET @NPC :=@CGUID+9;
SET @PATH :=@NPC*10;
DELETE FROM `creature_formations` WHERE `leaderGUID`=@CGUID+9;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES 
(@CGUID+9,@CGUID+9,0,0,2),
(@CGUID+9,@CGUID+4,3,90,2);
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@NPC,@PATH);
DELETE FROM `waypoint_data` WHERE `id`=@PATH; 
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1633.54,180.941,-62.1792,0,0,0,100,0),
(@PATH,2,1643.4,187.231,-62.1807,0,0,0,100,0),
(@PATH,3,1659.3,207.71,-62.1788,0,0,0,100,0),
(@PATH,4,1665.55,226.576,-62.1788,0,0,0,100,0),
(@PATH,5,1666.6,249.188,-62.1788,0,0,0,100,0),
(@PATH,6,1660.32,271.069,-62.1788,0,0,0,100,0),
(@PATH,7,1647.42,288.737,-62.1818,0,0,0,100,0),
(@PATH,8,1624.67,307.036,-62.1787,0,0,0,100,0),
(@PATH,9,1581.49,310.531,-62.1787,0,0,0,100,0),
(@PATH,10,1546.92,291.715,-62.1805,0,0,0,100,0),
(@PATH,11,1529.93,269.005,-62.1789,0,0,0,100,0),
(@PATH,12,1526.49,213.221,-62.1789,0,0,0,100,0),
(@PATH,13,1537.43,194.846,-62.1789,0,0,0,100,0),
(@PATH,14,1564.85,173.251,-62.1786,0,0,0,100,0),
(@PATH,15,1614.72,169.978,-62.1786,0,0,0,100,0);

SET @Event:=21; -- Call to Arms: Eye of the Storm!
SET @CGUID:=@TCGUID+878; -- Set by TDB Team (need 10) - creature.guid
SET @GGUID:=@TGGUID+381; -- Set by TDB team (need 5) - gameobject.guid
SET @Banner:=185106; -- Blood Elf Banner
SET @Envoy:=22015; -- Eye of the Storm Envoy
-- Creature spawns
DELETE FROM `creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+9) AND `id` IN (@Envoy);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(@CGUID+0,@Envoy,0,1,1,0,0,1265.31421,353.74826,-63.63676,4.15388346,120,0,0,1,0,0,0),
(@CGUID+1,@Envoy,0,1,1,0,0,1522.566,242.054855,-41.30655,4.25860357,120,0,0,1,0,0,0),
(@CGUID+2,@Envoy,0,1,1,0,0,1593.7085,316.030426,-41.34109,6.213372,120,0,0,1,0,0,0),
(@CGUID+3,@Envoy,0,1,1,0,0,1597.45679,164.685333,-41.341095,2.65290046,120,0,0,1,0,0,0),
(@CGUID+4,@Envoy,0,1,1,0,0,1632.72327,182.795151,-62.1830444,0.313486964,120,0,0,1,0,0,0), -- WP
(@CGUID+5,@Envoy,0,1,1,0,0,1263.18408,350.777771,-63.64588,0.9773844,120,0,0,1,0,0,0),
(@CGUID+6,@Envoy,0,1,1,0,0,1521.08557,238.709366,-41.30655,1.18682384,120,0,0,1,0,0,0),
(@CGUID+7,@Envoy,0,1,1,0,0,1593.21692,166.867783,-41.341095,5.81194639,120,0,0,1,0,0,0),
(@CGUID+8,@Envoy,0,1,1,0,0,1596.566,315.891174,-41.341095,3.12413931,120,0,0,1,0,0,0),
(@CGUID+9,@Envoy,0,1,1,0,0,1633.34631,180.894547,-62.1827049,0.3135093,120,0,0,1,0,0,0); -- WP
-- Event handling
DELETE FROM `game_event_creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+9) AND `event`=@Event;
INSERT INTO `game_event_creature` (`guid`,`event`) VALUES
(@CGUID+0,@Event),
(@CGUID+1,@Event),
(@CGUID+2,@Event),
(@CGUID+3,@Event),
(@CGUID+4,@Event),
(@CGUID+5,@Event),
(@CGUID+6,@Event),
(@CGUID+7,@Event),
(@CGUID+8,@Event),
(@CGUID+9,@Event);
-- GOs spawns
DELETE FROM `gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+4) AND `id`=@Banner;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@GGUID+0,@Banner,0,1,1,1262.533,353.829865,-63.6908836,-0.8028509,0,0,0,0,120,0,1),
(@GGUID+1,@Banner,0,1,1,1332.81946,334.003479,-64.23478,-2.91468954,0,0,0,0,120,0,1),
(@GGUID+2,@Banner,0,1,1,1524.69141,243.914124,-41.38988,-1.55334139,0,0,0,0,120,0,1),
(@GGUID+3,@Banner,0,1,1,1592.19531,168.616531,-41.424427,0,0,0,0,0,120,0,1),
(@GGUID+4,@Banner,0,1,1,1599.00293,311.549225,-41.4244232,-3.124123,0,0,0,0,120,0,1);
-- Event Handling
DELETE FROM `game_event_gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+4) AND `event`=@Event;
INSERT INTO `game_event_gameobject` (`guid`,`event`) VALUES
(@GGUID+0,@Event),
(@GGUID+1,@Event),
(@GGUID+2,@Event),
(@GGUID+3,@Event),
(@GGUID+4,@Event);
-- Pathing
SET @NPC :=@CGUID+9;
SET @PATH :=@NPC*10;
DELETE FROM `creature_formations` WHERE `leaderGUID`=@CGUID+9;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES 
(@CGUID+9,@CGUID+9,0,0,2),
(@CGUID+9,@CGUID+4,3,90,2);
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@NPC,@PATH);
DELETE FROM `waypoint_data` WHERE `id`=@PATH; 
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1633.54,180.941,-62.1792,0,0,0,100,0),
(@PATH,2,1643.4,187.231,-62.1807,0,0,0,100,0),
(@PATH,3,1659.3,207.71,-62.1788,0,0,0,100,0),
(@PATH,4,1665.55,226.576,-62.1788,0,0,0,100,0),
(@PATH,5,1666.6,249.188,-62.1788,0,0,0,100,0),
(@PATH,6,1660.32,271.069,-62.1788,0,0,0,100,0),
(@PATH,7,1647.42,288.737,-62.1818,0,0,0,100,0),
(@PATH,8,1624.67,307.036,-62.1787,0,0,0,100,0),
(@PATH,9,1581.49,310.531,-62.1787,0,0,0,100,0),
(@PATH,10,1546.92,291.715,-62.1805,0,0,0,100,0),
(@PATH,11,1529.93,269.005,-62.1789,0,0,0,100,0),
(@PATH,12,1526.49,213.221,-62.1789,0,0,0,100,0),
(@PATH,13,1537.43,194.846,-62.1789,0,0,0,100,0),
(@PATH,14,1564.85,173.251,-62.1786,0,0,0,100,0),
(@PATH,15,1614.72,169.978,-62.1786,0,0,0,100,0);

SET @Event:=20; -- Call to Arms: Arathi Basin!
SET @CGUID:=@TCGUID+900; -- Set by TDB Team (need 10) - creature.guid
SET @GGUID:=@TGGUID+386; -- Set by TDB team (need 5) - gameobject.guid
SET @Banner:=180396; -- PVP HOLIDAY HORDE ARATHI
SET @Envoy:=14990; -- Defilers Emissary
-- Creature spawns
DELETE FROM `creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+9) AND `id` IN (@Envoy);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(@CGUID+0,@Envoy,0,1,1,0,0,1265.31421,353.74826,-63.63676,4.15388346,120,0,0,1,0,0,0),
(@CGUID+1,@Envoy,0,1,1,0,0,1522.566,242.054855,-41.30655,4.25860357,120,0,0,1,0,0,0),
(@CGUID+2,@Envoy,0,1,1,0,0,1593.7085,316.030426,-41.34109,6.213372,120,0,0,1,0,0,0),
(@CGUID+3,@Envoy,0,1,1,0,0,1597.45679,164.685333,-41.341095,2.65290046,120,0,0,1,0,0,0),
(@CGUID+4,@Envoy,0,1,1,0,0,1632.72327,182.795151,-62.1830444,0.313486964,120,0,0,1,0,0,0), -- WP
(@CGUID+5,@Envoy,0,1,1,0,0,1263.18408,350.777771,-63.64588,0.9773844,120,0,0,1,0,0,0),
(@CGUID+6,@Envoy,0,1,1,0,0,1521.08557,238.709366,-41.30655,1.18682384,120,0,0,1,0,0,0),
(@CGUID+7,@Envoy,0,1,1,0,0,1593.21692,166.867783,-41.341095,5.81194639,120,0,0,1,0,0,0),
(@CGUID+8,@Envoy,0,1,1,0,0,1596.566,315.891174,-41.341095,3.12413931,120,0,0,1,0,0,0),
(@CGUID+9,@Envoy,0,1,1,0,0,1633.34631,180.894547,-62.1827049,0.3135093,120,0,0,1,0,0,0); -- WP
-- Event handling
DELETE FROM `game_event_creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+9) AND `event`=@Event;
INSERT INTO `game_event_creature` (`guid`,`event`) VALUES
(@CGUID+0,@Event),
(@CGUID+1,@Event),
(@CGUID+2,@Event),
(@CGUID+3,@Event),
(@CGUID+4,@Event),
(@CGUID+5,@Event),
(@CGUID+6,@Event),
(@CGUID+7,@Event),
(@CGUID+8,@Event),
(@CGUID+9,@Event);
-- GOs spawns
DELETE FROM `gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+4) AND `id`=@Banner;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@GGUID+0,@Banner,0,1,1,1262.533,353.829865,-63.6908836,-0.8028509,0,0,0,0,120,0,1),
(@GGUID+1,@Banner,0,1,1,1332.81946,334.003479,-64.23478,-2.91468954,0,0,0,0,120,0,1),
(@GGUID+2,@Banner,0,1,1,1524.69141,243.914124,-41.38988,-1.55334139,0,0,0,0,120,0,1),
(@GGUID+3,@Banner,0,1,1,1592.19531,168.616531,-41.424427,0,0,0,0,0,120,0,1),
(@GGUID+4,@Banner,0,1,1,1599.00293,311.549225,-41.4244232,-3.124123,0,0,0,0,120,0,1);
-- Event Handling
DELETE FROM `game_event_gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+4) AND `event`=@Event;
INSERT INTO `game_event_gameobject` (`guid`,`event`) VALUES
(@GGUID+0,@Event),
(@GGUID+1,@Event),
(@GGUID+2,@Event),
(@GGUID+3,@Event),
(@GGUID+4,@Event);
-- Pathing
SET @NPC :=@CGUID+9;
SET @PATH :=@NPC*10;
DELETE FROM `creature_formations` WHERE `leaderGUID`=@CGUID+9;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES 
(@CGUID+9,@CGUID+9,0,0,2),
(@CGUID+9,@CGUID+4,3,90,2);
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@NPC,@PATH);
DELETE FROM `waypoint_data` WHERE `id`=@PATH; 
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1633.54,180.941,-62.1792,0,0,0,100,0),
(@PATH,2,1643.4,187.231,-62.1807,0,0,0,100,0),
(@PATH,3,1659.3,207.71,-62.1788,0,0,0,100,0),
(@PATH,4,1665.55,226.576,-62.1788,0,0,0,100,0),
(@PATH,5,1666.6,249.188,-62.1788,0,0,0,100,0),
(@PATH,6,1660.32,271.069,-62.1788,0,0,0,100,0),
(@PATH,7,1647.42,288.737,-62.1818,0,0,0,100,0),
(@PATH,8,1624.67,307.036,-62.1787,0,0,0,100,0),
(@PATH,9,1581.49,310.531,-62.1787,0,0,0,100,0),
(@PATH,10,1546.92,291.715,-62.1805,0,0,0,100,0),
(@PATH,11,1529.93,269.005,-62.1789,0,0,0,100,0),
(@PATH,12,1526.49,213.221,-62.1789,0,0,0,100,0),
(@PATH,13,1537.43,194.846,-62.1789,0,0,0,100,0),
(@PATH,14,1564.85,173.251,-62.1786,0,0,0,100,0),
(@PATH,15,1614.72,169.978,-62.1786,0,0,0,100,0);

SET @Event:=18; -- Call to Arms: Alterac Valley!
SET @CGUID:=@TCGUID+911; -- Set by TDB Team (need 10) - creature.guid
SET @GGUID:=@TGGUID+391; -- Set by TDB team (need 5) - gameobject.guid
SET @Banner:=180395; -- PVP HOLIDAY HORDE AV
SET @Envoy:=15106; -- Frostwolf Emissary
SET @Battlemaster:=347; -- Grizzle Halfmane
-- Creature spawns
DELETE FROM `creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+9) AND `id` IN (@Envoy);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(@CGUID+0,@Envoy,0,1,1,0,0,1265.31421,353.74826,-63.63676,4.15388346,120,0,0,1,0,0,0),
(@CGUID+1,@Envoy,0,1,1,0,0,1522.566,242.054855,-41.30655,4.25860357,120,0,0,1,0,0,0),
(@CGUID+2,@Envoy,0,1,1,0,0,1593.7085,316.030426,-41.34109,6.213372,120,0,0,1,0,0,0),
(@CGUID+3,@Envoy,0,1,1,0,0,1597.45679,164.685333,-41.341095,2.65290046,120,0,0,1,0,0,0),
(@CGUID+4,@Envoy,0,1,1,0,0,1632.72327,182.795151,-62.1830444,0.313486964,120,0,0,1,0,0,0), -- WP
(@CGUID+5,@Envoy,0,1,1,0,0,1263.18408,350.777771,-63.64588,0.9773844,120,0,0,1,0,0,0),
(@CGUID+6,@Envoy,0,1,1,0,0,1521.08557,238.709366,-41.30655,1.18682384,120,0,0,1,0,0,0),
(@CGUID+7,@Envoy,0,1,1,0,0,1593.21692,166.867783,-41.341095,5.81194639,120,0,0,1,0,0,0),
(@CGUID+8,@Envoy,0,1,1,0,0,1596.566,315.891174,-41.341095,3.12413931,120,0,0,1,0,0,0),
(@CGUID+9,@Envoy,0,1,1,0,0,1633.34631,180.894547,-62.1827049,0.3135093,120,0,0,1,0,0,0); -- WP
-- Event handling
DELETE FROM `game_event_creature` WHERE (`guid` BETWEEN @CGUID AND @CGUID+9) AND `event`=@Event;
INSERT INTO `game_event_creature` (`guid`,`event`) VALUES
(@CGUID+0,@Event),
(@CGUID+1,@Event),
(@CGUID+2,@Event),
(@CGUID+3,@Event),
(@CGUID+4,@Event),
(@CGUID+5,@Event),
(@CGUID+6,@Event),
(@CGUID+7,@Event),
(@CGUID+8,@Event),
(@CGUID+9,@Event);
-- GOs spawns
DELETE FROM `gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+4) AND `id`=@Banner;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@GGUID+0,@Banner,0,1,1,1262.533,353.829865,-63.6908836,-0.8028509,0,0,0,0,120,0,1),
(@GGUID+1,@Banner,0,1,1,1332.81946,334.003479,-64.23478,-2.91468954,0,0,0,0,120,0,1),
(@GGUID+2,@Banner,0,1,1,1524.69141,243.914124,-41.38988,-1.55334139,0,0,0,0,120,0,1),
(@GGUID+3,@Banner,0,1,1,1592.19531,168.616531,-41.424427,0,0,0,0,0,120,0,1),
(@GGUID+4,@Banner,0,1,1,1599.00293,311.549225,-41.4244232,-3.124123,0,0,0,0,120,0,1);
-- Event Handling
DELETE FROM `game_event_gameobject` WHERE (`guid` BETWEEN @GGUID AND @GGUID+4) AND `event`=@Event;
INSERT INTO `game_event_gameobject` (`guid`,`event`) VALUES
(@GGUID+0,@Event),
(@GGUID+1,@Event),
(@GGUID+2,@Event),
(@GGUID+3,@Event),
(@GGUID+4,@Event);
-- Pathing
SET @NPC :=@CGUID+9;
SET @PATH :=@NPC*10;
DELETE FROM `creature_formations` WHERE `leaderGUID`=@CGUID+9;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES 
(@CGUID+9,@CGUID+9,0,0,2),
(@CGUID+9,@CGUID+4,3,90,2);
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (@NPC,@PATH);
DELETE FROM `waypoint_data` WHERE `id`=@PATH; 
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1633.54,180.941,-62.1792,0,0,0,100,0),
(@PATH,2,1643.4,187.231,-62.1807,0,0,0,100,0),
(@PATH,3,1659.3,207.71,-62.1788,0,0,0,100,0),
(@PATH,4,1665.55,226.576,-62.1788,0,0,0,100,0),
(@PATH,5,1666.6,249.188,-62.1788,0,0,0,100,0),
(@PATH,6,1660.32,271.069,-62.1788,0,0,0,100,0),
(@PATH,7,1647.42,288.737,-62.1818,0,0,0,100,0),
(@PATH,8,1624.67,307.036,-62.1787,0,0,0,100,0),
(@PATH,9,1581.49,310.531,-62.1787,0,0,0,100,0),
(@PATH,10,1546.92,291.715,-62.1805,0,0,0,100,0),
(@PATH,11,1529.93,269.005,-62.1789,0,0,0,100,0),
(@PATH,12,1526.49,213.221,-62.1789,0,0,0,100,0),
(@PATH,13,1537.43,194.846,-62.1789,0,0,0,100,0),
(@PATH,14,1564.85,173.251,-62.1786,0,0,0,100,0),
(@PATH,15,1614.72,169.978,-62.1786,0,0,0,100,0);
-- END

ALTER TABLE `creature` DROP `phaseMask`;
ALTER TABLE `gameobject` DROP `phaseMask`;
ALTER TABLE `game_event_npc_vendor` DROP `slot`;
ALTER TABLE `waypoint_data` DROP `move_flag`;

/* creature table corrections */
-- Arathi Basin
SET @ABEnvoyH:=14990; -- Defilers Emissary                 /* Horde */
SET @ABEnvoyA:=14991; -- League of Arathor Emissary        /* Alliance */
-- Warsong Gulch
SET @WSGEnvoyH:=15102; -- Warsong Emissary                 /* Horde */
SET @WSGEnvoyA:=15105; -- Silverwing Emissary              /* Alliance */
-- Eye of the Storm
SET @EOTSEnvoyH:=22015; -- Eye of the Storm Envoy          /* Horde */
SET @EOTSEnvoyA:=22013; -- Eye of the Storm Emissary       /* Alliance */
-- Alterac Valley
SET @AVEnvoyH:=15106; -- Frostwolf Emissary                /* Horde */
SET @AVEnvoyA:=15103; -- Stormpike Emissary                /* Alliance */

UPDATE `creature` SET `curhealth` = 2471 WHERE `id` = @ABEnvoyH;
UPDATE `creature` SET `curhealth` = 2471 WHERE `id` = @ABEnvoyA;

UPDATE `creature` SET `curhealth` = 7200 WHERE `id` = @WSGEnvoyH;
UPDATE `creature` SET `curhealth` = 1605 WHERE `id` = @WSGEnvoyA;
UPDATE `creature` SET `curmana`   = 852  WHERE `id` = @WSGEnvoyA;

UPDATE `creature` SET `curhealth` = 6700 WHERE `id` = @EOTSEnvoyH;
UPDATE `creature` SET `curhealth` = 6600 WHERE `id` = @EOTSEnvoyA;

UPDATE `creature` SET `curhealth` = 6600 WHERE `id` = @AVEnvoyH;
UPDATE `creature` SET `curhealth` = 8000 WHERE `id` = @AVEnvoyA;