#!/bin/sh

DIR=/home/komissar/Scripts/RPi_temperature
DAY=`date "+%Y-%m-%d"`
DATE=`date "+%Y-%m-%d %H:%M:%S"`
VALUE=`/opt/vc/bin/vcgencmd measure_temp | cut -c 6-9` 

echo  "[(new Date(\"${DATE}\")).getTime(),${VALUE}]," >> $DIR/core.dat

cp $DIR/core_template.html $DIR/core.html

sed -i "s/{{DAY}}/${DAY}/g" $DIR/core.html

sed -i "/{{TEMPERATURE}}/r $DIR/core.dat" $DIR/core.html
sed -i '/{{TEMPERATURE}}/d' $DIR/core.html

sudo cp $DIR/core.html /var/www/
