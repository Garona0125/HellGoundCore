DELETE FROM `creature_ai_scripts` WHERE `creature_ai_scripts`.`id` = 2119601;

INSERT INTO `creature_ai_scripts` (`id`, `entryOrGUID`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
(2119601, 21196, 0, 0, 100, 1, 4000, 12000, 20000, 25000, 11, 37933, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ravenous Flayer - Consume Flesh');

UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `creature_template`.`entry` = 21196;