#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
cd "$PROJECT_DIR" || exit

composeFiles="-f docker-compose.yml"

if test -f "./env_files/documentserver.env"; then
    composeFiles="${composeFiles} -f ./onlyoffice-documentserver/docker-compose.yml"
fi

# shellcheck disable=SC2086
docker-compose $composeFiles up --build -d
