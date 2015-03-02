-- Revert postgrest_auth

BEGIN;

DROP TRIGGER ensure_auth_role_exists ON postgrest.auth;
DROP FUNCTION postgrest.check_role_exists();
DROP TABLE postgrest.auth;
DROP SCHEMA postgrest;

COMMIT;
