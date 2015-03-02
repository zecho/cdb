-- Deploy comic_table
-- requires: roles
-- requires: uuid
-- requires: schema

BEGIN;

CREATE TABLE "1".comic (
id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
hostname VARCHAR(255) NOT NULL,
title VARCHAR(63) NOT NULL,
creator VARCHAR(63) NOT NULL,
headline_image_url VARCHAR(2083) NOT NULL,
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP);

CREATE UNIQUE INDEX comic_uq_hostname ON "1".comic (hostname);

CREATE INDEX comic_ix_updated_at ON "1".comic (updated_at);

GRANT SELECT ON "1".comic TO lurker;
GRANT UPDATE ON "1".comic TO lurker;
GRANT INSERT ON "1".comic TO lurker;

COMMIT;
