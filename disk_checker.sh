#!/bin/bash

## Script to check disk occupancy rates
###

count=0
df -hP > memory.txt
cat memory.txt | while read LINE 
do
        let count++
        if [[ $count -ge 2 ]]; then

                percentage=`echo $LINE | awk -F" " '{print $5}'`
                percentage_int=`echo $percentage | awk -F"%" '{print $1}'`
        	echo percentage_int : $percentage_int

                #length
                l=${#percentage_int}

                directory=`echo $LINE | awk -F" " '{print $6}'`
                echo directory : $directory

                directory_sub=`echo $directory | awk -F"/" '{print $2}'`
                echo directory_sub : $directory_sub
                if [[ $l -ne 0 ]]; then
                        if [[ $percentage_int -ge 90 ]]; then
                                echo percentage : $percentage_int
 				if [[ mnt != $directory_sub ]]; then
                                    ## send e-mail
                                fi
                        fi
                fi
        fi
done
