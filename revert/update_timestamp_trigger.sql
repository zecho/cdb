-- Revert update_timestamp_trigger

BEGIN;

DROP TRIGGER comic_tg_update_timestamp ON cg.comic;
DROP TRIGGER geek_tg_update_timestamp ON cg.geek;
DROP TRIGGER strip_tg_update_timestamp ON cg.strip;
DROP TRIGGER comic_geek_tg_update_timestamp ON cg.comic_geek;
DROP TRIGGER strip_geek_tg_update_timestamp ON cg.strip_geek;

DROP FUNCTION cg.update_timestamp();

COMMIT;
