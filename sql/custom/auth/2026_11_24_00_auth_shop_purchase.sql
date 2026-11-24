-- Classic 1.60 in-game Store: состояние покупки (идемпотентность выдачи и возвраты).
-- Применять к forever_auth. Одна строка на PurchaseID; статусы: charged -> delivered | refunded.

CREATE TABLE IF NOT EXISTS `shop_purchase` (
  `PurchaseID` BIGINT UNSIGNED NOT NULL,
  `AccountID` INT UNSIGNED NOT NULL,
  `ProductID` INT UNSIGNED NOT NULL,
  `Price` INT UNSIGNED NOT NULL,
  `TargetGUID` BIGINT UNSIGNED NOT NULL,
  `Status` ENUM('charged','delivered','refunded') NOT NULL DEFAULT 'charged',
  `CreatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`PurchaseID`),
  KEY `idx_account` (`AccountID`),
  KEY `idx_status` (`Status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
