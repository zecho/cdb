-- Deploy upsert_geek
-- requires: roles
-- requires: schema
-- requires: geek_table

BEGIN;

CREATE FUNCTION "1".upsert_geek(
	_email TEXT,
	_secret TEXT)
RETURNS TEXT AS
$$
DECLARE _result TEXT;
BEGIN
    LOOP
        -- first try to update the key
        UPDATE "1".geek
        SET (email, secret)
        = (_email, _secret)
        WHERE email = _email RETURNING id INTO _result;
        IF FOUND THEN
            RETURN _result;
        END IF;
        -- not there, so try to insert the key
        -- if someone else inserts the same key concurrently,
        -- we could get a unique-key failure
        BEGIN
            INSERT INTO "1".geek (email, secret)
            VALUES (_email, _secret)
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

GRANT EXECUTE ON FUNCTION "1".upsert_geek(TEXT, TEXT) TO maestro;

COMMIT;