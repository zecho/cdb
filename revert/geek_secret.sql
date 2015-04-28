-- Revert geek_secret

BEGIN;

DROP FUNCTION cg.geek_secret(INTEGER);

COMMIT;
