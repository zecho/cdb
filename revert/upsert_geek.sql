-- Revert upsert_geek

BEGIN;

DROP FUNCTION "1".upsert_geek(TEXT, TEXT);

COMMIT;
