-- Revert last_strip

BEGIN;

DROP FUNCTION "1".last_strip(TEXT);

COMMIT;
