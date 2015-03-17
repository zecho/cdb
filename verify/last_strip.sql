-- Verify last_strip

BEGIN;

SELECT has_function_privilege('lurker', '"1".last_strip(TEXT)', 'execute');

ROLLBACK;
