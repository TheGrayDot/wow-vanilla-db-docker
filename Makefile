vmangos_build:
	@echo "Building vmangos..."
	@docker compose --file docker-compose_vmangos.yml up --build

vmangos_run:
	@echo "Running vmangos..."
	@docker compose --file docker-compose_vmangos.yml up

clean_vmangos:
	@echo "Cleaning vmangos..."
	@docker compose --file docker-compose_vmangos.yml down
	@docker image rm wow-classic-db-vmangos
	@docker image rm wow-classic-python-vmangos

cmangos_build:
	@echo "Building cmangos..."
	@docker compose --file docker-compose_cmangos.yml up --build

cmangos_run:
	@echo "Running cmangos..."
	@docker compose --file docker-compose_cmangos.yml up

clean_cmangos:
	@echo "Cleaning cmangos..."
	@docker compose --file docker-compose_cmangos.yml down
	@docker image rm wow-classic-db-cmangos
	@docker image rm wow-classic-python-cmangos

clean_volume:
	@echo "Cleaning volume..."
	@sudo rm -rf ./volumes/mysql
