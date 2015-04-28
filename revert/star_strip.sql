-- Revert star_strip

BEGIN;

DROP FUNCTION cg.star_strip(INTEGER, INTEGER, BOOLEAN);

COMMIT;
