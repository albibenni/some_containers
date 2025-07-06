#!/bin/bash

echo "IFS, tell 3 numbers separed by :"

OLD_IFS="$IFS"
IFS=:
read x y z
echo "X -> $x"
echo "Y -> $y"
echo "Z -> $z"

IFS="$OLD_IFS"
