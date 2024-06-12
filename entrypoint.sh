#!/bin/bash

set -e

# Get the input path and build arguments
DOCKERFILE_PATH="$1"
BUILD_ARGS="$2"

# Run Docker build
echo "Starting Docker build for path: $DOCKERFILE_PATH"
if docker build "$BUILD_ARGS" -t my-image:latest "$DOCKERFILE_PATH"; then
    echo "Docker build completed successfully"
else
    echo "Docker build failed" >&2
    exit 1
fi
