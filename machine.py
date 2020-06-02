#!/usr/bin/env python3

import time
import sys

path = os.getcwd()
lt =  os.listdir(path)

class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y

aPoint = Point(10, 10)
bPoint = Point(10, 10)

class Machine:
    pass

class OperatingSystem:
    pass

class Network:
    ip = ''
    nm = ''
    gw = ''
    ns = ''

class Interface:
    name = ''

nic = Interface()
nic.name = 'eth0'
print(nic.name)



    
