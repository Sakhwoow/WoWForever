-- Per-product BattlepayDisplayFlags for the in-game store card (25.11.2026).
-- 0 = use the global Classic.Shop.DisplayFlags; non-zero = sent as DisplayInfo.flags for this product only.
-- Client enum BattlepayDisplayFlags has 12 flags: 1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048.
--
-- Idempotent: добавляет колонку только если её ещё нет.

SET @shop_product_has_displayflags := (
    SELECT COUNT(*) FROM `information_schema`.`COLUMNS`
    WHERE `TABLE_SCHEMA` = DATABASE() AND `TABLE_NAME` = 'shop_product' AND `COLUMN_NAME` = 'DisplayFlags');
SET @shop_product_displayflags_sql := IF(@shop_product_has_displayflags = 0,
    'ALTER TABLE `shop_product` ADD COLUMN `DisplayFlags` INT UNSIGNED NOT NULL DEFAULT 0 COMMENT ''BattlepayDisplayFlags for the card; 0 = Classic.Shop.DisplayFlags'' AFTER `Realms`',
    'DO 0');
PREPARE shop_product_displayflags_stmt FROM @shop_product_displayflags_sql;
EXECUTE shop_product_displayflags_stmt;
DEALLOCATE PREPARE shop_product_displayflags_stmt;
