-- Deploy star_comic
-- requires: roles
-- requires: schema
-- requires: comic_table
-- requires: geek_table
-- requires: comic_geek_table

BEGIN;

CREATE FUNCTION cg.star_comic(
    _geek_id INTEGER,
    _comic_id TEXT, 
    _is_starred BOOLEAN)
RETURNS VOID AS
$$
BEGIN
    LOOP
        -- first try to update the key
        UPDATE cg.comic_geek
        SET (comic_id, geek_id, is_starred)
        = (_comic_id, _geek_id, _is_starred)
        WHERE comic_id = _comic_id and geek_id = _geek_id;
        IF FOUND THEN
            RETURN;
        END IF;
        -- not there, so try to insert the key
        -- if someone else inserts the same key concurrently,
        -- we could get a unique-key failure
        BEGIN
            INSERT INTO cg.comic_geek (comic_id, geek_id, is_starred)
            VALUES (_comic_id, _geek_id, _is_starred);
        EXCEPTION WHEN unique_violation THEN
            -- do nothing, and loop to try the UPDATE again
        END;
    END LOOP;
END;
$$
LANGUAGE plpgsql
SECURITY DEFINER;

GRANT EXECUTE ON FUNCTION cg.star_comic(INTEGER, TEXT, BOOLEAN) TO maestro;

COMMIT;
