#!/bin/bash
cmd_to_run=echo
sec=6

echo "should print \'echo ${sec}seconds\'"
${cmd_to_run} "${sec}seconds" # saying $secSeconds would pring blank - as the var doesnt exists
# thats why special variable with {} is used
