-- Deploy last_strip_url
-- requires: roles
-- requires: schema
-- requires: comic_table
-- requires: strip_table

BEGIN;

CREATE FUNCTION "1".last_strip_url(_comic_id TEXT) RETURNS TEXT AS 
$$
DECLARE _result TEXT;
BEGIN
	SELECT s.url FROM "1".strip s JOIN "1".comic c ON s.comic_id = c.id
	WHERE c.id = _comic_id ORDER BY s.number DESC 
	LIMIT 1 INTO _result;
	IF FOUND THEN
    RETURN _result;
  END IF;
	SELECT c.first_url FROM "1".comic c
	WHERE c.id = _comic_id INTO _result;
  RETURN _result;
END;
$$
LANGUAGE plpgsql
SECURITY DEFINER;

GRANT EXECUTE ON FUNCTION "1".last_strip_url(TEXT) TO lurker;

COMMIT;
