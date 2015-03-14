-- Revert upsert_comic

BEGIN;

DROP FUNCTION "1".upsert_comic(TEXT, TEXT, TEXT, TEXT, TEXT, JSON);

COMMIT;
