-- Verify upsert_strip

BEGIN;

SELECT has_function_privilege('lurker', 'cg.upsert_strip(UUID, VARCHAR, INTEGER, VARCHAR, VARCHAR, VARCHAR, VARCHAR, TEXT)', 'execute');
SELECT has_function_privilege('lurker', 'cg.upsert_strip(UUID, UUID, VARCHAR, INTEGER, VARCHAR, VARCHAR, VARCHAR, VARCHAR, TEXT)', 'execute');

ROLLBACK;
