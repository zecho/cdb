-- Revert geek_secret

BEGIN;

DROP FUNCTION "1".geek_secret(INTEGER);

COMMIT;
