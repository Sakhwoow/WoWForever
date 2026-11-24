-- Classic 1.60 in-game Store: ассортимент по реалмам (PvE 70, HC 73).
-- Ядро (ObjectMgr::LoadShop) берёт свой RealmId из Classic.Shop.RealmId и грузит только те группы/товары,
-- у которых Realms пустой/«0» (все реалмы) или содержит этот id. Так один каталог в forever_world может
-- показывать разные товары на PvE и HC.
--
-- Идемпотентно: колонки добавляются, только если их ещё нет (повторный запуск — no-op).

SET @shop_group_has_realms := (
    SELECT COUNT(*) FROM `information_schema`.`COLUMNS`
    WHERE `TABLE_SCHEMA` = DATABASE() AND `TABLE_NAME` = 'shop_group' AND `COLUMN_NAME` = 'Realms');
SET @shop_group_sql := IF(@shop_group_has_realms = 0,
    'ALTER TABLE `shop_group` ADD COLUMN `Realms` VARCHAR(64) NOT NULL DEFAULT ''0'' COMMENT ''realm ids, comma separated; 0 = all'' AFTER `Enabled`',
    'DO 0');
PREPARE shop_group_realms_stmt FROM @shop_group_sql;
EXECUTE shop_group_realms_stmt;
DEALLOCATE PREPARE shop_group_realms_stmt;

SET @shop_product_has_realms := (
    SELECT COUNT(*) FROM `information_schema`.`COLUMNS`
    WHERE `TABLE_SCHEMA` = DATABASE() AND `TABLE_NAME` = 'shop_product' AND `COLUMN_NAME` = 'Realms');
SET @shop_product_sql := IF(@shop_product_has_realms = 0,
    'ALTER TABLE `shop_product` ADD COLUMN `Realms` VARCHAR(64) NOT NULL DEFAULT ''0'' COMMENT ''realm ids, comma separated; 0 = all'' AFTER `Enabled`',
    'DO 0');
PREPARE shop_product_realms_stmt FROM @shop_product_sql;
EXECUTE shop_product_realms_stmt;
DEALLOCATE PREPARE shop_product_realms_stmt;
