-- Verify roles

BEGIN;

SELECT 1/count(*) FROM pg_roles WHERE rolname = 'c11z';
SELECT 1/count(*) FROM pg_roles WHERE rolname = 'anon';
SELECT 1/count(*) FROM pg_roles WHERE rolname = 'lurker';
SELECT 1/count(*) FROM pg_roles WHERE rolname = 'api';
SELECT 1/count(*) FROM pg_roles WHERE rolname = 'maestro';

ROLLBACK;
