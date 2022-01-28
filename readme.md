# Development DevContainer

![GitHub repo size](https://img.shields.io/github/repo-size/michaelbragg/development-devcontainer)
![GitHub last commit](https://img.shields.io/github/last-commit/michaelbragg/development-devcontainer)


A Development DevContainer, primarily for local PHP and Node-based WordPress development in VS Code.
The devContainer has PHP and Node installed for local toolings such as Composer and NPM.
An accompanying docker setup for running your WordPress site. Including Nginx, PHP, MySQL, Mailhog and Traefik.
This allows you to run the website with xDebug via VS Code.


## Prerequisites

Before you begin, ensure you have met the following requirements:

* You have installed [Docker Desktop](https://www.docker.com/products/docker-desktop)
* (Optional for custom domains) You have installed [DNSmasq](https://thekelleys.org.uk/dnsmasq/doc.html) and configured `*.test`, top level domain, to point at `127.0.0.1`.

### Configuration

Copy `./.docker/example.env` configuration to `./.docker/.env` and populate your project variables:

```bash
# Settings

## Docker Compose
COMPOSE_PROJECT_NAME=devcontainer

## Repository
PROJECT_REPO=https://github.com/michaelbragg/devcontainer.git

## Server
PROJECT_BASE_URL=devcontainer.test

## Traefik
TRAEFIK_AUTH=password

## Database
PROJECT_MYSQL_ROOT_PASSWORD=root
PROJECT_MYSQL_DATABASE=devcontainer
PROJECT_MYSQL_USER=root
PROJECT_MYSQL_PASSWORD=root

## PHP

### XDEBUG
XDEBUG_MODE=debug
XDEBUG_SESSION=VSCODE

```

## How to use Development DevContainer

To use Development DevContainer, follow these steps:

```
./bin/docker-up.sh
```

Visit [http://localhost:8080](http://localhost:8080) or [http://www.devcontainer.test:8080](http://www.devcontainer.test:8080) to view your `public` files.

- PHP App: [http://localhost:8080](http://localhost:8080)
- MySQL: [http://localhost:3306](http://localhost:3306)
- Traefik: [http://localhost:8888](http://localhost:8888)
- Mailhog: [http://localhost:8025](http://localhost:8025)

Shutdown docker and devContiainer:

```
./bin/docker-down.sh
```

Close the VS Code window.

## Contact

If you want to contact me you can reach me at <email@michaelbragg.com>.
