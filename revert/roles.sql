-- Revert roles

BEGIN;
-- special c11z
--TODO remove this manke it more restrictive.
REVOKE USAGE ON SCHEMA postgrest FROM c11z;
DROP ROLE c11z;

DROP ROLE anon;
DROP ROLE lurker;
DROP ROLE maestro;
DROP ROLE api;

COMMIT;
