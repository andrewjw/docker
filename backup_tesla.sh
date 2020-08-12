#!/bin/bash

source /volume1/homes/andrew/docker/secrets/teslamate

docker exec postgres pg_dump -U $DATABASE_USER $DATABASE_NAME > /volume1/backups/teslamate_backup.sql

zip /volume1/backups/teslamate_backup.zip /volume1/backups/teslamate_backup.sql

rm /volume1/backups/teslamate_backup.sql
