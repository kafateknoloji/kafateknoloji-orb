#!/bin/bash
BASE_VERSION=$(circleci env subst "${BASE_VERSION}")
PIPELINE_ID=$(circleci env subst "${PIPELINE_ID}")

echo "BASE_VERSION: $BASE_VERSION"
echo "PIPELINE_ID: $PIPELINE_ID"
echo "CIRCLE_BRANCH: $CIRCLE_BRANCH"

{
    echo "export VERSION_PREFIX=${BASE_VERSION}.${PIPELINE_ID}"
    echo "export VERSION_SUFFIX=\$CIRCLE_BRANCH"
    echo 'if [ "$CIRCLE_BRANCH" == "main" ]; then export VERSION_SUFFIX=test; fi'
    echo 'if [ "$CIRCLE_BRANCH" != "main" ]; then export NUGET_VERSION_SUFFIX=$CIRCLE_BRANCH; fi'
    echo "export FULL_VERSION=\$VERSION_PREFIX-\$VERSION_SUFFIX"
} >> "$BASH_ENV"

echo "Version variables Set"
echo "VERSION_PREFIX: $VERSION_PREFIX"
echo "VERSION_SUFFIX: $VERSION_SUFFIX"
echo "NUGET_VERSION_SUFFIX: $NUGET_VERSION_SUFFIX"
echo "FULL_VERSION: $FULL_VERSION"