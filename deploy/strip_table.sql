-- Deploy strip_table
-- requires: roles
-- requires: schema
-- requires: comic_table

BEGIN;

CREATE TABLE "1".strip (
id SERIAL PRIMARY KEY,
comic_id TEXT NOT NULL REFERENCES "1".comic(id),
checksum VARCHAR(32) NOT NULL,
title TEXT DEFAULT NULL,
number INTEGER DEFAULT NULL,
url TEXT NOT NULL,
image_url TEXT NOT NULL,
thumbnail_image_url TEXT NOT NULL,
bonus_image_url TEXT DEFAULT NULL,
alt_text TEXT DEFAULT NULL,
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP);

CREATE UNIQUE INDEX strip_uq_checksum ON "1".strip (checksum);
CREATE UNIQUE INDEX strip_uq_comic_number ON "1".strip (comic_id, number);
CREATE INDEX strip_ix_updated_at ON "1".strip (updated_at);

GRANT SELECT, UPDATE, INSERT ON "1".strip TO lurker;

COMMIT;
