-- Deploy geek_table
-- requires: roles
-- requires: schema
-- requires: uuid

BEGIN;

CREATE TABLE "1".geek (
id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
email VARCHAR(63) NOT NULL,
secret TEXT DEFAULT NULL,
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP);

CREATE UNIQUE INDEX geek_uq_email ON "1".geek (email);
CREATE INDEX geek_ix_updated_at ON "1".geek (updated_at);

GRANT SELECT ON "1".geek TO lurker;
GRANT UPDATE ON "1".geek TO lurker;
GRANT INSERT ON "1".geek TO lurker;

COMMIT;
