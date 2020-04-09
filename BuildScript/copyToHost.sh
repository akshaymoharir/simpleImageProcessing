#!/usr/bin/env bash

# Current project name
PROJECT_ROOT_REPO="simpleImageProcessing"
PROJECT_REPO="simpleImageProcessingApp"
PROJECT_RESOURCES="${PROJECT_ROOT_REPO}/${PROJECT_REPO}"
OUTPUT_DATA_FOLDER_FROM_DOCKER="OutputFromContainer"
INPUT_VIDEO_FILE="sampleVideo.mov"
OUTPUT_VIDEO_FILE="processedSampleVideo.avi"

APP_BIN_NAME=mySimpleImageProcessingApp

DOCKER_ROOT_REPO="/RepoRootFolder"
DOCKER_BIN_FOLDER="buildDocker"
DOCKER_CONTAINER_BINARIES="${DOCKER_ROOT_REPO}/${PROJECT_REPO}/${DOCKER_BIN_FOLDER}"
IMAGE_NAME="simpleimageprocessing"

######################################################################################################################

# Find base dir
BASEDIR=$(dirname "$0")
#echo "$BASEDIR"

# Copy base dir
currentDir=$BASEDIR
#echo "${currentDir}"

# Browse to root directory of the app
desiredPath="${currentDir}/.."
echo ${desiredPath}
cd ${desiredPath}
echo $PWD

mkdir ${OUTPUT_DATA_FOLDER_FROM_DOCKER}
cd ${OUTPUT_DATA_FOLDER_FROM_DOCKER}

######################################################################################################################

# Obtain container ID
CONTAINER_ID=$(docker ps -alq)
CONTAINER_NAME=$(docker ps --format "{{.Names}}")
echo ${CONTAINER_NAME}

## Copy files from docker container to host
docker cp ${CONTAINER_ID}:${DOCKER_CONTAINER_BINARIES}/${OUTPUT_VIDEO_FILE} .

