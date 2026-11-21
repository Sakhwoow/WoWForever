-- Rollback of the experience jump reported on 2026-11-21 (Forever PvE, support ticket about Stromgarde Keep).
-- The characters below got their level from a broken XP award: their stored XP is above any possible value
-- (1.19-1.71 billion; the login clamps anything above NextLevelXP-1, which is where the nine characters with
-- exactly 217399 come from). Level and XP are put back to the last sane state for the two characters the
-- reporter named; the rest are listed by the query at the bottom for a manual decision, because their history
-- (how far they really were) is not known.
--
-- Run once. Stats, spells and the XP bar are rebuilt from the level at the next login (Player::InitStatsForLevel).
-- Talents may need `.reset talents` for the affected characters if the talent points of the lower level are
-- already spent.

UPDATE `characters` SET `level` = 39, `xp` = 0 WHERE `guid` = 8632;  -- Nicos (Nikos Dee, account 1383)
UPDATE `characters` SET `level` = 39, `xp` = 0 WHERE `guid` = 8861;  -- Shinraa (account 1380)

-- Every character with an impossible XP value (run this and decide per character):
-- SELECT c.guid, c.account, c.name, c.level, c.xp
--   FROM `characters` c
--   WHERE c.xp > 217400
--   ORDER BY c.xp DESC;
-- Known rows at the time of the report: 8632 Nicos 1714989690, 9205 Hamianus 1198924812,
-- 9500 Talos / 9502 Stany 1192187096, 9501 Desirie / 9503 Althaea 1192186980,
-- and 8410 Принц, 8861 Shinraa, 8928-8930, 9051-9054 with 217399 (clamped at login).
