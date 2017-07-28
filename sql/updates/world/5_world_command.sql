DELETE FROM `command` WHERE `command`.`name` = 'flusharenapoints';
DELETE FROM `command` WHERE `command`.`name` = 'flusharena';
INSERT INTO `command` (`name`, `permission_mask`, `self_mask`, `help`) VALUES
('flusharena', 14336, 8838608, 'Syntax: .flusharena\r\nUse it to distribute arena points based on arena team ratings, and start a new week.');