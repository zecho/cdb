-- Revert roles

BEGIN;

DROP ROLE c11z;

DROP ROLE anon;

DROP ROLE lurker;

DROP ROLE maestro;

DROP ROLE api;

COMMIT;
