-- Deploy roles

BEGIN;

-- c11z is god
CREATE ROLE c11z SUPERUSER LOGIN PASSWORD 'c11z';
-- retroactively grant usage to schema postgrest to c11z
GRANT USAGE ON SCHEMA postgrest TO c11z;

-- anon is useless
CREATE ROLE anon NOLOGIN;

-- lurker is the web crawler's database user
CREATE ROLE lurker LOGIN UNENCRYPTED PASSWORD 'lurker' NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;

-- Group for sharing api access
CREATE ROLE api;

-- maestro is the main api that has access to the database
CREATE ROLE maestro LOGIN UNENCRYPTED PASSWORD 'maestro' NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;

GRANT api to maestro;

COMMIT;
