-- Deploy appschema
-- requires: roles

BEGIN;

CREATE SCHEMA cg;

GRANT USAGE ON SCHEMA cg to lurker;
GRANT USAGE ON SCHEMA cg to api;

COMMIT;
