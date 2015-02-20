-- Revert update_comic

BEGIN;

DROP FUNCTION cg.update_comic(UUID, VARCHAR, VARCHAR, VARCHAR, VARCHAR);

COMMIT;
