#!/bin/bash

# Checking parameters
if [ $# -ne 2 ]; then
    echo "Error: Exactly 2 parameters are required!" >&2
    exit 1
fi

# Check if first parameter is a real directory and exist
if [ -d $1 ]; then
    for file in $1; do
        echo $file
    done
fi
