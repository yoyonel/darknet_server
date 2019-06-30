#!/bin/bash

DOCKER_NAME=darknet_python_server
DOCKER_TAG=nvidia-cuda-10.1-devel-ubuntu18.04

docker build -t ${DOCKER_NAME}:${DOCKER_TAG}  .