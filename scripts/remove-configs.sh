#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
cd "$PROJECT_DIR" || exit

source ./scripts/utils.sh

function removeIfFileExists {
    local filePath=$1
    if test -f "$filePath"; then
        rm "$filePath"
    fi
}

createYesNoPrompt "Do you really want to remove your local configs and credentials, this includes all .env files and the traefik.toml"
deleteConfigs=$?

if [ "$deleteConfigs" = 0 ]
then
    removeIfFileExists ./env_files/postgres.env
    removeIfFileExists ./env_files/documentserver.env
    removeIfFileExists ./env_files/nextcloud.env
    removeIfFileExists .env
    removeIfFileExists ./traefik/traefik.toml
fi
