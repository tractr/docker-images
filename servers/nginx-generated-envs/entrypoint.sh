#!/bin/sh

# Create env file
/create-env-file.sh

# Override base URL
/edit-base-url.sh

# Call base entrypoint
/docker-entrypoint.sh "$@"
