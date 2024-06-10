#!/bin/bash

set -e

# Get the input path
DOCKERFILE_PATH="$1"

# Run Docker build
docker build -t my-image:latest "$DOCKERFILE_PATH"
