-- Deploy postgrest_auth

BEGIN;

CREATE SCHEMA postgrest;

CREATE TABLE postgrest.auth (
  id VARCHAR NOT NULL,
  rolname NAME NOT NULL,
  pass CHARACTER(60) NOT NULL,
  CONSTRAINT auth_pkey PRIMARY KEY (id)
);

CREATE FUNCTION postgrest.check_role_exists() RETURNS TRIGGER
    LANGUAGE plpgsql
    AS $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM pg_roles AS r WHERE r.rolname = NEW.rolname) THEN
   RAISE foreign_key_violation USING MESSAGE = 'Cannot create user with unknown role: ' || NEW.rolname;
   RETURN NULL;
 END IF;
 RETURN NEW;
END
$$;

CREATE CONSTRAINT TRIGGER ensure_auth_role_exists
  AFTER INSERT OR UPDATE
  ON postgrest.auth
  FOR EACH ROW
  EXECUTE PROCEDURE postgrest.check_role_exists();

COMMIT;
