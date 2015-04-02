-- Deploy star_strip
-- requires: roles
-- requires: schema
-- requires: strip_table
-- requires: geek_table
-- requires: strip_geek_table

BEGIN;

CREATE FUNCTION "1".star_strip(
    _geek_id INTEGER,
    _strip_id INTEGER,
    _is_starred BOOLEAN)
RETURNS VOID AS
$$
BEGIN
    LOOP
        -- first try to update the key
        UPDATE "1".strip_geek
        SET (strip_id, geek_id, is_starred)
        = (_strip_id, _geek_id, _is_starred)
        WHERE strip_id = _strip_id and geek_id = _geek_id;
        IF FOUND THEN
            RETURN;
        END IF;
        -- not there, so try to insert the key
        -- if someone else inserts the same key concurrently,
        -- we could get a unique-key failure
        BEGIN
            INSERT INTO "1".strip_geek (strip_id, geek_id, is_starred)
            VALUES (_strip_id, _geek_id, _is_starred);
        EXCEPTION WHEN unique_violation THEN
            -- do nothing, and loop to try the UPDATE again
        END;
    END LOOP;
END;
$$
LANGUAGE plpgsql
SECURITY DEFINER;

GRANT EXECUTE ON FUNCTION "1".star_strip(INTEGER, INTEGER, BOOLEAN) TO maestro;

COMMIT;
