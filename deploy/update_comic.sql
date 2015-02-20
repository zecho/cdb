-- Deploy update_comic
-- requires: schema
-- requires: uuid
-- requires: roles
-- requires: comic_table

BEGIN;

CREATE OR REPLACE FUNCTION cg.update_comic(
    _id UUID,
    _hostname VARCHAR(255),
    _title VARCHAR(63),
    _creator VARCHAR(63),
    _headline_image_url VARCHAR(2083))
RETURNS cg.comic
AS $$
UPDATE cg.comic 
SET (hostname, title, creator, headline_image_url) 
    = (_hostname, _title, _creator, _headline_image_url)
WHERE id = _id
AND hostname = _hostname RETURNING *;
$$ LANGUAGE SQL
SECURITY DEFINER;

GRANT EXECUTE ON FUNCTION cg.update_comic(UUID, VARCHAR, VARCHAR, VARCHAR, VARCHAR) TO lurker;

COMMIT;
