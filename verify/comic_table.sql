-- Verify comic_table

BEGIN;

SELECT id,
	   hostname, 
	   title, 
	   creator, 
	   banner_image, 
 	   -- start_url, 
 	   -- next_parser, 
 	   image_parser, 
 	   -- title_parser,
 	   -- bonus_image_parser,
 	   -- alt_text_parser,
 	   created_at,
 	   updated_at
 FROM "1".comic
 WHERE FALSE;

SELECT 1/count(*) FROM pg_indexes WHERE indexname = 'comic_ix_updated_at';

SELECT has_table_privilege('lurker', '"1".comic', 'select');
SELECT has_table_privilege('lurker', '"1".comic', 'update');
SELECT has_table_privilege('lurker', '"1".comic', 'insert');

ROLLBACK;
