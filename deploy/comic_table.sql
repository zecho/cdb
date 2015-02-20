-- Deploy comic_table
-- requires: roles
-- requires: uuid
-- requires: schema

BEGIN;

CREATE TABLE cg.comic (
id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
hostname VARCHAR(255) NOT NULL,
title VARCHAR(63) NOT NULL,
creator VARCHAR(63) NOT NULL,
headline_image_url VARCHAR(2083) NOT NULL,
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP);

CREATE UNIQUE INDEX comic_uq_hostname ON cg.comic (hostname);

CREATE INDEX comic_ix_updated_at ON cg.comic (updated_at);

GRANT SELECT ON cg.comic TO lurker;
GRANT UPDATE ON cg.comic TO lurker;
GRANT INSERT ON cg.comic TO lurker;

COMMIT;
