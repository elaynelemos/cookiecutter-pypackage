#!/bin/bash

set_docker_enviroment () {
  if [ "${DEV}" = "dev" ]; then
    DEV="_dev";
  else
    DEV="";
  fi
}

docker_build () {
  local FILEPROD="docker-compose.yml"
  local FILEDEV="docker-compose.dev.yml"
  local BUILD=""

  if [ "${DEV}" = "" ]; then
    # run script
    BUILD="$(docker-compose -f ${FILEPROD} build 2>&1)"
  else
    BUILD="$(docker-compose -f ${FILEDEV} build 2>&1)"
  fi
  echo "${BUILD}"
  local BUILD_FAILED="$(expr "${BUILD}" :  '.*Err')"
  if [ "${BUILD_FAILED}" != "0" ]; then
    echo "${BOLD}Error${NONESTYLE} building ${B_YELLOW}{{cookiecutter.project_slug}}${DEV}${NONESTYLE} service.\n"
  else
    echo "${B_YELLOW}{{cookiecutter.project_slug}}${DEV}${NONESTYLE} service succesfully built.\n"
  fi
}

docker_cleanup () {
  # remove <none> tagged images
  DOCKER="$(docker rmi -f $(docker images | grep "<none>" | awk "{print \$3}") 2>&1)"
  NONE_DELETED="$(expr "${DOCKER}" :  '.*least')"

  if [ "${NONE_DELETED}" = "0" ]; then
    echo "'docker rmi' completed execution. ${B_GREEN}Deleted images:${NONESTYLE}\
        \n${DOCKER}"
  else
    echo "'docker rmi' completed execution. ${BOLD}No temporary images to delete.${NONESTYLE}"
  fi
}

main () {
  set_docker_enviroment
  docker_build
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
