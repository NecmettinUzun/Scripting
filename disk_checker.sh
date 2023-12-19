#!/bin/bash

#Degiskenleri tanimla
TMP1="/argela/scripts/PROBE_DISK_CHECK/disk_monitor_mail"
count=0

### NOTES ###
## dosyadan 5.satiri okuyunca 90% gibi % ifadesi geliyor.Bu durumda karsilastirma sirasinda int olarak algilamiyor.
## Bu nedenle bi daha % 'ye parcalayip 1.satirini aldik'

#df -hP > memory.txt

cat memory.txt | while read LINE 
do

        let count++

        if [[ $count -ge 2 ]]; then

                percentage=`echo $LINE | awk -F" " '{print $5}'`

                # 5.satirda okunan deger 70% gibi bir deÃ°olabilir. Bu degerden % isaretini ayirmak lazim.
                percentage_int=`echo $percentage | awk -F"%" '{print $1}'`
                #echo percentage_int : $percentage_int

                #length
                l=${#percentage_int}

                directory=`echo $LINE | awk -F" " '{print $6}'`
                echo directory : $directory

                directory_sub=`echo $directory | awk -F"/" '{print $2}'`
                echo directory_sub : $directory_sub

                

                #eger boyutu 0 'dan buyukse islem yap.
                if [[ $l -ne 0 ]]; then

                        # Eger oran 90 'dan fazla ise o zaman disk problemi vardir.
                        if [[ $percentage_int -ge 90 ]]; then


                                echo percentage : $percentage_int

 								if [[ mnt != $directory_sub ]]; then
                                    
                                          echo $(date) > $TMP1
										  echo $(hostname) isimli sunucuda, >> $TMP1
										  echo "To:DLTG_NW_Argela_Alarms@tt-tim.tr" >> $TMP1
										  echo "From:argela.probe@tt-tim.tr" >> $TMP1
										  echo "Subject: Probe disk Problemi" >> $TMP1
										  echo "" >> $TMP1
										  su - root -c "ssmtp DLTG_NW_Argela_Alarms@tt-tim.tr < /argela/scripts/PROBE_DISK_CHECK/disk_monitor_mail"

                                fi

                        fi


                fi


        fi


        #statements
done
