-- Verify comic_table

BEGIN;

SELECT id, hostname, title, creator, headline_image_url, created_at, updated_at
 FROM "1".comic
 WHERE FALSE;

SELECT 1/count(*) FROM pg_indexes WHERE indexname = 'comic_uq_hostname';
SELECT 1/count(*) FROM pg_indexes WHERE indexname = 'comic_ix_updated_at';

SELECT has_table_privilege('lurker', '"1".comic', 'select');
SELECT has_table_privilege('lurker', '"1".comic', 'update');
SELECT has_table_privilege('lurker', '"1".comic', 'insert');

ROLLBACK;
