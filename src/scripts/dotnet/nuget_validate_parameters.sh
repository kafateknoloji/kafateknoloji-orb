#!/bin/bash

echo "Validating NuGet parameters..."
if [ -z "$VAR_NUGET_USERNAME" ] || [ -z "$VAR_NUGET_PASSWORD" ] || [ -z "$VAR_NUGET_URL" ]; then
    echo "Error: VAR_NUGET_USERNAME, VAR_NUGET_PASSWORD, and VAR_NUGET_URL environment variables must be set."
    exit 1
fi