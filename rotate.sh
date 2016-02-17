#!/bin/sh 

DIR=/home/komissar/Scripts/RPi_temperature
DAY=`date -d "${DAYS_AGO} day ago" "+%Y-%m-%d"`

sudo cp /var/www/meteo.html $DIR/old/meteo_${DAY}.html 
rm $DIR/temperature.dat
rm $DIR/humidity.dat
