#!/bin/bash
PACKAGE_MANAGER=$(circleci env subst "${PACKAGE_MANAGER}")

echo "Installing React dependencies..."

# Check https://github.com/nodejs/docker-node/tree/b4117f9333da4138b03a546ec926ef50a31506c3#nodealpine to understand why libc6-compat might be needed.
RUN apk add --no-cache libc6-compat

# Install dependencies based on the preferred package manager
COPY package.json yarn.lock* package-lock.json* pnpm-lock.yaml* .npmrc* ./

if [ "$PACKAGE_MANAGER" == "yarn" ]; then
    echo "Using Yarn as the package manager."
    if [ -f yarn.lock ]; then
        yarn --frozen-lockfile
    else
        echo "yarn.lock not found, but PACKAGE_MANAGER is set to yarn."
    fi
elif [ "$PACKAGE_MANAGER" == "npm" ]; then
    echo "Using npm as the package manager."
    if [ -f package-lock.json ]; then
        npm ci
    else
        echo "package-lock.json not found, but PACKAGE_MANAGER is set to npm."
    fi
elif [ "$PACKAGE_MANAGER" == "pnpm" ]; then
    echo "Using pnpm as the package manager."
    if [ -f pnpm-lock.yaml ]; then
        corepack enable pnpm && pnpm i --frozen-lockfile
    else
        echo "pnpm-lock.yaml not found, but PACKAGE_MANAGER is set to pnpm."
    fi
else
    echo "Unsupported PACKAGE_MANAGER: $PACKAGE_MANAGER"
    exit 1
fi