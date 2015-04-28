-- Verify upsert_comic

BEGIN;

SELECT has_function_privilege('lurker', 'cg.upsert_comic(TEXT, TEXT, TEXT, TEXT, TEXT, TEXT, JSON)', 'execute');

ROLLBACK;
