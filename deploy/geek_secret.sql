-- Deploy geek_secret
-- requires: roles
-- requires: schema
-- requires: geek_table

BEGIN;

CREATE FUNCTION cg.geek_secret(_geek_id INTEGER) RETURNS TEXT AS
$$
SELECT secret FROM cg.geek WHERE id = _geek_id; 
$$ LANGUAGE SQL
SECURITY DEFINER;

GRANT EXECUTE ON FUNCTION cg.geek_secret(INTEGER) TO maestro;

COMMIT;
