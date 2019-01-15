#!/usr/bin/env python

import sys
import os
import math
import random
import datetime

foo = 1
bar = 'hi'
lt = []
lt = [1, 2, 3]
lt = ['a', 'b', 'c']
kv = {}
kv = {1:2, 3:4}
kv = {'love':'me', 'hate':'you'}
ml = """
this is the line one
then two
"""
# tuple, set

if True:
    print 'right'

for num in range(3):
    print num

value = 0
maxium = 3
while True:
    print value
    val = value + 1
    if val == maxium:
        exit(0)

def hi(to='jack'):
    print('this is it')
    print('say number %d as %s' % (foo, bar))
    out = 'hello', to
    return out

def hi(to='jack')

hi()
hi(to='someone')

