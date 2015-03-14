-- Deploy comic_table
-- requires: roles
-- requires: schema

BEGIN;

CREATE TABLE "1".comic (
id TEXT PRIMARY KEY, -- ID is predetermined in configuration file
hostname TEXT NOT NULL,
title TEXT NOT NULL,
creator TEXT NOT NULL,
banner_image TEXT NOT NULL,
-- start_url TEXT NOT NULL,
-- next_parser JSON NOT NULL,
image_parser JSON NOT NULL,
-- title_parser JSON DEFAULT '{}'::JSON,
-- bonus_image_parser JSON DEFAULT '{}'::JSON,
-- alt_text_parser JSON DEFAULT '{}'::JSON,
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP);

CREATE INDEX comic_ix_updated_at ON "1".comic (updated_at);

COMMIT;
