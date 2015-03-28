-- Deploy strip_geek_table
-- requires: roles
-- requires: schema
-- requires: strip_table
-- requires: geek_table

BEGIN;

CREATE TABLE "1".strip_geek (
geek_id INTEGER NOT NULL REFERENCES "1".geek(id),
strip_id INTEGER NOT NULL REFERENCES "1".strip(id),
is_viewed BOOLEAN DEFAULT FALSE,
is_liked BOOLEAN DEFAULT FALSE,
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (geek_id, strip_id));

CREATE INDEX strip_geek_ix_geek_id ON "1".strip_geek (geek_id);
CREATE INDEX strip_geek_ix_strip_id ON "1".strip_geek (strip_id);
CREATE INDEX strip_geek_ix_updated_at ON "1".strip_geek (updated_at);

GRANT INSERT, UPDATE ON "1".strip_geek TO api;

COMMIT;
