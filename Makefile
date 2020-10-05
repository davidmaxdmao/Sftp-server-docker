
MAIN_CONTAINER = sftp

# ======================
# Docker
# ======================

up:
	@docker-compose up -d

down:
	@docker-compose down

build:
	@docker-compose up -d --build

install: up
	@docker exec -it $(MAIN_CONTAINER) pip-compile --generate-hashes ./requirements/dev.in
	@docker exec -it $(MAIN_CONTAINER) pip-compile --generate-hashes ./requirements/prod.in
	@docker-compose up -d --build

bash: up
	@docker-compose exec sftp bash


