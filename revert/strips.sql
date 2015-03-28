-- Revert strips

BEGIN;

DROP FUNCTION "1".strips(INTEGER, TEXT);

COMMIT;
