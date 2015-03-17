-- Deploy last_strip
-- requires: roles
-- requires: schema
-- requires: comic_table
-- requires: strip_table

-- Usage:
-- SELECT * FROM last_strip('comicid') AS (url TEXT, count INTEGER)

BEGIN;

CREATE FUNCTION "1".last_strip(_comic_id TEXT) RETURNS RECORD AS 
$$
DECLARE _result RECORD;
BEGIN
	SELECT s.url, s.number FROM "1".strip s JOIN "1".comic c ON s.comic_id = c.id
	WHERE c.id = _comic_id ORDER BY s.number DESC 
	LIMIT 1 INTO _result;
	IF FOUND THEN
    RETURN _result;
  END IF;
	SELECT c.first_url, 1 FROM "1".comic c
	WHERE c.id = _comic_id INTO _result;
  RETURN _result;
END;
$$
LANGUAGE plpgsql
SECURITY DEFINER;

GRANT EXECUTE ON FUNCTION "1".last_strip(TEXT) TO lurker;

COMMIT;