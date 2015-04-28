-- Deploy geek_table
-- requires: roles
-- requires: schema

BEGIN;

CREATE TABLE cg.geek (
id SERIAL PRIMARY KEY,
email TEXT NOT NULL,
secret TEXT DEFAULT NULL,
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP);

CREATE UNIQUE INDEX geek_uq_email ON cg.geek (email);
CREATE INDEX geek_ix_updated_at ON cg.geek (updated_at);

GRANT SELECT, UPDATE, INSERT ON cg.geek TO lurker;
GRANT SELECT, UPDATE, INSERT ON cg.geek TO maestro;

COMMIT;
