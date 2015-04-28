-- Revert upsert_geek

BEGIN;

DROP FUNCTION cg.upsert_geek(TEXT, TEXT);

COMMIT;
