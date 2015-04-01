-- Verify star_comic

BEGIN;

SELECT has_function_privilege('maestro', '"1".star_comic(TEXT, INTEGER, BOOLEAN)', 'execute');

ROLLBACK;
