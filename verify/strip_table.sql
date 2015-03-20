-- Verify strip_table

BEGIN;

SELECT id,
	comic_id,
	checksum,
	title,
	number,
	url,
	image_url,
	thumbnail_image_url,
	alt_text,
	is_special,
	created_at,
	updated_at
 FROM "1".strip
 WHERE FALSE;

SELECT 1/count(*) FROM pg_indexes WHERE indexname = 'strip_uq_checksum';
SELECT 1/count(*) FROM pg_indexes WHERE indexname = 'strip_uq_comic_number';
SELECT 1/count(*) FROM pg_indexes WHERE indexname = 'strip_ix_updated_at';

ROLLBACK;
