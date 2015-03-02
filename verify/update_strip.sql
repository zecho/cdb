-- Verify update_strip

BEGIN;

SELECT has_function_privilege('lurker', '"1".update_strip(UUID, UUID, VARCHAR, INTEGER, VARCHAR, VARCHAR, VARCHAR, VARCHAR, TEXT)', 'execute');

ROLLBACK;
