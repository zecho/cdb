-- Verify star_strip

BEGIN;

SELECT has_function_privilege('maestro', 'cg.star_strip(INTEGER, INTEGER, BOOLEAN)', 'execute');

ROLLBACK;
