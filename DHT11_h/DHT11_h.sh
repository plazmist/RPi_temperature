#!/bin/sh 
# HUMIDITY
dir=/home/komissar/Scripts/Temperature/DHT11_h
target=$dir/middle.txt
result=$dir/DHT11_h.html
DATE=`date "+%Y-%m-%d %H:%M:%S"`
VALUE=`sudo /home/komissar/Scripts/Adafruit-Raspberry-Pi-Python-Code/Adafruit_DHT_Driver/Adafruit_DHT 11 4 | grep Temp | awk '{print $7}'`
while [ -z "$VALUE" ]
do
        sleep 7 
        VALUE=`sudo /home/komissar/Scripts/Adafruit-Raspberry-Pi-Python-Code/Adafruit_DHT_Driver/Adafruit_DHT 11 4 | grep Temp | awk '{print $7}'`
done
echo "[(new Date(\"${DATE}\")).getTime(),${VALUE}]," >> $target

cat $dir/part1.html > $result
cat $target >> $result
cat $dir/part2.html >> $result

sudo cat $result > /var/www/DHT11_h.html

 