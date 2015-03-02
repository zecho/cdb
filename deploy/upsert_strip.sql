-- Deploy upsert_strip
-- requires: roles
-- requires: uuid
-- requires: schema
-- requires: comic_table
-- requires: strip_table

BEGIN;

CREATE OR REPLACE FUNCTION "1".upsert_strip(
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
DECLARE
    _result "1".strip%rowtype;
BEGIN
    LOOP
        -- first try to update the key
        UPDATE "1".strip
        SET (comic_id, title, number, url, image_url, thumbnail_image_url, bonus_image_url, alt_text)
        = (_comic_id, _title, _number, _url, _image_url, _thumbnail_image_url, _bonus_image_url, _alt_text)
        WHERE url = _url RETURNING * INTO _result;
        IF FOUND THEN
            RETURN _result;
        END IF;
        -- not there, so try to insert the key
        -- if someone else inserts the same key concurrently,
        -- we could get a unique-key failure
        BEGIN
            INSERT INTO "1".strip (comic_id, title, number, url, image_url, thumbnail_image_url, bonus_image_url, alt_text)
            VALUES (_comic_id, _title, _number, _url, _image_url, _thumbnail_image_url, _bonus_image_url, _alt_text)
            RETURNING * INTO _result;
            RETURN _result;
        EXCEPTION WHEN unique_violation THEN
            -- do nothing, and loop to try the UPDATE again
        END;
    END LOOP;
END;
$$ LANGUAGE plpgsql
SECURITY DEFINER;

-- Full strip with pre-generated id
CREATE OR REPLACE FUNCTION "1".upsert_strip(
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
DECLARE
    _result "1".strip%rowtype;
BEGIN
    LOOP
        -- first try to update the key
        UPDATE "1".strip
        SET (id, comic_id, title, number, url, image_url, thumbnail_image_url, bonus_image_url, alt_text)
        = (_id, _comic_id, _title, _number, _url, _image_url, _thumbnail_image_url, _bonus_image_url, _alt_text)
        WHERE url = _url RETURNING * INTO _result;
        IF FOUND THEN
            RETURN _result;
        END IF;
        -- not there, so try to insert the key
        -- if someone else inserts the same key concurrently,
        -- we could get a unique-key failure
        BEGIN
            INSERT INTO "1".strip (id, comic_id, title, number, url, image_url, thumbnail_image_url, bonus_image_url, alt_text)
            VALUES (_id, _comic_id, _title, _number, _url, _image_url, _thumbnail_image_url, _bonus_image_url, _alt_text)
            RETURNING * INTO _result;
            RETURN _result;
        EXCEPTION WHEN unique_violation THEN
            -- do nothing, and loop to try the UPDATE again
        END;
    END LOOP;
END;
$$ LANGUAGE plpgsql
SECURITY DEFINER;

GRANT EXECUTE ON FUNCTION "1".upsert_strip(UUID, VARCHAR, INTEGER, VARCHAR, VARCHAR, VARCHAR, VARCHAR, TEXT) TO lurker;
GRANT EXECUTE ON FUNCTION "1".upsert_strip(UUID, UUID, VARCHAR, INTEGER, VARCHAR, VARCHAR, VARCHAR, VARCHAR, TEXT) TO lurker;

COMMIT;
