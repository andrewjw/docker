#!/bin/bash

set -e

source /volume1/homes/andrew/docker/secrets/postgres
source /volume1/homes/andrew/docker/secrets/teslamate

docker stop teslamate
docker stop teslamateagile

docker exec postgres psql -U $POSTGRES_USER << .
create database teslamate;
create user teslamate with encrypted password '$DATABASE_PASS';
grant all privileges on database teslamate to teslamate;
ALTER USER teslamate WITH SUPERUSER;
.

echo $1
zcat $1 | docker exec -i postgres psql -U $DATABASE_USER $DATABASE_NAME
echo $?

docker start teslamate
docker start teslamateagile
