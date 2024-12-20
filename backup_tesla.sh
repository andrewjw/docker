#!/bin/bash

set -e

source /volume1/homes/andrew/docker/secrets/teslamate

docker exec postgres pg_dump -U $DATABASE_USER $DATABASE_NAME > /volume1/backups/teslamate_backup.sql

gzip -f /volume1/backups/teslamate_backup.sql

chmod a+r /volume1/backups/teslamate_backup.sql.gz
