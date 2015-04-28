-- Deploy appschema
-- requires: roles

BEGIN;

CREATE SCHEMA cg;
GRANT USAGE ON SCHEMA cg TO lurker;
GRANT USAGE ON SCHEMA cg TO maestro;

COMMIT;
