#!/bin/bash

# butun swap kullanimlarini sirala ve dosyaya yaz.
# -n : sayisal olarak sirala. numerical
# -r : sonucu ters cevir. Normalde kucukten buyuge siralar ama biz buyukten kucuge gormek istiyoruz.
# -k : 2.kolona gore siralama yap.Default dosyanin sonuna kadar ama aralikta verilebilir.

grep VmSwap /proc/*/status | sort -k 2 -n -r > tmp.txt


# en cok swap kullanan 10 processi baska dosyaya al
head -10 tmp.txt > tmp2.txt

# Dosyayi satir satir oku ve PID degerine gore adini bul
cat tmp2.txt | while read LINE
do
processID=`echo $LINE | awk -F "/" '{ print $3 }'`
ps -ef | grep $processID
done
