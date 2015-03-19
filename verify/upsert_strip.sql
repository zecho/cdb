-- Verify upsert_strip

BEGIN;

SELECT has_function_privilege('lurker', '"1".upsert_strip(TEXT, VARCHAR(32), TEXT, INTEGER, TEXT, TEXT, TEXT, TEXT, TEXT)', 'execute');

ROLLBACK;
