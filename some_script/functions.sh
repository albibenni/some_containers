#!/bin/bash

echo "testing functions, use arguments for the hellos functions - just one"

echo "this is a function with function keyword"
function hello() {
  echo "Hello from function, $1"
}
hello $1

echo "this is a function with standard name definition"
hello2() {
  echo "Hello from standard, $1"
}
hello2 $1
