-- Classic 1.60 in-game Store: включение/отключение вкладок магазина.
-- Ядро (ObjectMgr::LoadShop) загружает только группы с Enabled = 1; товары отключённой
-- группы не попадают в каталог, потому что их GroupID отсутствует в списке групп.
-- Выполнять на forever_world. После применения требуется пересборка ядра и рестарт PvE/HC
-- (или хотя бы .shop reload уже на новом ядре).
--
-- Идемпотентно: на проде колонка уже добавлена вручную (2026-11-24), и без проверки
-- ALTER ADD COLUMN уронил бы авто-апдейтер мира на рестарте. На чистой базе колонка
-- добавляется; повторный запуск — no-op.

SET @shop_group_has_enabled := (
    SELECT COUNT(*) FROM `information_schema`.`COLUMNS`
    WHERE `TABLE_SCHEMA` = DATABASE() AND `TABLE_NAME` = 'shop_group' AND `COLUMN_NAME` = 'Enabled');

SET @shop_group_sql := IF(@shop_group_has_enabled = 0,
    'ALTER TABLE `shop_group` ADD COLUMN `Enabled` TINYINT UNSIGNED NOT NULL DEFAULT 1 AFTER `Ordering`',
    'DO 0');

PREPARE shop_group_stmt FROM @shop_group_sql;
EXECUTE shop_group_stmt;
DEALLOCATE PREPARE shop_group_stmt;
