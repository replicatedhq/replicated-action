#!/bin/bash

# Create a new release from replicated.yaml and promote the Unstable channel to use it.
# Aborts if version tag is empty.

set -e

VERSION="${GITHUB_SHA:0:7}"

RESULT=$(replicated release create --yaml "$(< ${REPLICATED_YAML:-./replicated.yaml})" --promote "${REPLICATED_CHANNEL:-Unstable}" --version "${VERSION}")
