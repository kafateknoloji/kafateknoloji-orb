#!/bin/bash
PROJECT_PATH=$(circleci env subst "${PROJECT_PATH}")

echo "Building \"$PROJECT_PATH\" project."
dotnet build "$PROJECT_PATH" -p:TreatWarningsAsErrors=True -p:EnforceCodeStyleInBuild=True --no-restore