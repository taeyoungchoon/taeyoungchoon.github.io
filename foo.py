#!/usr/bin/env python
#
class Host:
    def __init__(self, machine, role):
        self.machine = machine
        self.role = role
        self.age = 0
        self.power = []

import re

line = "this is the line"
match = re.search('the', line)
print(match.group(0))

line = "this-is-the"
lt = line.split('-')

f = lambda a, b : a + b
f(1, 2)

for i in range(1, 10):
    if i % 2 == 0:
        print(i)

from math import sin, cos, tan

print("{}: {}".format(1, 2))

def summy(a, b):
    return a + b

print(summy(1, 2))

kv = {'raul': 99, 'jack': 23}
print(kv['raul'])

kv['raul'] = 100
print(kv['raul'])

print([i for i in range(1, 5)])

from math import radians, pi
import sys

value = input("input num : ")

print(f(1, 2))

{'E': [1,2]}
{'A': "lakjsdlf"}

try:
    if int(value) == int:        
        pass
except:
    pass

