-- Verify geek_table

BEGIN;

SELECT id, email, secret, created_at, updated_at
 FROM "1".geek
 WHERE FALSE;

SELECT 1/count(*) FROM pg_indexes WHERE indexname = 'geek_uq_email';
SELECT 1/count(*) FROM pg_indexes WHERE indexname = 'geek_ix_updated_at';

SELECT has_table_privilege('lurker', '"1".geek', 'select');
SELECT has_table_privilege('lurker', '"1".geek', 'update');
SELECT has_table_privilege('lurker', '"1".geek', 'insert');

ROLLBACK;
