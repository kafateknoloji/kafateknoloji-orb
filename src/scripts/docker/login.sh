#!/bin/bash
TOKEN=$(circleci env subst "${TOKEN}")
USERNAME=$(circleci env subst "${USERNAME}")
REGISTRY=$(circleci env subst "${REGISTRY}")

echo "Building docker image..."
echo "${TOKEN}" | docker login ${REGISTRY} -u "${USERNAME}" --password-stdin