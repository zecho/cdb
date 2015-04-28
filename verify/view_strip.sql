-- Verify view_strip

BEGIN;

SELECT has_function_privilege('maestro', 'cg.view_strip(INTEGER, INTEGER, BOOLEAN)', 'execute');

ROLLBACK;
