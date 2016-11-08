-- Verify cdb:feed_strip_table on pg

BEGIN;

SELECT feed_id,
	   strip_id,
       published_at
 FROM cg.feed_strip
 WHERE FALSE;

SELECT 1/count(*) FROM pg_indexes WHERE indexname = 'feed_strip_ix_published_at';

SELECT has_table_privilege('mrcg', 'cg.feed_strip', 'select');
SELECT has_table_privilege('mrcg', 'cg.feed_strip', 'update');
SELECT has_table_privilege('mrcg', 'cg.feed_strip', 'insert');

ROLLBACK;
