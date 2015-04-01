-- Revert star_comic

BEGIN;

DROP FUNCTION "1".star_comic(TEXT, INTEGER, BOOLEAN);

COMMIT;
