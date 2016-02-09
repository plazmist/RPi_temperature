#!/bin/sh

dir=/home/komissar/Scripts/Temperature
target=$dir/middle.txt

echo -n  "[(new Date(\"" >> $target
echo -n `date "+%Y-%m-%d %H:%M:%S"` >> $target
echo -n "\")).getTime()," >> $target
tt=`/opt/vc/bin/vcgencmd measure_temp | cut -c 6-9` 
echo -n $tt >> $target
echo "]," >> $target

result=$dir/result.html

cat $dir/part1.html > $result
cat $dir/middle.txt >> $result
cat $dir/part2.html >> $result

cat $result > /var/www/t.html

 
