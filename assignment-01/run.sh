#!/bin/bash

#Directory with less files
lessFilePath=""

count1=`ls -Al "$1"/ | tail -n +2 | wc -l`
count2=`ls -Al "$2"/ | tail -n +2 | wc -l`
count3=`ls -Al "$3"/ | tail -n +2 | wc -l`

lessFilePath=`echo -e "$count1 $1\n$count2 $2\n$count3 $3" | sort -n | head -n 1 | cut -d ' ' -f 2-`
echo "$lessFilePath" > log.txt


#Directory with biggest files
