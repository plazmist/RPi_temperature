#!/bin/sh 
DAYS_AGO=$1
DIR=/home/komissar/Scripts/Temperature/DHT11_t
DAY=`date -d "${DAYS_AGO} day ago" "+%Y-%m-%d"`

grep $DAY $DIR/middle.txt > $DIR/middle_${DAY}.txt

cat $DIR/part1.html > $DIR/T/DHT11_${DAY}.html
cat $DIR/middle_${DAY}.txt >> $DIR/T/DHT11_${DAY}.html
cat $DIR/part2.html >> $DIR/T/DHT11_${DAY}.html

sed -i "s/{{DAY}}/${DAY}/g" $DIR/T/DHT11_${DAY}.html

rm $DIR/middle_${DAY}.txt

sudo cp $DIR/T/DHT11_${DAY}.html /var/www/T

 
