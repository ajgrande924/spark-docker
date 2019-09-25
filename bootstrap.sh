#!/bin/bash

# bail out if anything fails
set -e

DOCKER_USER=ajgrande924

create_base () {
  cd base
  docker build -t ${DOCKER_USER}/spark-base .
}

create_from_base () {
  cd master
  docker build -t ${DOCKER_USER}/spark-master .
  cd ../worker
  docker build -t ${DOCKER_USER}/spark-worker .
  cd ../submit
  docker build -t ${DOCKER_USER}/spark-submit .
}

delete_base () {
  docker rmi ${DOCKER_USER}/spark-base
}

delete_from_base () {
  docker rmi ${DOCKER_USER}/spark-master
  docker rmi ${DOCKER_USER}/spark-worker
  docker rmi ${DOCKER_USER}/spark-submit
}

"$@"
