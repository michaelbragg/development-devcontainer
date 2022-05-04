#!/bin/bash

# Create new network if not pre-existing.
if [ ! "$(docker network ls | grep public)" ]; then
  docker network create public
fi

docker compose -f ./.docker/docker-compose.yml --env-file ./.docker/.env up -d
