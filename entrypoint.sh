#!/bin/bash -l
set -uo pipefail
set +e

ARGS="${INPUT_ARGS}"
OUTPUT="${INPUT_OUTPUT}"
DEBUG="${INPUT_DEBUG}"
FAIL_ON_ERROR="${INPUT_FAIL_ON_ERROR}"

mkdir -p "$(dirname "${OUTPUT}")"

if [ "${DEBUG}" == "true" ]; then
  echo "Running in debug mode"
  set -x
fi

eval leptosfmt "${ARGS}" | tee "${OUTPUT}"
EXIT_CODE=$?

# Pass leptosfmt exit code to subsequent steps
echo "exit_code=$EXIT_CODE" >> "$GITHUB_OUTPUT"

if [ "${FAIL_ON_ERROR}" == "true" ]; then
  echo "Exiting with error code ${EXIT_CODE}"
  exit ${EXIT_CODE}
fi

echo "Exiting with code 0"
exit 0
