#!/bin/bash

# vmangos script to auto populate database on container start

export MYSQL_PWD="$MYSQL_PASSWORD"
MYSQL_CMD="mysql -u$MYSQL_USER -D $MYSQL_DATABASE"

echo "[+] Running init_vmangos.sh"

echo "[+] Inserting latest world DB..."
cd /opt
$MYSQL_CMD < world_full_14_june_2021.sql

echo "[+] Inserting latest DB migrations..."
cd /opt/core/sql/migrations
for sql_file in *world.sql; do
    $MYSQL_CMD < $sql_file
done
