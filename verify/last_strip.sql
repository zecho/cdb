-- Verify last_strip

BEGIN;

SELECT has_function_privilege('lurker', 'cg.last_strip(TEXT)', 'execute');

ROLLBACK;
