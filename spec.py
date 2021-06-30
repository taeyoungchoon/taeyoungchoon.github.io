#!/usr/bin/env python3

import subprocess
from re import search

output = subprocess.getoutput("lshw -c cpu -c memory -c disk -c network -short")

print("* spec report")
for line in output.splitlines():
    if search("processor", line):
        print(*line.split()[2:100])
    if search("memory.*Hz", line):
        print(*line.split()[2:100])
    if search("disk", line):
        print(*line.split()[3:100])
    if search("network.*bit", line):
        print(*line.split()[3:100])
