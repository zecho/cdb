-- Revert last_strip

BEGIN;

DROP FUNCTION cg.last_strip(TEXT);

COMMIT;
