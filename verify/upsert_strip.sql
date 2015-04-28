-- Verify upsert_strip

BEGIN;

SELECT has_function_privilege('lurker', 'cg.upsert_strip(TEXT, VARCHAR(32), TEXT, INTEGER, TEXT, TEXT, TEXT, TEXT, TEXT, BOOLEAN)', 'execute');

ROLLBACK;
