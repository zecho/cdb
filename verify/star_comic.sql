-- Verify star_comic

BEGIN;

SELECT has_function_privilege('maestro', '"1".star_comic(INTEGER, TEXT, BOOLEAN)', 'execute');

ROLLBACK;
