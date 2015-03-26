-- Verify comics

BEGIN;

SELECT has_function_privilege('maestro', '"1".comics(INTEGER)', 'execute');

ROLLBACK;
