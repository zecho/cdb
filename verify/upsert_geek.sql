-- Verify upsert_geek

BEGIN;

SELECT has_function_privilege('maestro', 'cg.upsert_geek(TEXT, TEXT)', 'execute');

ROLLBACK;
