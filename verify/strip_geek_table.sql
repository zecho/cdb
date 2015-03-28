-- Verify strip_geek_table

BEGIN;

SELECT geek_id, strip_id, is_viewed, is_liked, created_at, updated_at
 FROM "1".strip_geek
 WHERE FALSE;

SELECT 1/count(*) FROM pg_indexes WHERE indexname = 'strip_geek_ix_strip_id';
SELECT 1/count(*) FROM pg_indexes WHERE indexname = 'strip_geek_ix_geek_id';
SELECT 1/count(*) FROM pg_indexes WHERE indexname = 'strip_geek_ix_updated_at';

SELECT has_table_privilege('api', '"1".strip', 'update');
SELECT has_table_privilege('api', '"1".strip', 'insert');

ROLLBACK;
