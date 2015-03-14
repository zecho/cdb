-- Verify upsert_comic

BEGIN;

SELECT has_function_privilege('lurker', '"1".upsert_comic(TEXT, TEXT, TEXT, TEXT, TEXT, JSON)', 'execute');

ROLLBACK;
