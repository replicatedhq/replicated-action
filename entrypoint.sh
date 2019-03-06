#!/bin/bash

# Create a new release from replicated.yaml and promote the Unstable channel to use it.
# Aborts if version tag is empty.

set -e

VERSION="${GITHUB_SHA:0:7}"

unstable_channel_id() {
  replicated channel ls | grep Unstable | awk '{print $1}'
}

new_sequence() {
  replicated release create --yaml "$(< replicated.yaml)" | grep 'SEQUENCE:' | grep -Eo '[0-9]+'
}

RESULT=$(replicated release promote $(new_sequence) $(unstable_channel_id) --version "$VERSION")
