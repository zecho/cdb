-- Verify appschema

BEGIN;

SELECT pg_catalog.has_schema_privilege('1', 'usage');

ROLLBACK;
