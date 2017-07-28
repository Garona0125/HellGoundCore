DELETE FROM `spell_linked_spell` WHERE `spell_linked_spell`.`spell_trigger` = -30423;
DELETE FROM `spell_linked_spell` WHERE `spell_linked_spell`.`spell_trigger` = -30422;
DELETE FROM `spell_linked_spell` WHERE `spell_linked_spell`.`spell_trigger` = -30421;
 
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(-30423, 38639, 0, 'Netherspite''s Dominance'),
(-30422, 38638, 0, 'Netherspite''s Serenity'),
(-30421, 38637, 0, 'Netherspite''s Perseverence');