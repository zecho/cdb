-- Revert star_comic

BEGIN;

DROP FUNCTION "1".star_comic(INTEGER, TEXT, BOOLEAN);

COMMIT;
