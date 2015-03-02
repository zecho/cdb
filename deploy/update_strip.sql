-- Deploy update_strip
-- requires: roles
-- requires: uuid
-- requires: schema
-- requires: comic_table
-- requires: strip_table

BEGIN;

CREATE OR REPLACE FUNCTION "1".update_strip(
    _id UUID,
    _comic_id UUID,
    _title VARCHAR(63),
    _number INTEGER,
    _url VARCHAR(2083),
    _image_url VARCHAR(2083),
    _thumbnail_image_url VARCHAR(2083),
    _bonus_image_url VARCHAR(2083),
    _alt_text TEXT
)
RETURNS "1".strip
AS $$
UPDATE "1".strip
SET (comic_id, title, number, url, image_url, thumbnail_image_url, bonus_image_url, alt_text)
    = (_comic_id, _title, _number, _url, _image_url, _thumbnail_image_url, _bonus_image_url, _alt_text)
WHERE id = _id
AND url = _url RETURNING *;
$$ LANGUAGE SQL
SECURITY DEFINER;

GRANT EXECUTE ON FUNCTION "1".update_strip(UUID, UUID, VARCHAR, INTEGER, VARCHAR, VARCHAR, VARCHAR, VARCHAR, TEXT) TO lurker;

COMMIT;
