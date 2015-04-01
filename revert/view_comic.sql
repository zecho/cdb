-- Revert view_comic

BEGIN;

DROP FUNCTION "1".view_comic(TEXT, INTEGER, BOOLEAN);

COMMIT;
