-- Verify star_strip

BEGIN;

SELECT has_function_privilege('maestro', '"1".star_strip(TEXT, INTEGER, BOOLEAN)', 'execute');

ROLLBACK;
