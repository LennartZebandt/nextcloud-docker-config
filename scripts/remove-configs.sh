#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
cd $PROJECT_DIR

source ./scripts/utils.sh

createYesNoPrompt "Do you really want to remove your local configs and credentials, this includes all .env files and the traefik.toml"
deleteConfigs=$?

if [ "$deleteConfigs" = 0 ]
then
    rm ./env_files/postgres.env
    rm ./env_files/documentserver.env
    rm ./env_files/nextcloud.env
    rm .env
    rm ./traefik/traefik.toml
fi
