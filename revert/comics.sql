-- Revert comics

BEGIN;

DROP FUNCTION "1".comics(INTEGER);

COMMIT;
