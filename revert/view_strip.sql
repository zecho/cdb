-- Revert view_strip

BEGIN;

DROP FUNCTION "1".view_strip(INTEGER, INTEGER, BOOLEAN);

COMMIT;
