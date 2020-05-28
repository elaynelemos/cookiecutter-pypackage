#!/bin/bash

NONESTYLE='\e[0m'
BOLD='\e[1m'
B_GREEN='\e[1;32m'
B_YELLOW='\e[1;33m'

# run script
docker-compose run {{cookiecutter.project_slug}}
echo "${B_YELLOW}{{cookiecutter.project_slug}}${NONESTYLE} has ran."

# remove run temporary container
DOCKER="$(docker rm -f $(docker ps -a | grep "{{cookiecutter.project_slug}}_run" \
        | awk "{print \$1}") 2>&1)"
NONE_DELETED="$(expr "${DOCKER}" :  '.*least')"

if [ "${NONE_DELETED}" = "0" ]; then
  echo "'docker rm' completed execution. ${B_GREEN}Deleted containers:${NONESTYLE}\
      \n${DOCKER}"
else
  echo "'docker rm' completed execution. ${BOLD}No temporary containers to delete.${NONESTYLE}"
fi
