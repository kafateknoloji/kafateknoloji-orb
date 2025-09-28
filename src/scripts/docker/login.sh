#!/bin/bash
TOKEN=$(circleci env subst "${TOKEN}")
USERNAME=$(circleci env subst "${USERNAME}")
REGISTRY=$(circleci env subst "${REGISTRY}")

echo "Logging into docker registry $REGISTRY..."
echo "$TOKEN" | docker login "$REGISTRY" -u "$USERNAME" --password-stdin