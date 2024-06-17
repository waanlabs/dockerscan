#!/bin/bash
set -e

# Get the input path, Dockerfile name, and build arguments
DOCKERFILE_NAME="$1"
DOCKERFILE_PATH="$2"
BUILD_ARGS="$3"

# Run Docker build
echo "Starting Docker build for Dockerfile: $DOCKERFILE_NAME in path: $DOCKERFILE_PATH"

if docker build -f "$DOCKERFILE_PATH/$DOCKERFILE_NAME" "$BUILD_ARGS" -t myscan:latest "$DOCKERFILE_PATH"; then
    echo "Docker build completed successfully"
else
    echo "Docker build failed" >&2
    exit 1
fi

# Run security scan with Trivy
echo "Starting security scan with Trivy"

if trivy image myscan:latest; then
    echo "Security scan completed successfully"
else
    echo "Security scan failed" >&2
    exit 1
fi
