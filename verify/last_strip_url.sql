-- Verify last_strip_url

BEGIN;

SELECT has_function_privilege('lurker', '"1".last_strip_url(TEXT)', 'execute');

ROLLBACK;
