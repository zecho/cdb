-- Verify star_strip

BEGIN;

SELECT has_function_privilege('maestro', '"1".star_strip(INTEGER, INTEGER, BOOLEAN)', 'execute');

ROLLBACK;
