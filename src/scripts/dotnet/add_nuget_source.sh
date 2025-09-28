#!/bin/bash
NUGET_USERNAME=$(circleci env subst "${NUGET_USERNAME}")
NUGET_PASSWORD=$(circleci env subst "${NUGET_PASSWORD}")
NUGET_URL=$(circleci env subst "${NUGET_URL}")
NUGET_NAME=$(circleci env subst "${NUGET_NAME}")

echo "Adding NuGet source \"$NUGET_NAME\" with URL \"$NUGET_URL\"..."
dotnet nuget add source --username "$NUGET_USERNAME" --password "$NUGET_PASSWORD" --store-password-in-clear-text --name "$NUGET_NAME" "$NUGET_URL"

echo "Listing all NuGet sources..."
dotnet nuget list source