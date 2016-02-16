#!/bin/sh 
# HUMIDITY
DIR=/home/komissar/Scripts/Temperature/DHT11_h
DAY=`date "+%Y-%m-%d"`
DATE=`date "+%Y-%m-%d %H:%M:%S"`
VALUE=`sudo /home/komissar/Scripts/Adafruit-Raspberry-Pi-Python-Code/Adafruit_DHT_Driver/Adafruit_DHT 11 4 | grep Temp | awk '{print $7}'`
while [ -z "$VALUE" ]
do
        sleep 7 
        VALUE=`sudo /home/komissar/Scripts/Adafruit-Raspberry-Pi-Python-Code/Adafruit_DHT_Driver/Adafruit_DHT 11 4 | grep Temp | awk '{print $7}'`
done
echo "[(new Date(\"${DATE}\")).getTime(),${VALUE}]," >> $DIR/middle.txt

cat $DIR/part1.html > $DIR/DHT11_h.html
cat $DIR/middle.txt >> $DIR/DHT11_h.html
cat $DIR/part2.html >> $DIR/DHT11_h.html

sed -i "s/{{DAY}}/${DAY}/g" $DIR/DHT11_h.html

sudo cp $DIR/DHT11_h.html /var/www/T
 
