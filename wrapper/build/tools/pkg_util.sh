#!/bin/bash

# Generate FPM args
eval $(/build/tools/version_helper.py "${VERSION_FULL}")

FPM_ARGS=()

FPM_ARGS+=("-s" "python" "--no-python-fix-name" "--depends" "python" "--version" "${VERSION_FINAL}" "--maintainer" "Thomas Orozco <thomas@scalr.com>" "--vendor" "Scalr, Inc." )
if [ -n "${VERSION_SPECIAL}" ]; then
  FPM_ARGS+=("--iteration" "${VERSION_SPECIAL}.${VERSION_INDEX}")
fi

# TODO - Probably need to set iteration to 1 otherwise!

# Identify the packagecloud base repo

REPO_BASE="scalr/scalr-manage"

if [ -n "${VERSION_SPECIAL}" ]; then
  REPO_BASE="${REPO_BASE}-${VERSION_SPECIAL}"
fi
