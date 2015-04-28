-- Verify view_comic

BEGIN;

SELECT has_function_privilege('maestro', 'cg.view_comic(INTEGER, TEXT, BOOLEAN)', 'execute');

ROLLBACK;
