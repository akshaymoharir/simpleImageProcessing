#!/usr/bin/env bash

# Current project root dir
PROJECT_ROOT_REPO="simpleImageProcessing"

# Application name
APP_NAME="simpleImageProcessingApp"

# Project Resources directory has all the source code and resources
PROJECT_RESOURCES="${PROJECT_ROOT_REPO}/${APP_NAME}"

# This folder has
PROCESSED_DATA_FROM_DOCKER="dockerContainerBuild"

# Sample Video file
INPUT_VIDEO_FILE="sampleVideo.mov"
OUTPUT_VIDEO_FILE="processedSampleVideo.avi"

# Name of the executable
APP_BIN_NAME="mySimpleImageProcessingApp"

# Root directory within docker container
DOCKER_ROOT_REPO="/RepoRootFolder"

# Application Binaries built in docker container reside here
DOCKER_BIN_FOLDER="buildDocker"

# Full path of application binaries built within docker container
DOCKER_CONTAINER_BINARIES="${DOCKER_ROOT_REPO}/${APP_NAME}/${DOCKER_BIN_FOLDER}"

# Name of docker image
IMAGE_NAME="simpleimageprocessing"

######################################################################################################################

# Obtain container information
CONTAINER_ID=$(docker ps -alq)
CONTAINER_NAME=$(docker ps --format "{{.Names}}")
echo ${CONTAINER_NAME}

## Copy files into docker container
# Copy resource files
SOURCE_VIDEO_FILE="${APP_NAME}/${INPUT_VIDEO_FILE}"
DESTINATION_DIR="${CONTAINER_ID}:${DOCKER_CONTAINER_BINARIES}"
docker cp ${SOURCE_VIDEO_FILE} ${DESTINATION_DIR}

# Copy source code files
docker cp ${APP_NAME}/src ${CONTAINER_ID}:${DOCKER_ROOT_REPO}/${APP_NAME}/src
docker cp ${APP_NAME}/include ${CONTAINER_ID}:${DOCKER_ROOT_REPO}/${APP_NAME}/include
docker cp ${APP_NAME}/CMakeLists.txt ${CONTAINER_ID}:${DOCKER_ROOT_REPO}/${APP_NAME}/CMakeLists.txt

# Start shell
docker exec -it ${CONTAINER_NAME} /bin/bash
