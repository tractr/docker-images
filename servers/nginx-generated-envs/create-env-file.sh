#!/bin/bash

set -e

# Get variables from ENVS_NAMES
declare -a vars=(`echo "$ENVS_NAMES" |sed 's/,/ /g'`)

# Declare output path
output_path="/generated/config.json"
mkdir -p /generated
touch $output_path

# If no envs names are defined, leave an empty json
if [ ${#vars[@]} -eq 0 ]; then
    echo "No ENVS_NAMES. Save an empty object"
    echo "{}" > $output_path
    exit 0
fi

# Init json string
json="{"

# Loop over each variable
for var in "${vars[@]}"
do
  # Get value with dynamic name
  value="${!var}"
  # Escape " in value
  value="${value/\"/\\\"}"
  # Add var/value to output JSON
  json="${json}\"${var}\":\"${value}\","
done

# Remove last comma
json=${json::-1}

# Close json
json="${json}}"

# Save json in file
echo "Did save variables ${vars[@]} in JSON file"
echo "$json" > $output_path
