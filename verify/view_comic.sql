-- Verify view_comic

BEGIN;

SELECT has_function_privilege('maestro', '"1".view_comic(INTEGER, TEXT, BOOLEAN)', 'execute');

ROLLBACK;
