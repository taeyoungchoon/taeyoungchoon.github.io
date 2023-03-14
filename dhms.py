#!/usr/bin/env python3

s = 24 * 60 * 60 + 3663

d = int(s / (24 * 60 * 60))
s = int(s % (24 * 60 * 60))

h = int(s / (60 * 60))
s = s % (60 * 60)

m = int(s / 60)
s = s % 60

print("{} days {} hours {} minutes {} seconds".format(d, h, m, s))


