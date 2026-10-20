#!/bin/bash

lessFilePath=""
biggestFilePath=""

count1=`ls -l "$1" | tail -n +2 | wc -l`
count2=`ls -l "$2" | tail -n +2 | wc -l`
count3=`ls -l "$3" | tail -n +2 | wc -l`

lessFilePath=`printf '%s %s\n' "$count1" "$1" "$count2" "$2" "$count3" "$3" | sort -n | head -n 1 | cut -d" " -f 2`

echo "$lessFilePath"