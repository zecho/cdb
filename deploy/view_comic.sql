-- Deploy view_comic
-- requires: roles
-- requires: schema
-- requires: comic_table
-- requires: geek_table
-- requires: comic_geek_table

BEGIN;

CREATE FUNCTION "1".view_comic(
	_comic_id TEXT, 
	_geek_id INTEGER,
	_is_viewed BOOLEAN)
RETURNS VOID AS
$$
BEGIN
	LOOP
		-- first try to update the key
		UPDATE "1".comic_geek
		SET (comic_id, geek_id, is_viewed)
		= (_comic_id, _geek_id, _is_viewed)
		WHERE comic_id = _comic_id and geek_id = _geek_id;
		IF FOUND THEN
			RETURN;
		END IF;
		-- not there, so try to insert the key
		-- if someone else inserts the same key concurrently,
		-- we could get a unique-key failure
		BEGIN
			INSERT INTO "1".comic_geek (comic_id, geek_id, is_viewed)
			VALUES (_comic_id, _geek_id, _is_viewed);
		EXCEPTION WHEN unique_violation THEN
			-- do nothing, and loop to try the UPDATE again
		END;
	END LOOP;
END;
$$
LANGUAGE plpgsql
SECURITY DEFINER;

GRANT EXECUTE ON FUNCTION "1".view_comic(TEXT, INTEGER, BOOLEAN) TO maestro;

COMMIT;
