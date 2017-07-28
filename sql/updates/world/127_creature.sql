UPDATE `creature` 
INNER JOIN `creature_template` ON (`creature`.`id`  = `creature_template`.`entry`)
SET `creature`.`equipment_id` = `creature_template`.`equipment_id`;