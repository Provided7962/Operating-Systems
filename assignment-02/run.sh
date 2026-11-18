#!/bin/bash

# Checking  the numbers of the parameters
if [ $# -ne 2 ]; then
    echo "Error: Exactly 2 parameters are required!" >&2
    exit 1
fi
# Checking if the given parameters exist
if [ ! -d "$1" ] || [ ! -d "$2" ]; then
    echo "Error: The first and the second parameters are expected to be directories!" >&2
    exit 1
fi
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

    readableCount=0
    for file in "$2"/*; do
        if [ -f "$file" ] && [ -r "$file" ]; then
            readableCount=`expr "$readableCount" + 1`
        fi
    done
    echo "$readableCount" >> log.txt

# Compare average with readableCount
if [ "$average" -gt "$readableCount" ]; then
    echo "1" >> log.txt
elif [ "$average" -eq "$readableCount" ]; then
        echo "0" >> log.txt
else
        echo "2" >> log.txt
fi