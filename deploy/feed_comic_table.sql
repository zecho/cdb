-- Deploy cdb:feed_comic_table to pg
-- requires: feed_table
-- requires: comic_table

BEGIN;

CREATE TABLE cg.feed_comic (
feed_id VARCHAR(24) NOT NULL REFERENCES cg.feed(id),
comic_id VARCHAR(24) NOT NULL REFERENCES cg.comic(id),
is_latest BOOLEAN NOT NULL DEFAULT false,
cron TEXT,
mark INT NOT NULL DEFAULT 1,
step INT NOT NULL DEFAULT 0,
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (feed_id, comic_id));

CREATE INDEX feed_comic_ix_updated_at ON cg.feed_comic (updated_at);

GRANT SELECT, UPDATE, INSERT ON cg.feed_comic TO mrcg;

COMMIT;
