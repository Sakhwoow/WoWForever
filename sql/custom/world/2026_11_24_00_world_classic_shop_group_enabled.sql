-- Classic 1.60 in-game Store: включение/отключение вкладок магазина.
-- Ядро (ObjectMgr::LoadShop) загружает только группы с Enabled = 1; товары отключённой
-- группы не попадают в каталог, потому что их GroupID отсутствует в списке групп.
-- Выполнять один раз на forever_world. После применения требуется пересборка ядра
-- и рестарт PvE/HC (или хотя бы .shop reload уже на новом ядре).

ALTER TABLE `shop_group`
  ADD COLUMN `Enabled` TINYINT UNSIGNED NOT NULL DEFAULT 1 AFTER `Ordering`;
