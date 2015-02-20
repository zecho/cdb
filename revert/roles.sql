-- Revert roles

BEGIN;

DROP ROLE lurker;

DROP ROLE maestro;

DROP ROLE api;

COMMIT;
