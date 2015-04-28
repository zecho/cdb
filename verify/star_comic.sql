-- Verify star_comic

BEGIN;

SELECT has_function_privilege('maestro', 'cg.star_comic(INTEGER, TEXT, BOOLEAN)', 'execute');

ROLLBACK;
