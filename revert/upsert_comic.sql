-- Revert upsert_comic

BEGIN;

DROP FUNCTION cg.upsert_comic(TEXT, TEXT, TEXT, TEXT, TEXT, TEXT, JSON);

COMMIT;
