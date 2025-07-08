#!/bin/bash

echo "testing operations with arithmetic - floating point"

# usage of bc for floating point arithmetic
echo "1.5 + 2.5 = $(echo "1.5 + 2.5" | bc)"
