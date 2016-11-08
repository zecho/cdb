-- Deploy cdb:feed_strip_table to pg
-- requires: feed_table
-- requires: strip_table

BEGIN;

CREATE TABLE cg.feed_strip (
feed_id VARCHAR(24) NOT NULL REFERENCES cg.feed(id),
strip_id VARCHAR(24) NOT NULL REFERENCES cg.strip(id),
published_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (feed_id, strip_id));

CREATE INDEX feed_strip_ix_published_at ON cg.feed_strip (published_at);

GRANT SELECT, UPDATE, INSERT ON cg.feed_strip TO mrcg;

COMMIT;
