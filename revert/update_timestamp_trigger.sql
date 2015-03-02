-- Revert update_timestamp_trigger

BEGIN;

DROP TRIGGER comic_tg_update_timestamp ON "1".comic;
DROP TRIGGER geek_tg_update_timestamp ON "1".geek;
DROP TRIGGER strip_tg_update_timestamp ON "1".strip;
DROP TRIGGER comic_geek_tg_update_timestamp ON "1".comic_geek;
DROP TRIGGER strip_geek_tg_update_timestamp ON "1".strip_geek;

DROP FUNCTION "1".update_timestamp();

COMMIT;
