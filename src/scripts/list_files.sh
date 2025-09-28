#!/bin/bash
DIRECTORY=$(circleci env subst "${DIRECTORY}")

echo "Files in current directory: $(ls -la "$DIRECTORY")"