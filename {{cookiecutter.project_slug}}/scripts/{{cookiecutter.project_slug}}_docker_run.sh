#!/bin/bash

set_docker_enviroment () {
  if [ "${DEV}" = "dev" ]; then
    DEV="_dev";
  else
    DEV="";
  fi
}

docker_run () {
  # run script
  local EXEC=""

  EXEC=$(docker-compose run "{{cookiecutter.project_slug}}${DEV}" 2>&1)
  local EXEC_FAILED="$(expr "${EXEC}" :  '.*No')"
  if [ "${EXEC_FAILED}" = "0" ]; then
    EXEC_FAILED="$(expr "${EXEC}" :  '.*Error')"
  fi
  echo "${EXEC}"

  if [ "${EXEC_FAILED}" != "0" ]; then
    echo "\n${BOLD}Error${NONESTYLE} running ${B_YELLOW}{{cookiecutter.project_slug}}${DEV}${NONESTYLE} service.\n"
  else
    echo "\n${B_YELLOW}{{cookiecutter.project_slug}}${DEV}${NONESTYLE} has ran."
  fi
}

docker_cleanup () {
  # remove run temporary container
  DOCKER="$(docker rm -f $(docker ps -a | grep "{{cookiecutter.project_slug}}${DEV}_run" \
          | awk "{print \$1}") 2>&1)"
  NONE_DELETED="$(expr "${DOCKER}" :  '.*least')"

  if [ "${NONE_DELETED}" = "0" ]; then
    echo "'docker rm' completed execution. ${B_GREEN}Deleted containers:${NONESTYLE}\
        \n${DOCKER}"
  else
    echo "'docker rm' completed execution. ${BOLD}No temporary containers to delete.${NONESTYLE}"
  fi
}

main () {
  set_docker_enviroment
  docker_run
  docker_cleanup
}

#style
NONESTYLE='\e[0m'
BOLD='\e[1m'
B_GREEN='\e[1;32m'
B_YELLOW='\e[1;33m'

#docker environment
DEV=$1

#run script
main
