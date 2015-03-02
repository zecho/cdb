-- Deploy strip_table
-- requires: roles
-- requires: uuid
-- requires: schema
-- requires: comic_table

BEGIN;

CREATE TABLE "1".strip (
id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
comic_id UUID NOT NULL REFERENCES "1".comic(id),
title VARCHAR(63) DEFAULT NULL,
number INTEGER DEFAULT NULL,
url VARCHAR(2083) NOT NULL,
image_url VARCHAR(2083) NOT NULL,
thumbnail_image_url VARCHAR(2083) NOT NULL,
bonus_image_url VARCHAR(2083) DEFAULT NULL,
alt_text TEXT DEFAULT NULL,
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP);

CREATE UNIQUE INDEX strip_uq_url ON "1".strip (url);
CREATE UNIQUE INDEX strip_uq_comic_number ON "1".strip (comic_id, number);
CREATE INDEX strip_ix_updated_at ON "1".strip (updated_at);

GRANT SELECT ON "1".strip TO lurker;
GRANT UPDATE ON "1".strip TO lurker;
GRANT INSERT ON "1".strip TO lurker;

COMMIT;
