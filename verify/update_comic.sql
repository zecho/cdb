-- Verify update_comic

BEGIN;

SELECT has_function_privilege('lurker', 'cg.update_comic(UUID, VARCHAR, VARCHAR, VARCHAR, VARCHAR)', 'execute');

ROLLBACK;
