-- Verify comic_table

BEGIN;

SELECT id,
	   hostname, 
	   title, 
	   creator,
	   is_advertised,
       patreon_url,
       store_url,
	   banner_image, 
	   first_url,
 	   created_at,
 	   updated_at
 FROM cg.comic
 WHERE FALSE;

SELECT 1/count(*) FROM pg_indexes WHERE indexname = 'comic_ix_updated_at';

SELECT has_table_privilege('mrcg', 'cg.comic', 'select');
SELECT has_table_privilege('mrcg', 'cg.comic', 'update');
SELECT has_table_privilege('mrcg', 'cg.comic', 'insert');

ROLLBACK;
