-- Revert update_strip

BEGIN;

DROP FUNCTION "1".update_strip(UUID, UUID, VARCHAR, INTEGER, VARCHAR, VARCHAR, VARCHAR, VARCHAR, TEXT);

COMMIT;
