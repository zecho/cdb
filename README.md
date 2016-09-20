http://sqitch.org/
```docker build -t comicgator/cdb:0.5 .```
```docker run --name cdb-dev -p 5432:5432 -e "POSTGRES_USER=mrcg" -e "POSTGRES_PASSWORD=mrcg" -e "POSTGRES_DB=cdb" -e "PGDATA=/var/lib/postgresql/data" postgres:9.5```
