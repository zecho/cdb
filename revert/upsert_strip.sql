-- Revert upsert_strip

BEGIN;

DROP FUNCTION "1".upsert_strip(TEXT, VARCHAR(32), TEXT, INTEGER, TEXT, TEXT, TEXT, TEXT, TEXT);

COMMIT;
