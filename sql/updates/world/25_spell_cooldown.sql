DROP TABLE IF EXISTS `spell_cooldown`;
CREATE TABLE `spell_cooldown` (  
  `spellid` int(11) unsigned NOT NULL default '0',
  `cooldown`int(11) DEFAULT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY  (`spellid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Spell System';

INSERT INTO `spell_cooldown` (`spellid`, `cooldown`, `comment`) VALUES
-- below 2 seconds
(44935, 1080, '(1) sec cooldown - Expose Razorthorn Root'),
(29992, 1080, '(1) sec cooldown - Quest spell - needs cooldown to be able to add to possessed unit'),
-- 2 seconds
(22907, 2000, '2 sec cooldown - Shoot'),
(35946, 2000, '2 sec cooldown - Shoot'),
(44533, 2000, '2 sec cooldown - Wretched Stab'),
-- 6 seconds
(44639, 6000, '6 sec cooldown - Frost Arrow'),
(46082, 6000, '6 sec cooldown - Shadow Bolt Volley'),
-- 8 seconds
(44534, 8000, '8 sec cooldown - Wretched Strike'),
(44640, 8000, '8 sec cooldown - Lash of Pain'),
-- 10 seconds
(44518, 10000, '10 sec cooldown - Immolate'),
(46042, 10000, '10 sec cooldown - Immolate'),
(44479, 10000, '10 sec cooldown - Holy Light'),
(46029, 10000, '10 sec cooldown - Holy Light'),
-- 12 seconds
(44547, 12000, '12 sec cooldown - Deadly Embrace'),
(44599, 12000, '12 sec cooldown - Inject Poison'),
(46046, 12000, '12 sec cooldown - Inject Poison'),
-- 15 seconds
(44478, 15000, '15 sec cooldown - Glaive Throw'),
(46028, 15000, '15 sec cooldown - Glaive Throw'),
(20299, 15000, '15 sec cooldown - Forked Lightning'),
(46150, 15000, '15 sec cooldown - Forked Lightning'),
(17741, 15000, '15 sec cooldown - Mana Shield'),
(46151, 15000, '15 sec cooldown - Mana Shield'),
-- 20 seconds
(44480, 20000, '20 sec cooldown - Seal of Wrath'),
(46030, 20000, '20 sec cooldown - Seal of Wrath'),
-- 24 seconds
(44505, 24000, '24 sec cooldown - Drink Fel Infusion'),
-- 30 seconds
(44475, 30000, '30 sec cooldown - Magic Dampening Field'),
-- 3 minutes
(30015, 300000, '3 min cooldown - Summon Naias'),
(35413, 300000, '3 min cooldown - Summon Goliathon'),
-- 30 minutes
(44520, 1800000, '30 min cooldown - Fel Armor'),
-- 3 hours
(16054, 10800000, '3h cooldown - Flames of the Black Flight');