-- Verify view_strip

BEGIN;

SELECT has_function_privilege('maestro', '"1".view_strip(TEXT, INTEGER, BOOLEAN)', 'execute');

ROLLBACK;
