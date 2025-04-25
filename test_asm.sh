#!/bin/bash

echo "--- Assembling to Object ---"
./$1 $2 -o test.o -v
rc=$?
if [ $rc -ne 0 ]; then
  echo "Assembling failed with code $rc"
  exit $rc
fi

echo "--- Linking Object ---"
gcc test.o -o test_exec

rc=$?
if [ $rc -ne 0 ]; then
  echo "Linking failed with code $rc"
  exit $rc
fi

echo "--- Testing Executable ---"
./test_exec

rc=$?
if [ $rc -ne 0 ]; then
  echo "Executable failed with code $rc"
  exit $rc
fi
