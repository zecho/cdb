-- Deploy geek_table
-- requires: roles
-- requires: schema

BEGIN;

CREATE TABLE "1".geek (
id SERIAL PRIMARY KEY,
email TEXT NOT NULL,
secret TEXT DEFAULT NULL,
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP);

CREATE UNIQUE INDEX geek_uq_email ON "1".geek (email);
CREATE INDEX geek_ix_updated_at ON "1".geek (updated_at);

GRANT SELECT, UPDATE, INSERT ON "1".geek TO lurker;
GRANT SELECT, UPDATE, INSERT ON "1".geek TO api;

COMMIT;
