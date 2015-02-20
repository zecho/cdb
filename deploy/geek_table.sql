-- Deploy geek_table
-- requires: roles
-- requires: schema
-- requires: uuid

BEGIN;

CREATE TABLE cg.geek (
id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
email VARCHAR(63) NOT NULL,
secret TEXT DEFAULT NULL,
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP);

CREATE UNIQUE INDEX geek_uq_email ON cg.geek (email);
CREATE INDEX geek_ix_updated_at ON cg.geek (updated_at);

GRANT SELECT ON cg.geek TO lurker;
GRANT UPDATE ON cg.geek TO lurker;
GRANT INSERT ON cg.geek TO lurker;

COMMIT;
