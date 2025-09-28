#!/bin/bash
REGISTRY=$(circleci env subst "${REGISTRY}")
NAMESPACE=$(circleci env subst "${NAMESPACE}")
REPOSITORY_NAME=$(circleci env subst "${REPOSITORY_NAME}")

echo "Pushing docker image..."
docker push $REGISTRY/$NAMESPACE/$REPOSITORY_NAME:$FULL_VERSION

if [ "$CIRCLE_BRANCH" == "release" ]; then
    docker tag $REGISTRY/$NAMESPACE/$REPOSITORY_NAME:$FULL_VERSION $REGISTRY/$NAMESPACE/$REPOSITORY_NAME:latest
    docker push $REGISTRY/$NAMESPACE/$REPOSITORY_NAME:latest
fi