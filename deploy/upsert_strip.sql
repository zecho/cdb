-- Deploy upsert_strip
-- requires: roles
-- requires: schema
-- requires: comic_table
-- requires: strip_table

BEGIN;

CREATE FUNCTION "1".upsert_strip(
	_comic_id TEXT,
    _checksum VARCHAR(32),
    _title TEXT,
    _number INTEGER,
    _url TEXT,
    _image_url TEXT,
    _thumbnail_image_url TEXT,
    _bonus_image_url TEXT,
    _alt_text TEXT)
RETURNS TEXT AS
$$
DECLARE _result TEXT;
BEGIN
    LOOP
        -- first try to update the key
        UPDATE "1".strip
        SET (comic_id, checksum, title, number, url, image_url, thumbnail_image_url, bonus_image_url, alt_text)
        = (_comic_id, _checksum, _title, _number, _url, _image_url, _thumbnail_image_url, _bonus_image_url, _alt_text)
        WHERE checksum = _checksum RETURNING id INTO _result;
        IF FOUND THEN
            RETURN _result;
        END IF;
        -- not there, so try to insert the key
        -- if someone else inserts the same key concurrently,
        -- we could get a unique-key failure
        BEGIN
            INSERT INTO "1".strip (comic_id, checksum, title, number, url, image_url, thumbnail_image_url, bonus_image_url, alt_text)
            VALUES (_comic_id, _checksum, _title, _number, _url, _image_url, _thumbnail_image_url, _bonus_image_url, _alt_text)
            RETURNING id INTO _result;
            RETURN _result;
        EXCEPTION WHEN unique_violation THEN
            -- do nothing, and loop to try the UPDATE again
        END;
    END LOOP;
END;
$$
LANGUAGE plpgsql
SECURITY DEFINER;

GRANT EXECUTE ON FUNCTION "1".upsert_strip(TEXT, VARCHAR(32), TEXT, INTEGER, TEXT, TEXT, TEXT, TEXT, TEXT) TO lurker;

COMMIT;
