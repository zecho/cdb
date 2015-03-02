-- Revert update_comic

BEGIN;

DROP FUNCTION "1".update_comic(UUID, VARCHAR, VARCHAR, VARCHAR, VARCHAR);

COMMIT;
