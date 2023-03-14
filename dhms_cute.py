#!/usr/bin/env python3
#
# seconds to dhms(days, hours, minutes, seconds) without if
# cute, think about it

i = 24 * 60 * 60 + 60 * 60 + 60 + 1

m = i / 60
s = i % 60

h = m / 60
m = m % 60

d = h / 24
h = h % 24

print("{:.0f}d {:.0f}h {:.0f}m {}s".format(d, h, m, s))
## using f-string
# print(f"{int(d)}d {int(h)}h {int(m)}m {s}s")
