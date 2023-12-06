#!/bin/bash

# cmangos script to auto populate database on container start

export MYSQL_PWD="$MYSQL_PASSWORD"
MYSQL_CMD="mysql -u$MYSQL_USER -D $MYSQL_DATABASE"

echo "[+] Running init_cmangos.sh"

echo "[+] Inserting latest world DB..."
cd /opt/classic-db/Full_DB
$MYSQL_CMD < ClassicDB_1_12_1_z2815.sql

echo "[+] Inserting latest DB updates..."
cd /opt/classic-db/Updates
for sql_file in *.sql; do
    $MYSQL_CMD < "$sql_file"
done

echo "[+] Inserting latest DB migrations..."
cd /opt/mangos-classic/sql/updates/mangos
for sql_file in *.sql; do
    echo "[+] Inserting: $sql_file"
    $MYSQL_CMD < "$sql_file"
done
