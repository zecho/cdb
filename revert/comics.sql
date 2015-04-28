-- Revert comics

BEGIN;

DROP FUNCTION cg.comics(INTEGER);

COMMIT;
