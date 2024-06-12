# Dockercheck

Check your Dockerfile build via actions.

## Overview

This action checks if a Docker build completes correctly.

## Inputs

### `path`

**Required** The path to the Dockerfile. Default is `.`.

### `build_args`

**Optional** Additional arguments to pass to the Docker build command.

## Example usage

```yaml
name: Docker Build

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v2

      - name: Run Docker Build Check
        uses: your-username/dockcheck@v1
        with:
          path: path/to/dockerfile
          build_args: "--no-cache"
