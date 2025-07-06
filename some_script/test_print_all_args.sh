#!/bin/bash

#!/bin/bash

echo '--- Con "$@" ---'
echo $@
for arg in "$@"; do
  echo "Argomento: [$arg]"
done

echo '--- Con "$*" ---'
echo $*
for arg in "$*"; do
  echo "Argomento: [$arg]"
done

