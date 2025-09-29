#!/bin/bash
NUGET_SOURCE_URL=$(circleci env subst "${NUGET_SOURCE_URL}")
NUGET_SOURCE_USERNAME=$(circleci env subst "${NUGET_SOURCE_USERNAME}")
NUGET_SOURCE_PASSWORD=$(circleci env subst "${NUGET_SOURCE_PASSWORD}")
NUGET_SOURCE_NAME=$(circleci env subst "${NUGET_SOURCE_NAME}")

cat <<EOF > ./nuget_config.txt
{
  "packageSources": {
    "NUGET_SOURCE_URL": "$NUGET_SOURCE_URL",
    "NUGET_SOURCE_NAME": "$NUGET_SOURCE_NAME",
    "NUGET_SOURCE_USERNAME": "$NUGET_SOURCE_USERNAME",
    "NUGET_SOURCE_PASSWORD": "$NUGET_SOURCE_PASSWORD"
  }
}
EOF

echo "--------------------------------"

cat ./nuget_config.txt

echo "--------------------------------"
echo "Adding NuGet source \"$NUGET_SOURCE_NAME\" with URL \"$NUGET_SOURCE_URL\"..."
dotnet nuget add source --username "$NUGET_SOURCE_USERNAME" --password "$NUGET_SOURCE_PASSWORD" --store-password-in-clear-text --name "$NUGET_SOURCE_NAME" "$NUGET_SOURCE_URL"

echo "Listing all NuGet sources..."
dotnet nuget list source