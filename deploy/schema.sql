-- Deploy appschema

BEGIN;

CREATE SCHEMA cg;
GRANT USAGE ON SCHEMA cg TO vagrant;

COMMIT;
