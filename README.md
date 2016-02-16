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
* * * * * /home/komissar/Scripts/Temperature/gen.sh
1-59/2 * * * * /home/komissar/Scripts/Temperature/DHT11_t/DHT11_t.sh
*/2 * * * * /home/komissar/Scripts/Temperature/DHT11_h/DHT11_h.sh
```

 - Rotate
```
1 0 * * * /home/komissar/Scripts/Temperature/DHT11_t/rotate.sh 1
1 0 * * * /home/komissar/Scripts/Temperature/DHT11_h/rotate.sh 1
```
