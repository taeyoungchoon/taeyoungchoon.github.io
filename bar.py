#!/usr/bin/env python

# from os import *

lt1 = [0, 1, 2]
lt2 = ['apple', 'coffee', 'love']
kv1 = {1:2, 3:4}
kv2 = {'editor':'emacs', 'note':'moleskine'}

def hello( name ):
    print "hello", name
    return

hello( name="world")

print "I am using %s and %s" % (kv2['editor'], kv2['note'])

if True:
    print """
this is the poem
or the end of it
or not"""

# print "\r"
    
for number in range(5):
    print number,

# in = raw_input('>')
# print "Your input: %s" % in
