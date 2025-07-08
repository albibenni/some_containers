#!/bin/bash

echo "iteration with list of values"

for i in 1 2 3 4 5 six seven eight nine 10
do
 echo "Number: $i"
done


echo "for c-like"
for ((i=0; i<20; i+=2))
do
  echo "C-like, Number: $i"
done
