-- Verify upsert_comic

BEGIN;

-- SELECT has_function_privilege('cg.upsert_comic(VARCHAR, VARCHAR, VARCHAR, VARCHAR)', 'execute');
-- SELECT has_function_privilege('cg.upsert_comic(UUID, VARCHAR, VARCHAR, VARCHAR, VARCHAR)', 'execute');

SELECT has_function_privilege('lurker', 'cg.upsert_comic(UUID, VARCHAR, VARCHAR, VARCHAR, VARCHAR)', 'execute');
SELECT has_function_privilege('lurker', 'cg.upsert_comic(VARCHAR, VARCHAR, VARCHAR, VARCHAR)', 'execute');

ROLLBACK;
