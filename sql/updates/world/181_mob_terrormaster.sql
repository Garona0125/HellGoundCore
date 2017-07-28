DELETE FROM `creature_ai_scripts` WHERE `creature_ai_scripts`.`id` = 2131401;
DELETE FROM `creature_ai_scripts` WHERE `creature_ai_scripts`.`id` = 2131402;

INSERT INTO `creature_ai_scripts` (`id`, `entryOrGUID`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
(2131401, 21314, 0, 0, 100, 1, 1000, 2000, 4000, 7000, 11, 15496, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Terrormaster - Cast Cleave'),
(2131402, 21314, 0, 0, 100, 1, 9000, 12000, 20000, 25000, 11, 38154, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Terrormaster - Cast Fear');

UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `creature_template`.`entry` = 21314;