#!/usr/bin/env bash

# Provisioning script for maestro
# because ansible is too fucking complicated

echo "Provisioning..."
sudo apt-get -y update
sudo apt-get install -y git

echo "Installing cpanminus for sqitch"
sudo apt-get install -y build-essential cpanminus perl perl-doc

echo "Installing sqitch"
sudo cpanm --quiet --notest App::Sqitch

echo "Installing postgresql"
# postgres
sudo apt-get install -y postgresql postgresql-contrib libdbd-pg-perl

POSTGRE_VERSION=9.3

# listen for localhost connections
sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" /etc/postgresql/$POSTGRE_VERSION/main/postgresql.conf

# identify users via "md5", rather than "ident", allowing us to make postgres
# users separate from system users. "md5" lets us simply use a password
echo "host    all             all             0.0.0.0/0               md5" | sudo tee -a /etc/postgresql/$POSTGRE_VERSION/main/pg_hba.conf
sudo service postgresql start

# Create postgres user for vagrant account
sudo -u postgres createuser -e -s -w vagrant

# Create database
createdb cdb

sudo service postgresql restart

echo "Configure Sqitch"
sqitch config --user engine.pg.client /usr/bin/psql
sqitch config --user user.name 'Mr ComicGator'
sqitch config --user user.email 'mr@comicgator.com'
sqitch config --bool deploy.verify true
sqitch config --bool rebase.verify true

# Save some typing by naming the database uri
sqitch target add cdb db:pg:cdb
# And make the pg engine automattically point to comicdb
sqitch engine add pg cdb

cd /vagrant
sqitch deploy --verify

echo "Good Hunting"