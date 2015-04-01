-- Revert star_strip

BEGIN;

DROP FUNCTION "1".star_strip(TEXT, INTEGER, BOOLEAN);

COMMIT;
