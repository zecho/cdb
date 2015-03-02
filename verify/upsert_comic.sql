-- Verify upsert_comic

BEGIN;

-- SELECT has_function_privilege('"1".upsert_comic(VARCHAR, VARCHAR, VARCHAR, VARCHAR)', 'execute');
-- SELECT has_function_privilege('"1".upsert_comic(UUID, VARCHAR, VARCHAR, VARCHAR, VARCHAR)', 'execute');

SELECT has_function_privilege('lurker', '"1".upsert_comic(UUID, VARCHAR, VARCHAR, VARCHAR, VARCHAR)', 'execute');
SELECT has_function_privilege('lurker', '"1".upsert_comic(VARCHAR, VARCHAR, VARCHAR, VARCHAR)', 'execute');

ROLLBACK;
