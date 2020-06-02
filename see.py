#!/usr/bin/env python3
# from os import *

lt1 = [0, 1, 2]
lt2 = ['apple', 'coffee', 'love']
kv1 = {1: 2, 3: 4}
kv2 = {'editor':'emacs', 'note':'moleskine'}

def hello(x, y):
    print("hello", x, ", ", y)
    return

hello(x="world", y="raul")

print("I am using %s and %s" % (kv2['editor'], kv2['note']))

if True:
    print("""
this is the poem
or the end of it
or not""")

for number in range(0, 3):
    print(number)

# in = raw_input('>')
# print "Your input: %s" % in

print(1, "-", 2)
print("{}-{}".format(1.33, 2))
print("%d-%d" % (1.33, 2))
