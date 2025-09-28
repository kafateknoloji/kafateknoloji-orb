#!/bin/bash
PROJECT_PATH=$(circleci env subst "${PROJECT_PATH}")

echo "Restoring $PROJECT_PATH project..."
dotnet restore "$PROJECT_PATH"