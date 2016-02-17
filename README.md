# RPi_temperature

 - lookup 
```
arp -n | grep -w -i 'b8:27:eb:b6:dd:d8' | awk '{print $1}'
```

 - Adafruit Driver
```
https://github.com/adafruit/Adafruit-Raspberry-Pi-Python-Code
```

 - crontab -e
```
* * * * * /home/komissar/Scripts/RPi_temperature/meteo.sh
```

 - Rotate
```
59 23 * * * sleep 50; /home/komissar/Scripts/RPi_temperature/rotate.sh
```
