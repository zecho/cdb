-- Verify upsert_geek

BEGIN;

SELECT has_function_privilege('maestro', '"1".upsert_geek(TEXT, TEXT)', 'execute');

ROLLBACK;
