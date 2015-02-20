-- Verify comic_table

BEGIN;

SELECT id, hostname, title, creator, headline_image_url, created_at, updated_at
 FROM cg.comic
 WHERE FALSE;

SELECT 1/count(*) FROM pg_indexes WHERE indexname = 'comic_uq_hostname';
SELECT 1/count(*) FROM pg_indexes WHERE indexname = 'comic_ix_updated_at';

SELECT has_table_privilege('lurker', 'cg.comic', 'select');
SELECT has_table_privilege('lurker', 'cg.comic', 'update');
SELECT has_table_privilege('lurker', 'cg.comic', 'insert');

ROLLBACK;
