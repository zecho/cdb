-- Revert view_comic

BEGIN;

DROP FUNCTION cg.view_comic(INTEGER, TEXT, BOOLEAN);

COMMIT;
