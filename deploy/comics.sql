-- Deploy comics
-- requires: roles
-- requires: schema
-- requires: comic_table
-- requires: geek_table
-- requires: comic_geek_table

BEGIN;

CREATE FUNCTION cg.comics(_geek_id INTEGER) RETURNS JSON AS
$$
SELECT array_to_json(array_agg(row_to_json(comic_select))) FROM (
	SELECT
		c.id AS id,
		c.hostname AS hostname,
		c.title AS title,
		c.creator AS creator,
		c.banner_image AS banner_image,
		c.image_parser AS image_parser,
		COALESCE(cg.is_viewed, FALSE) AS is_viewed,
		COALESCE(cg.is_starred, FALSE) AS is_starred,
		c.created_at AS created_at,
		c.updated_at AS updated_at
	FROM cg.comic c LEFT JOIN cg.comic_geek cg ON c.id = cg.comic_id
	WHERE cg.geek_id = 1 OR cg.geek_id IS NULL
	ORDER BY c.id ASC
) comic_select;
$$ LANGUAGE SQL
SECURITY DEFINER;

GRANT EXECUTE ON FUNCTION cg.comics(INTEGER) TO maestro;

COMMIT;
