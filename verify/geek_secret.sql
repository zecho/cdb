-- Verify geek_secret

BEGIN;

SELECT has_function_privilege('maestro', '"1".geek_secret(INTEGER)', 'execute');

ROLLBACK;
