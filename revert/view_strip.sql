-- Revert view_strip

BEGIN;

DROP FUNCTION cg.view_strip(INTEGER, INTEGER, BOOLEAN);

COMMIT;
