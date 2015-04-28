-- Verify roles

BEGIN;

SELECT 1/count(*) FROM pg_roles WHERE rolname = 'lurker';
SELECT 1/count(*) FROM pg_roles WHERE rolname = 'maestro';

ROLLBACK;
