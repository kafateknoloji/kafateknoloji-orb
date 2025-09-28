#!/bin/bash
SOURCE_FOLDER=$(circleci env subst "${SOURCE_FOLDER}")

echo "Pushing nuget packages from \"$SOURCE_FOLDER\" folder."
dotnet nuget push "$SOURCE_FOLDER" -k "$NUGET_PASSWORD" --skip-duplicate -s Main