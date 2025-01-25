#!/bin/bash -l
set -uo pipefail
set +e

ARGS="${INPUT_ARGS}"
OUTPUT="${INPUT_OUTPUT}"
DEBUG="${INPUT_DEBUG}"

if [ "${DEBUG}" == "true" ]; then
  echo "Running in debug mode"
  set -x
fi

eval leptosfmt ${ARGS} | tee ${OUTPUT}
EXIT_CODE=$?

if [ $(DEBUG) == "true" ]; then
  echo "Output:"
  cat ${OUTPUT}
  echo "Exit code: ${EXIT_CODE}"
fi

exit ${EXIT_CODE}
