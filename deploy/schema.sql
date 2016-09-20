-- Deploy appschema

BEGIN;

CREATE SCHEMA cg;
GRANT USAGE ON SCHEMA cg TO mrcg;

COMMIT;
