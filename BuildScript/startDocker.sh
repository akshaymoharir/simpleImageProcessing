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

# Build fresh docker image(--no-cache)
docker build -t ${IMAGE_NAME} .

# Run docker image to see output
docker run -it -d ${IMAGE_NAME}


######################################################################################################################

# Obtain container information
CONTAINER_ID=$(docker ps -alq)
CONTAINER_NAME=$(docker ps --format "{{.Names}}")
echo ${CONTAINER_NAME}

