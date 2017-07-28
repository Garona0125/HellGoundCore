-- Deadly Thrown fix
UPDATE `spell_proc_event` SET `procFlags` = '320', `procEx` = '0' WHERE `spell_proc_event`.`entry` = 32748;