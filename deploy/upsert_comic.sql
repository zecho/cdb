-- Deploy upsert_comic
-- requires: schema
-- requires: uuid
-- requires: roles
-- requires: comic_table

BEGIN;

CREATE OR REPLACE FUNCTION cg.upsert_comic(
    _hostname VARCHAR(255),
    _title VARCHAR(63),
    _creator VARCHAR(63),
    _headline_image_url VARCHAR(2083))
RETURNS cg.comic
AS $$
DECLARE
    _result cg.comic%rowtype;
BEGIN
    LOOP
        -- first try to update the key
        UPDATE cg.comic
        SET (hostname, title, creator, headline_image_url) 
        = (_hostname, _title, _creator, _headline_image_url)
        WHERE hostname = _hostname RETURNING * INTO _result; 
        IF FOUND THEN
            RETURN _result;
        END IF;
        -- not there, so try to insert the key
        -- if someone else inserts the same key concurrently,
        -- we could get a unique-key failure
        BEGIN
            INSERT INTO cg.comic (hostname, title, creator, headline_image_url) 
            VALUES (_hostname, _title, _creator, _headline_image_url) RETURNING * INTO _result;
            RETURN _result;
        EXCEPTION WHEN unique_violation THEN
            -- do nothing, and loop to try the UPDATE again
        END;
    END LOOP;
END;
$$ LANGUAGE plpgsql
SECURITY DEFINER;

CREATE OR REPLACE FUNCTION cg.upsert_comic(
    _id UUID,
    _hostname VARCHAR(255),
    _title VARCHAR(63),
    _creator VARCHAR(63),
    _headline_image_url VARCHAR(2083))
RETURNS cg.comic
AS $$
DECLARE
    _result cg.comic%rowtype;
BEGIN
    LOOP
        -- first try to update the key
        UPDATE cg.comic
        SET (id, hostname, title, creator, headline_image_url) 
        = (_id, _hostname, _title, _creator, _headline_image_url)
        WHERE hostname = _hostname RETURNING * INTO _result; 
        IF FOUND THEN
            RETURN _result;
        END IF;
        -- not there, so try to insert the key
        -- if someone else inserts the same key concurrently,
        -- we could get a unique-key failure
        BEGIN
            INSERT INTO cg.comic (id, hostname, title, creator, headline_image_url) 
            VALUES (_id, _hostname, _title, _creator, _headline_image_url) RETURNING * INTO _result;
            RETURN _result;
        EXCEPTION WHEN unique_violation THEN
            -- do nothing, and loop to try the UPDATE again
        END;
    END LOOP;
END;
$$ LANGUAGE plpgsql
SECURITY DEFINER;

GRANT EXECUTE ON FUNCTION cg.upsert_comic(UUID, VARCHAR, VARCHAR, VARCHAR, VARCHAR) TO lurker;
GRANT EXECUTE ON FUNCTION cg.upsert_comic(VARCHAR, VARCHAR, VARCHAR, VARCHAR) TO lurker;

COMMIT;
