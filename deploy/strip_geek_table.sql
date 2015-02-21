-- Deploy strip_geek_table
-- requires: roles
-- requires: uuid
-- requires: schema
-- requires: strip_table
-- requires: geek_table

BEGIN;

CREATE TABLE cg.strip_geek (
geek_id UUID NOT NULL REFERENCES cg.geek(id),
strip_id UUID NOT NULL REFERENCES cg.strip(id),
is_viewed BOOLEAN DEFAULT FALSE,
is_starred BOOLEAN DEFAULT FALSE,
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (geek_id, strip_id));

CREATE INDEX strip_geek_ix_geek_id ON cg.strip_geek (geek_id);
CREATE INDEX strip_geek_ix_strip_id ON cg.strip_geek (strip_id);
CREATE INDEX strip_geek_ix_updated_at ON cg.strip_geek (updated_at);

COMMIT;
