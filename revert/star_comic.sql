-- Revert star_comic

BEGIN;

DROP FUNCTION cg.star_comic(INTEGER, TEXT, BOOLEAN);

COMMIT;
