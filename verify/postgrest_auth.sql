-- Verify postgrest_auth

BEGIN;

SELECT pg_catalog.has_schema_privilege('postgrest', 'usage');

SELECT id, rolname, pass
 FROM postgrest.auth
 WHERE FALSE;

SELECT has_function_privilege('postgrest.check_role_exists()', 'execute');

SELECT 1/count(*) FROM pg_trigger WHERE tgname = 'ensure_auth_role_exists';

ROLLBACK;
