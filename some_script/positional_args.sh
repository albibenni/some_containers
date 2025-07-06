#!/bin/bash

echo "Hi $1, welcom to program $0"
users=$#
shift
echo "and also hi to you $@"
echo "You are in $users !"
