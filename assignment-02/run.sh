#!/bin/bash

# Checking parameters
if [ $# -ne 2 ]; then
    echo "Error: Exactly 2 parameters are required!" >&2
    exit 1
fi

# Check if first parameter is a real directory and exist
if [ -d "$1" ]; then
    totalLines=0
    fileCount=0
    average=0
    for file in "$1"/*; do
        # Check if file and executable
        if [ -f "$file" ] && [ -x "$file" ]; then
            lines=`wc -l < "$file"`
            totalLines=`expr "$totalLines" + "$lines"`
            fileCount=`expr "$fileCount" + 1`
        fi
    done
    # Check the file count
    if [ "$fileCount" -ne 0  ]; then
        average=`expr "$totalLines" / "$fileCount"`
    fi
    echo "$average" > log.txt
else
    # If first parameter is not a directory, exit.
    echo "Error: The first parameter is not a directory!" >&2
    exit 1
fi
