-- Deploy upsert_comic
-- requires: roles
-- requires: schema
-- requires: comic_table

BEGIN;

CREATE FUNCTION "1".upsert_comic(
	_id TEXT,
    _hostname TEXT,
    _title TEXT,
    _creator TEXT,
    _banner_image TEXT,
    _first_url TEXT,
    _image_parser JSON)
RETURNS TEXT AS
$$
DECLARE _result TEXT;
BEGIN
    LOOP
        -- first try to update the key
        UPDATE "1".comic
        SET (id, hostname, title, creator, banner_image, first_url, image_parser)
        = (_id, _hostname, _title, _creator, _banner_image, _first_url, _image_parser)
        WHERE id = _id RETURNING id INTO _result;
        IF FOUND THEN
            RETURN _result;
        END IF;
        -- not there, so try to insert the key
        -- if someone else inserts the same key concurrently,
        -- we could get a unique-key failure
        BEGIN
            INSERT INTO "1".comic (id, hostname, title, creator, banner_image, first_url, image_parser)
            VALUES (_id, _hostname, _title, _creator, _banner_image, _first_url, _image_parser)
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

GRANT EXECUTE ON FUNCTION "1".upsert_comic(TEXT, TEXT, TEXT, TEXT, TEXT, TEXT, JSON) TO lurker;

COMMIT;
