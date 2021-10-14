#!/bin/bash

# Leave on error
set -e

# Build image locally
docker build --tag nginx-generated-envs .

# Copy index file
rm -f www/index.html
cp www/sample.index.html www/index.html

# ------------------------------------------------
# Start image to generate JSON with envs
docker run --rm \
  -v "${PWD}"/generated:/generated \
  -e ENVS_NAMES=VAR1,VAR2,VAR3,VAR4,var5 \
  -e VAR1=test \
  -e VAR3=12 \
  -e VAR4=t\"e\$s\'t \
  -e var5=http://value5.com/ \
  -e VAR6=VALUE6 \
  nginx-generated-envs echo ''

# Test output
expected=$(cat "${PWD}"/test/success.json)
actual=$(cat "${PWD}"/generated/config.json)
if [ "$expected" != "$actual" ]; then
  echo "Output JSON does not match success reference"
  exit 1
fi

# ------------------------------------------------
# Start image to generate JSON without envs
docker run --rm \
  -v "${PWD}"/generated:/generated \
  nginx-generated-envs echo ''

# Test output
expected=$(cat "${PWD}"/test/empty.json)
actual=$(cat "${PWD}"/generated/config.json)
if [ "$expected" != "$actual" ]; then
  echo "Output JSON does not match empty reference"
  exit 1
fi


# ------------------------------------------------
# Start image to change base URL
docker run --rm \
  -v "${PWD}"/www:/var/www/ \
  -e HTML_INDEX_PATH=/var/www/index.html \
  -e HTML_BASE_HREF=/custom-base \
  nginx-generated-envs echo ''

# Test output
expected=$(cat "${PWD}"/test/expected.index.html)
actual=$(cat "${PWD}"/www/index.html)
if [ "$expected" != "$actual" ]; then
  echo "Output HTML does not match index reference"
  exit 1
fi


# ------------------------------------------------
# Success
echo "All tests passed"
