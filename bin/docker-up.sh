# docker network create --subnet=192.168.35.0/24 docker;
# docker network create public
docker-compose -f ./.docker/docker-compose.yml --env-file ./.docker/.env up -d
