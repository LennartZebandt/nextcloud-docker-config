# nextcloud-docker-config

> Actual development and issue managment happens on [Gitlab](https://gitlab.com/lennartZebandt/nextcloud-docker-config)

This is my nextcloud configuration combining the use of Docker Compose, Traefik, Let's Encrypt, Redis, Postgres, RabbitMQ and the OnlyOffice Documentserver. The purpose the the containers are documented in the docker-compose.yml.
Additionally credentials are passed to the containers via .env files, these files should not be checked into version control.
To make handling of the env files easier i created example files that are checked into version control and a bash script that generates them.

## Usage

### Setup

This script create the env files for the containers, the traefik config file and an empty acme.json file with correct permissions for Let's Encrypt.
If you keep your repository private you can check the traefik.toml into version control, because it doesn't contain any sensitive data.
But if you host a private nextcloud instance, you propably dont want the URL or your Email in a public repo.

```console
./scripts/setup.sh
```

After that the script will ask you for your credentials and other configs that needed to be present in the env files.

### Start

This script starts the docker containers in detached mode.

```console
./scripts/start.sh
```
