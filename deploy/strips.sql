-- Deploy strips
-- requires: roles
-- requires: schema
-- requires: strip_table
-- requires: geek_table
-- requires: strip_geek_table

BEGIN;

CREATE FUNCTION "1".strips(_geek_id INTEGER, _comic_id TEXT) RETURNS JSON AS
$$
SELECT array_to_json(array_agg(row_to_json(strip_select))) FROM (
	SELECT
		s.id AS id,
		s.comic_id AS comic_id,
		s.checksum AS checksum,
		s.title AS title,
		s.number AS number,
		s.url AS url,
		s.image_url AS image_url,
		s.thumbnail_image_url AS thumbnail_image_url,
		s.bonus_image_url AS bonus_image_url,
		s.alt_text AS alt_text,
		s.is_special AS is_special,
		COALESCE(sg.is_viewed, FALSE) AS is_viewed,
		COALESCE(sg.is_liked, FALSE) AS is_liked,
		s.created_at AS created_at,
		s.updated_at AS updated_at
	FROM "1".strip s LEFT JOIN "1".strip_geek sg ON s.id = sg.strip_id 
	WHERE s.comic_id = _comic_id AND (sg.geek_id = 1 OR sg.geek_id IS NULL)
	ORDER BY s.number ASC
) strip_select;
$$ LANGUAGE SQL
SECURITY DEFINER;

GRANT EXECUTE ON FUNCTION "1".strips(INTEGER, TEXT) TO maestro;

COMMIT;
