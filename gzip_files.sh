#!/bin/bash
for f in *.txt.gz
do
  gunzip $f
done
