#!/bin/bash
PROJECT_PATH=$(circleci env subst "${PROJECT_PATH}")
OUTPUT_DIRECTORY=$(circleci env subst "${OUTPUT_DIRECTORY}")

echo "Packing \"$PROJECT_PATH\" project to $OUTPUT_DIRECTORY..."
dotnet pack "$PROJECT_PATH" -c Release -o "$OUTPUT_DIRECTORY" -p:VersionSuffix="$NUGET_VERSION_SUFFIX" -p:VersionPrefix="$VERSION_PREFIX" -p:SymbolPackageFormat=snupkg -p:IncludeSymbols=True -p:DebugType=portable