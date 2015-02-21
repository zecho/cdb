-- Deploy update_timestamp_trigger
-- requires: comic_table
-- requires: geek_table
-- requires: strip_table
-- requires: comic_geek_table
-- requires: strip_geek_table

BEGIN;

CREATE OR REPLACE FUNCTION cg.update_timestamp()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER comic_tg_update_timestamp BEFORE UPDATE ON cg.comic
FOR EACH ROW EXECUTE PROCEDURE cg.update_timestamp();

CREATE TRIGGER geek_tg_update_timestamp BEFORE UPDATE ON cg.geek 
FOR EACH ROW EXECUTE PROCEDURE cg.update_timestamp();

CREATE TRIGGER strip_tg_update_timestamp BEFORE UPDATE ON cg.strip
FOR EACH ROW EXECUTE PROCEDURE cg.update_timestamp();

CREATE TRIGGER comic_geek_tg_update_timestamp BEFORE UPDATE ON cg.comic_geek
FOR EACH ROW EXECUTE PROCEDURE cg.update_timestamp();

CREATE TRIGGER strip_geek_tg_update_timestamp BEFORE UPDATE ON cg.strip_geek
FOR EACH ROW EXECUTE PROCEDURE cg.update_timestamp();

COMMIT;
