#!/usr/bin/env python
import serial
import time
import sys

ser = serial.Serial('/dev/ttyACM0', 9600)

while 1:
    current_time = time.strftime("%Y/%m/%d %H:%M:%S", time.localtime())  
    print current_time +","+ser.readline().rstrip("\n\r")
    sys.stdout.flush()
    
