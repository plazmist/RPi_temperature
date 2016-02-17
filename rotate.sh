#!/bin/sh 
## add to crontab:
## 59 23 * * * sleep 50; /home/komissar/Scripts/RPi_temperature/rotate.sh

DIR=/home/komissar/Scripts/RPi_temperature
DAY=`date "+%Y-%m-%d"`

sudo cp /var/www/meteo.html /var/www/old/meteo_${DAY}.html

rm $DIR/temperature.dat
rm $DIR/humidity.dat
