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
    _image_parser JSON)
RETURNS VOID AS
$$
BEGIN
    LOOP
        -- first try to update the key
        UPDATE "1".comic
        SET (id, hostname, title, creator, banner_image, image_parser)
        = (_id, _hostname, _title, _creator, _banner_image, _image_parser)
        WHERE id = _id;
        IF FOUND THEN
            RETURN;
        END IF;
        -- not there, so try to insert the key
        -- if someone else inserts the same key concurrently,
        -- we could get a unique-key failure
        BEGIN
            INSERT INTO "1".comic (id, hostname, title, creator, banner_image, image_parser)
            VALUES (_id, _hostname, _title, _creator, _banner_image, _image_parser);
            RETURN;
        EXCEPTION WHEN unique_violation THEN
            -- do nothing, and loop to try the UPDATE again
        END;
    END LOOP;
END;
$$
LANGUAGE plpgsql
SECURITY DEFINER;

GRANT EXECUTE ON FUNCTION "1".upsert_comic(TEXT, TEXT, TEXT, TEXT, TEXT, JSON) TO lurker;

COMMIT;
