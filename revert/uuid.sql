-- Revert uuid_extension

BEGIN;

DROP EXTENSION "uuid-ossp";

COMMIT;
