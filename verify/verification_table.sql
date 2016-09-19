-- Verify cdb:verification_table on pg

BEGIN;

SELECT email, code, created_at
 FROM cg.verification
 WHERE FALSE;

SELECT 1/count(*) FROM pg_indexes WHERE indexname = 'verification_uq_email';
SELECT 1/count(*) FROM pg_indexes WHERE indexname = 'verification_ix_created_at';

SELECT has_table_privilege('vagrant', 'cg.verification', 'select');
SELECT has_table_privilege('vagrant', 'cg.verification', 'update');
SELECT has_table_privilege('vagrant', 'cg.verification', 'insert');

ROLLBACK;
