-- Personal experience rate chosen with ".xp rate <1-5>" (scripts/World/xp_rate.cpp, worldserver.conf XpRateCommand.*).
-- A row exists only for characters with a rate above x1; ".xp rate default" or deleting the character removes it. Safe to run again.
CREATE TABLE IF NOT EXISTS `character_xp_rate` (
  `guid` bigint unsigned NOT NULL COMMENT 'characters.guid',
  `rate` tinyint unsigned NOT NULL COMMENT 'experience multiplier, 2..5',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='personal XP rate (.xp rate)';
