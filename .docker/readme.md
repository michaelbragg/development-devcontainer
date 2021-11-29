# Docker for Development Container

## Dependencies

- Docker
- DNS Masq

## Setup:

- `.docker/.env` – Enter project details here.
- Create your domain in your host file, pointing to `127.0.0.1`

## Start docker

`docker compose -f ./.docker/docker-compose.yml --env-file ./.docker/.env up -d`

## Stop docker

`docker compose -f ./.docker/docker-compose.yml --env-file ./.docker/.env down  -v --remove-orphans`
