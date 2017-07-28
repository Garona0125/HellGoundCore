-- Mage S3 legs correction at arena vendor
UPDATE `npc_vendor` SET `ExtendedCost` = '2285' WHERE `npc_vendor`.`entry` = 25178 AND `npc_vendor`.`item` = 33671;