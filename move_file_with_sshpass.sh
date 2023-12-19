#!/bin/bash

# Connection Info
toDirectory=/home/dump
fromDirectory=/home/test/data/dump_files
user=""
password=""
destHost=""

# get all pcap files and send with SCP step-by-step
for file in $fromDirectory/*.pcap
        do
                #echo "File: " $file
                #sshpass -p  $password sftp -r -o StrictHostKeyChecking=no -o ConnectTimeout=3 $user@$destHost:$toDirectory <<< put $file
                sshpass -p $password scp $file $user@$destHost:$toDirectory
                # is Succes, Delete file
                sleep 1
                if [ $? == "0" ]; then
                        rm -rf $file
                        #echo " This file deleted " $file
                fi
        done
