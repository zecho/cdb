-- Revert last_strip_url

BEGIN;

DROP FUNCTION "1".last_strip_url(TEXT);

COMMIT;
