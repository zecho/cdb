-- Verify comics

BEGIN;

SELECT has_function_privilege('maestro', 'cg.comics(INTEGER)', 'execute');

ROLLBACK;
