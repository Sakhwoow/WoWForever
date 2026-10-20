-- Classic 1.60 (WoW Forever): старые торговцы: npc_vendor (maxcount у существующих товаров)
-- ТОЛЬКО UPDATE различий у уже существующих (старых) сущностей по данным официального сервера (сборки снифов 70245-70425, для каждой сущности берётся самая свежая).
-- Каждый UPDATE меняет строку только если значение действительно отличается; повторный запуск безопасен.
-- Сгенерировано ForeverSniffTools (tools/gen_updates.py)

UPDATE `npc_vendor` SET `maxcount` = 0 WHERE `entry` = 3356 AND `item` = 12162 AND `ExtendedCost` = 0 AND `type` = 1 AND (NOT (`maxcount` <=> 0));
UPDATE `npc_vendor` SET `maxcount` = 2 WHERE `entry` = 3413 AND `item` = 4363 AND `ExtendedCost` = 0 AND `type` = 1 AND (NOT (`maxcount` <=> 2));
UPDATE `npc_vendor` SET `maxcount` = 0 WHERE `entry` = 3413 AND `item` = 16041 AND `ExtendedCost` = 0 AND `type` = 1 AND (NOT (`maxcount` <=> 0));
UPDATE `npc_vendor` SET `maxcount` = 0 WHERE `entry` = 3413 AND `item` = 16042 AND `ExtendedCost` = 0 AND `type` = 1 AND (NOT (`maxcount` <=> 0));
UPDATE `npc_vendor` SET `maxcount` = 0 WHERE `entry` = 3413 AND `item` = 18647 AND `ExtendedCost` = 0 AND `type` = 1 AND (NOT (`maxcount` <=> 0));
UPDATE `npc_vendor` SET `maxcount` = 0 WHERE `entry` = 4561 AND `item` = 16217 AND `ExtendedCost` = 0 AND `type` = 1 AND (NOT (`maxcount` <=> 0));
UPDATE `npc_vendor` SET `maxcount` = 0 WHERE `entry` = 4577 AND `item` = 5772 AND `ExtendedCost` = 0 AND `type` = 1 AND (NOT (`maxcount` <=> 0));
UPDATE `npc_vendor` SET `maxcount` = 0 WHERE `entry` = 4577 AND `item` = 6275 AND `ExtendedCost` = 0 AND `type` = 1 AND (NOT (`maxcount` <=> 0));
UPDATE `npc_vendor` SET `maxcount` = 0 WHERE `entry` = 4577 AND `item` = 10321 AND `ExtendedCost` = 0 AND `type` = 1 AND (NOT (`maxcount` <=> 0));
UPDATE `npc_vendor` SET `maxcount` = 0 WHERE `entry` = 4577 AND `item` = 10323 AND `ExtendedCost` = 0 AND `type` = 1 AND (NOT (`maxcount` <=> 0));
UPDATE `npc_vendor` SET `maxcount` = 0 WHERE `entry` = 4577 AND `item` = 10326 AND `ExtendedCost` = 0 AND `type` = 1 AND (NOT (`maxcount` <=> 0));
UPDATE `npc_vendor` SET `maxcount` = 4 WHERE `entry` = 4581 AND `item` = 3012 AND `ExtendedCost` = 0 AND `type` = 1 AND (NOT (`maxcount` <=> 4));
UPDATE `npc_vendor` SET `maxcount` = 0 WHERE `entry` = 4589 AND `item` = 7451 AND `ExtendedCost` = 0 AND `type` = 1 AND (NOT (`maxcount` <=> 0));
UPDATE `npc_vendor` SET `maxcount` = 0 WHERE `entry` = 4610 AND `item` = 9301 AND `ExtendedCost` = 0 AND `type` = 1 AND (NOT (`maxcount` <=> 0));
UPDATE `npc_vendor` SET `maxcount` = 0 WHERE `entry` = 4610 AND `item` = 13477 AND `ExtendedCost` = 0 AND `type` = 1 AND (NOT (`maxcount` <=> 0));
UPDATE `npc_vendor` SET `maxcount` = 0 WHERE `entry` = 4617 AND `item` = 6342 AND `ExtendedCost` = 0 AND `type` = 1 AND (NOT (`maxcount` <=> 0));
UPDATE `npc_vendor` SET `maxcount` = 0 WHERE `entry` = 12022 AND `item` = 14483 AND `ExtendedCost` = 0 AND `type` = 1 AND (NOT (`maxcount` <=> 0));
UPDATE `npc_vendor` SET `maxcount` = 0 WHERE `entry` = 12022 AND `item` = 16243 AND `ExtendedCost` = 0 AND `type` = 1 AND (NOT (`maxcount` <=> 0));
