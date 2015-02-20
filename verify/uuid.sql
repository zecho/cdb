-- Verify uuid_extension

BEGIN;

SELECT 1/count(*) FROM pg_extension WHERE extname = 'uuid-ossp';
SELECT has_function_privilege('uuid_generate_v4()', 'execute');

ROLLBACK;
