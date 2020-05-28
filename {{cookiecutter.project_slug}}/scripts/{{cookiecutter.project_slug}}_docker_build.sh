#!/bin/bash

NONESTYLE='\e[0m'
BOLD='\e[1m'
B_GREEN='\e[1;32m'
B_YELLOW='\e[1;33m'

# run script
BUILD="$(docker-compose build 2>&1)"
BUILD_FAILED="$(expr "${BUILD}" :  '.*ERROR: Service')"

if [ "${BUILD_FAILED}" != "0" ]; then
  echo "\n${BOLD}Error${NONESTYLE} building ${B_YELLOW}{{cookiecutter.project_slug}}${NONESTYLE} service.\n"
else
  echo "\n${B_YELLOW}{{cookiecutter.project_slug}}${NONESTYLE} service succesfully built.\n"
fi

# remove <none> tagged images
DOCKER="$(docker rmi -f $(docker images | grep "<none>" | awk "{print \$3}") 2>&1)"
NONE_DELETED="$(expr "${DOCKER}" :  '.*least')"

if [ "${NONE_DELETED}" = "0" ]; then
  echo "'docker rmi' completed execution. ${B_GREEN}Deleted images:${NONESTYLE}\
      \n${DOCKER}"
else
  echo "'docker rmi' completed execution. ${BOLD}No temporary images to delete.${NONESTYLE}"
fi
