-- Verify strips

BEGIN;

SELECT has_function_privilege('maestro', 'cg.strips(INTEGER, TEXT)', 'execute');

ROLLBACK;
