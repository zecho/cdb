-- Deploy comic_geek_table
-- requires: roles
-- requires: uuid
-- requires: schema
-- requires: comic_table
-- requires: geek_table

BEGIN;

CREATE TABLE "1".comic_geek (
geek_id INTEGER NOT NULL REFERENCES "1".geek(id),
comic_id TEXT NOT NULL REFERENCES "1".comic(id),
is_viewed BOOLEAN DEFAULT FALSE,
is_liked BOOLEAN DEFAULT FALSE,
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (geek_id, comic_id));

CREATE INDEX comic_geek_ix_geek_id ON "1".comic_geek (geek_id);
CREATE INDEX comic_geek_ix_comic_id ON "1".comic_geek (comic_id);
CREATE INDEX comic_geek_ix_updated_at ON "1".comic_geek (updated_at);

COMMIT;
