-- Revert star_strip

BEGIN;

DROP FUNCTION "1".star_strip(INTEGER, INTEGER, BOOLEAN);

COMMIT;
