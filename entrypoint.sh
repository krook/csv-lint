#! /usr/bin/env bash

set -eo pipefail
set -x

# Use these arguments or the default
CSV_FILE="${CSV_FILE:-file.csv}"
CSV_ARGS="${CSV_ARGS:---lazyquotes}"

set -u

cd "${GITHUB_WORKSPACE}"

CSV_PATH="${GITHUB_WORKSPACE}/${CSV_FILE}"

if [ ! -f "${CSV_PATH}" -a ! -d "${CSV_PATH}" ]; then
  >&2 echo "==> Can't find '${CSV_PATH}'.
    Please ensure to set up CSV_FILE env var
    relative to the root of your project."
  exit 1
fi

>&2 echo
>&2 echo "==> Linting file at ${CSV_PATH}…"

if [ -d "${CSV_PATH}" ]; then
  /usr/local/bin/csvlint ${CSV_ARGS} `find "${CSV_PATH}" -type f -name file.csv`
else
  /usr/local/bin/csvlint ${CSV_ARGS} "${CSV_PATH}"
fi

>&2 echo