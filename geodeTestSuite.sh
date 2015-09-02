#!/bin/bash

EXITCODE=0
USAGE='./geodeTestSuite.sh "path to Geode installation, should have lib as subdirectory"'

if [ -z "$1"  ];
then
  echo $USAGE
  exit 1
fi

export GEODE_CLASSPATH="$1/lib/*"

echo "$GEODE_CLASSPATH"

function runTest {
  ./runtest --single "$@"
  EXITCODE=$?
  if [ $EXITCODE -ne 0 ];
  then
    exit $EXITCODE
  fi
}

runTest unit/basic
runTest unit/type/list
runTest unit/type/list-2
#runTest unit/type/list-3
runTest unit/type/set
runTest unit/type/zset
runTest unit/type/hash
runTest unit/expire
runTest unit/multi
runTest unit/bitops
runTest unit/hyperloglog
