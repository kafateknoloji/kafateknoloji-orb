#!/bin/bash
PROJECT_PATH=$(circleci env subst "${PROJECT_PATH}")
PACKAGE_MANAGER=$(circleci env subst "${PACKAGE_MANAGER}")

echo "Building React application..."

# Next.js collects completely anonymous telemetry data about general usage.
# Learn more here: https://nextjs.org/telemetry
ENV NEXT_TELEMETRY_DISABLED=1

if [ -d "$PROJECT_PATH" ] && [ "$PROJECT_PATH" != "." ]; then
    cd "$PROJECT_PATH" || { echo "Failed to change directory to $PROJECT_PATH"; exit 1; }
fi

if [ "$PACKAGE_MANAGER" == "yarn" ]; then
    echo "Using Yarn as the package manager."
    if [ -f yarn.lock ]; then
        yarn run build
    else
        echo "yarn.lock not found, but PACKAGE_MANAGER is set to yarn."
    fi
elif [ "$PACKAGE_MANAGER" == "npm" ]; then
    echo "Using npm as the package manager."
    if [ -f package-lock.json ]; then
        npm run build
    else
        echo "package-lock.json not found, but PACKAGE_MANAGER is set to npm."
    fi
elif [ "$PACKAGE_MANAGER" == "pnpm" ]; then
    echo "Using pnpm as the package manager."
    if [ -f pnpm-lock.yaml ]; then
        corepack enable pnpm && pnpm run build
    else
        echo "pnpm-lock.yaml not found, but PACKAGE_MANAGER is set to pnpm."
    fi
else
    echo "Unsupported PACKAGE_MANAGER: $PACKAGE_MANAGER"
    exit 1
fi