#!/bin/bash
BASE_VERSION=$(circleci env subst "${BASE_VERSION}")
PIPELINE_ID=$(circleci env subst "${PIPELINE_ID}")

{
    echo 
    "export VERSION_PREFIX=$BASE_VERSION.$PIPELINE_ID"
    "export VERSION_SUFFIX=$CIRCLE_BRANCH;"
    "if [ $CIRCLE_BRANCH == "main" ]; then export VERSION_SUFFIX=test; fi"
    "if [ $CIRCLE_BRANCH != "main" ]; then export NUGET_VERSION_SUFFIX=$CIRCLE_BRANCH; fi"
    "export FULL_VERSION=$VERSION_PREFIX-$VERSION_SUFFIX;"
} >> "$BASH_ENV"

echo "Version variables Set"
echo "VERSION_PREFIX: $VERSION_PREFIX"
echo "VERSION_SUFFIX: $VERSION_SUFFIX"
echo "NUGET_VERSION_SUFFIX: $NUGET_VERSION_SUFFIX"
echo "FULL_VERSION: $FULL_VERSION"