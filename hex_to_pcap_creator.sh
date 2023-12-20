#!/bin/bash

echo  "source file" $1
echo "destination file" $2

sourceFile=$1
destFile=$2

xxd -r -p $sourceFile $sourceFile.bin
od -Ax -tx1 -v $sourceFile.bin | text2pcap - $destFile.pcap
