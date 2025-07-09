#!/bin/bash

echo "test return"

some() {
  echo "inside some()"
  return 42
}

some
echo "$?"
