#!/bin/bash
PROJECT_PATH=$(circleci env subst "${PROJECT_PATH}")
ENVIRONMENT_NAME=$(circleci env subst "${ENVIRONMENT_NAME}")

echo "Building \"$PROJECT_PATH\" project for \"$ENVIRONMENT_NAME\" environment..."
dotnet build "$PROJECT_PATH" -c Release -p:EnvironmentName="$ENVIRONMENT_NAME" --no-restore