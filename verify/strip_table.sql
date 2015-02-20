-- Verify strip_table

BEGIN;

SELECT id, 
	comic_id,
	title,
	number,
	url,
	image_url,
	thumbnail_image_url,
	alt_text,
	created_at,
	updated_at
 FROM cg.strip
 WHERE FALSE;

SELECT 1/count(*) FROM pg_indexes WHERE indexname = 'strip_uq_url';
SELECT 1/count(*) FROM pg_indexes WHERE indexname = 'strip_uq_comic_number';
SELECT 1/count(*) FROM pg_indexes WHERE indexname = 'strip_ix_updated_at';

SELECT has_table_privilege('lurker', 'cg.strip', 'select');
SELECT has_table_privilege('lurker', 'cg.strip', 'update');
SELECT has_table_privilege('lurker', 'cg.strip', 'insert');

ROLLBACK;
