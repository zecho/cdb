-- Deploy geek_secret
-- requires: roles
-- requires: schema
-- requires: geek_table

BEGIN;

CREATE FUNCTION "1".geek_secret(_geek_id INTEGER) RETURNS TEXT AS
$$
SELECT secret FROM "1".geek WHERE id = _geek_id; 
$$ LANGUAGE SQL
SECURITY DEFINER;

GRANT EXECUTE ON FUNCTION "1".geek_secret(INTEGER) TO maestro;

COMMIT;
