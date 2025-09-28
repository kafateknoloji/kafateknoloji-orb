#!/bin/bash
PROJECT_PATH=$(circleci env subst "${PROJECT_PATH}")
ENVIRONMENT_NAME=$(circleci env subst "${ENVIRONMENT_NAME}")

echo "Preparing $PROJECT_PATH project for $ENVIRONMENT_NAME environment..."
dotnet publish $PROJECT_PATH -c Release -p:EnvironmentName=$ENVIRONMENT_NAME -o app/out /p:UseAppHost=false
rm -rf build