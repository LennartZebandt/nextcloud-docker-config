#!/bin/bash

read -p "Do you really want to remove your local configs and credentials, this includes all .env files and the traefik.toml (y) `echo $'\n> '`" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    rm ./env_files/postgres.env
    rm ./env_files/documentserver.env
    rm ./env_files/nextcloud.env
    rm .env
    rm ./traefik/traefik.toml
fi
