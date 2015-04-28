-- Revert roles

BEGIN;

DROP ROLE lurker;
DROP ROLE maestro;

COMMIT;
