-- Verify strips

BEGIN;

SELECT has_function_privilege('maestro', '"1".strips(INTEGER, TEXT)', 'execute');

ROLLBACK;
