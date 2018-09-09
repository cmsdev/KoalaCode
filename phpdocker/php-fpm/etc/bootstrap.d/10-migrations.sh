#!/usr/bin/env bash

#SCRIPT MAKE MIGRATION IF IT NEED
MIGRATIONS_DIR="/src/Migrations/"
SCRIPT_DIR="/app"

ls "${SCRIPT_DIR}${MIGRATIONS_DIR}" | grep ".php"
lsgrep=$?

cd "${SCRIPT_DIR}/"

if [[ ! $lsgrep -eq 0 ]]; then
    php bin/console make:migration
fi

yes | php bin/console doctrine:migrations:migrate