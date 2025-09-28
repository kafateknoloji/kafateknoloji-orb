#!/bin/bash
BASE_PATH=$(circleci env subst "${BASE_PATH}")
REGISTRY=$(circleci env subst "${REGISTRY}")
NAMESPACE=$(circleci env subst "${NAMESPACE}")
REPOSITORY_NAME=$(circleci env subst "${REPOSITORY_NAME}")

echo "Building docker image..."
cd $BASE_PATH
if [ $BASE_PATH != "." ]; then cp -R /home/circleci/project/app .; fi
echo "Current folder: $(pwd)"
echo "Files in current directory: $(ls -la ./app/out)"

docker build -f CircleDockerfile . -t $REGISTRY/$NAMESPACE/$REPOSITORY_NAME:$FULL_VERSION