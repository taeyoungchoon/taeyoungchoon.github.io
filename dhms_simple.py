#!/usr/bin/env python3
#
# seconds to dhms(days, hours, minutes, seconds) without if
# simple but hard to understand

i = 24 * 60 * 60 + 60 * 60 + 60 + 1

dv = 24 * 60 * 60
hv = 60 * 60
mv = 60

# d = int( i / (24 * 60 * 60) )
# h = int( int( i % (24 * 60 * 60) ) / (60 * 60) )
# m = int( int( int( i % (24 * 60 * 60) ) % (60 * 60) ) / 60)
# s = int( int( int( i % (24 * 60 * 60) ) % (60 * 60) ) % 60)

d = int( i / dv )
h = int( int( i % dv ) / hv )
m = int( int( int( i % dv ) % hv ) / mv)
s = int( int( int( i % dv ) % hv ) % mv)

print("{}d {}h {}m {}s".format(d, h, m, s))

