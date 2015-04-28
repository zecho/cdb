-- Verify geek_secret

BEGIN;

SELECT has_function_privilege('maestro', 'cg.geek_secret(INTEGER)', 'execute');

ROLLBACK;
