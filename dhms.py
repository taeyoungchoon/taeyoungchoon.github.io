#!/usr/bin/env python3
#
# seconds to dhms(days, hours, minutes, seconds) without if
# easy to understand but long enough

s = 24 * 60 * 60 + 60 * 60 + 60 + 1

dv = 24 * 60 * 60
hv = 60 * 60
mv = 60

# d = int(s / (24 * 60 * 60))
# s = int(s % (24 * 60 * 60))

# h = int(s / (60 * 60))
# s = s % (60 * 60)

# m = int(s / 60)
# s = s % 60

d = int(s / dv)
s = s % dv

h = int(s / hv)
s = s % hv

m = int(s / mv)
s = s % mv

print("{}d {}h {}m {}s".format(d, h, m, s))

