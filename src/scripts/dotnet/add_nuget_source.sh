#!/bin/bash
NUGET_NAME=$(circleci env subst "${NUGET_NAME}")
NUGET_URL_TEST=$(circleci env subst "${NUGET_URL_TEST}")

cat <<EOF > ./nuget_config.txt
{
  "packageSources": {
    "$NUGET_NAME": "$NUGET_URL_TEST"
  }
}
EOF

echo "--------------------------------"

cat ./nuget_config.txt

echo "--------------------------------"
echo "Adding NuGet source \"$NUGET_NAME\" with URL \"$VAR_NUGET_URL\"..."
dotnet nuget add source --username "$VAR_NUGET_USERNAME" --password "$VAR_NUGET_PASSWORD" --store-password-in-clear-text --name "$NUGET_NAME" "$VAR_NUGET_URL"

echo "Listing all NuGet sources..."
dotnet nuget list source