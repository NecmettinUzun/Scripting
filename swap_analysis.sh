#!/bin/bash

# Ordering all swap usage and writing them to the file 
# -n : sort numerically
# -r : reverse the results. Default is small to large
# -k : Which column to be used for ordering

grep VmSwap /proc/*/status | sort -k 2 -n -r > tmp.txt
head -10 tmp.txt > tmp2.txt

cat tmp2.txt | while read LINE
do
processID=`echo $LINE | awk -F "/" '{ print $3 }'`
ps -ef | grep $processID
done
