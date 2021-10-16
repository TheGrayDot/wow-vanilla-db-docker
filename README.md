# wow-classic-db-docker

A simple Docker Compose environment for spinning up a WoW Classic (Vanilla) MySQL database.

## Requirements

- Docker
- Docker Compose

## Why Use This Project?

I mainly developed this project as I like to mess with the WoW Classic database - extracting information about items and learning about the inner workings. It is not really suitable for a production server build, but some tweaks could be made to improve performance and make data persistent using volumes.

## Quickstart

- Change credentials in the `.env` file is desired
- Change `Dockerfile` option in `docker-compose.yml` to `Dockerfile-cmangos` or `Dockerfile-vmangos`
- Start containers using `docker-compose up --build`

## Database Sources

There are a bunch of WoW Classic database options available. This projects supports [Continued MaNGOS](https://github.com/cmangos) as it is reliable and robust, and [Vanilla MaNGOS](https://github.com/vmangos) as it has built in support for Vannila patch progression.

## VMaNGOS

The VMaNGOS configuration is simple, as it is comprised of a simple database dump in an `.sql` file. The database code is available [on brotalnia's `database` GitHub repository](https://github.com/brotalnia/database). There are a bunch of dated `.sql` files, which are based on the databases from the Lights Hope server project.

### Set Correct Dockerfile

In the `docker-compose.yml` file, set the `Dockerfile` to the VMaNGOS version, named `Dockerfile-vmangos`.

```none
dockerfile: Dockerfile-vmangos
```

### Automatically Insert Database Contents

If you want the container to automatically insert the database when started, uncommnet out the following line in the `Dockerfile-vmangos` file.

```none
# Copy SQL dump to docker entrypoint to auto insert data
# Comment out if you don't want to auto populate
RUN cp world_full_14_june_2021.sql /docker-entrypoint-initdb.d/world_full_14_june_2021.sql
```

### Manually Insert Database Contents

If you want to manually insert the data, just enter the Docker container and run a specific `mysql` command.

```none
docker exec -it wow-classic-db /bin/bash
mysql -umangos -pmangos -D classicmangos < world_full_14_june_2021.sql
```

## CMaNGOS

The CMaNGOS configuration is a little more complex, as it uses a custom script to insert data from a selection of `.sql` files. The database code is available [on cmangos's ` classic-db` GitHub repository](https://github.com/cmangos/classic-db).

### Set Correct Dockerfile

In the `docker-compose.yml` file, set the `Dockerfile` to the VMaNGOS version, named `Dockerfile-cmangos`.

```none
dockerfile: Dockerfile-cmangos
```

### Automatically Insert Database Contents

If you want the container to automatically insert the database when started, uncommnet out the following line in the `Dockerfile-cmangos` file.

```none
# Copy autopopulate script to docker entrypoint to auto insert data
# Comment out if you don't want to auto populate
COPY ./init.sh /docker-entrypoint-initdb.d/init.sh
```

### Manually Insert Database Contents

If you want to manually insert the data, just enter the Docker container and run a specific `mysql` command.

```none
docker exec -it wow-classic-db /bin/bash
./InsertFullDB.sh
```
