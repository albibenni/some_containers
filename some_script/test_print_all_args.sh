#!/bin/bash

#!/bin/bash

echo '--- Con "$@" ---'
for arg in "$@"; do
  echo "Argomento: [$arg]"
done

echo '--- Con "$*" ---'
for arg in "$*"; do
  echo "Argomento: [$arg]"
done

