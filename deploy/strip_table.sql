-- Deploy strip_table
-- requires: roles
-- requires: uuid
-- requires: schema
-- requires: comic_table

BEGIN;

CREATE TABLE cg.strip (
id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
comic_id UUID NOT NULL REFERENCES cg.comic(id),
title VARCHAR(63) DEFAULT NULL,
number INTEGER DEFAULT NULL,
url VARCHAR(2083) NOT NULL,
image_url VARCHAR(2083) NOT NULL,
thumbnail_image_url VARCHAR(2083) NOT NULL,
bonus_image_url VARCHAR(2083) DEFAULT NULL,
alt_text TEXT DEFAULT NULL,
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP);

CREATE UNIQUE INDEX strip_uq_url ON cg.strip (url);
CREATE UNIQUE INDEX strip_uq_comic_number ON cg.strip (comic_id, number);
CREATE INDEX strip_ix_updated_at ON cg.strip (updated_at);

GRANT SELECT ON cg.strip TO lurker;
GRANT UPDATE ON cg.strip TO lurker;
GRANT INSERT ON cg.strip TO lurker;

COMMIT;
