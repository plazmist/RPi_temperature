#!/bin/sh 

DIR="/home/komissar/Scripts/RPi_temperature"
Adafruit_DHT="/home/komissar/Scripts/Adafruit-Raspberry-Pi-Python-Code/Adafruit_DHT_Driver/Adafruit_DHT"
DAY=`date "+%Y-%m-%d"`
DATE=`date "+%Y-%m-%d %H:%M:%S"`
VALUE=`sudo ${Adafruit_DHT} 11 4 | grep Temp`
while [ -z "$VALUE" ]
do
        sleep 7 
        VALUE=`sudo ${Adafruit_DHT} 11 4 | grep Temp`
done
TMP=$(echo $VALUE | cut -d' ' -f 3)
HUM=$(echo $VALUE | cut -d' ' -f 7)
CORE=`/opt/vc/bin/vcgencmd measure_temp | cut -c 6-9` 

echo "[(new Date(\"${DATE}\")).getTime(),${TMP}]," >> $DIR/temperature.dat
echo "[(new Date(\"${DATE}\")).getTime(),${HUM}]," >> $DIR/humidity.dat
echo "[(new Date(\"${DATE}\")).getTime(),${CORE}]," >> $DIR/core.dat

cp $DIR/meteo_template.html $DIR/meteo.html

sed -i "s/{{DAY}}/${DAY}/g" $DIR/meteo.html

sed -i "/{{TEMPERATURE}}/r $DIR/temperature.dat" $DIR/meteo.html
sed -i '/{{TEMPERATURE}}/d' $DIR/meteo.html

sed -i "/{{HUMIDITY}}/r $DIR/humidity.dat" $DIR/meteo.html
sed -i '/{{HUMIDITY}}/d' $DIR/meteo.html

sed -i "/{{CORE}}/r $DIR/core.dat" $DIR/meteo.html
sed -i '/{{CORE}}/d' $DIR/meteo.html

sudo cp $DIR/meteo.html /var/www/
