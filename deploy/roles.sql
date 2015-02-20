-- Deploy roles

BEGIN;

-- lurker is the web crawler's database user
CREATE ROLE lurker LOGIN UNENCRYPTED PASSWORD 'lurker' NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;

-- Group for sharing api access
CREATE ROLE api;

-- maestro is the main api that has access to the database
CREATE ROLE maestro LOGIN UNENCRYPTED PASSWORD 'maestro' NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;

GRANT api to maestro;

COMMIT;
