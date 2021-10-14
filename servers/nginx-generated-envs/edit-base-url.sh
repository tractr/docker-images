#!/bin/bash

set -e

# Check file path and base URL
if [[ -z "${HTML_INDEX_PATH}" ]]; then
  echo "No path is defined for html file"
  exit 0
fi
if [[ -z "${HTML_BASE_HREF}" ]]; then
  echo "No base href is defined"
  exit 0
fi

search="<base.*>"
replace="<base href=\"${HTML_BASE_HREF}\">"
sed -i "s|${search}|${replace}|g" "${HTML_INDEX_PATH}"
echo "Replaced base to '${HTML_BASE_HREF}' in file ${HTML_INDEX_PATH}"
