-- Revert strips

BEGIN;

DROP FUNCTION cg.strips(INTEGER, TEXT);

COMMIT;
