-- Verify update_comic

BEGIN;

SELECT has_function_privilege('lurker', '"1".update_comic(UUID, VARCHAR, VARCHAR, VARCHAR, VARCHAR)', 'execute');

ROLLBACK;
