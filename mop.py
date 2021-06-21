#!/usr/bin/env python3
#
# maintenance output parser
# version: 0.0.1
# written by t0spring

import sys
from re import search

(flash_total, flash_used, flash_free) = (0, 0, 0)

print("")
print("* start parsing --------------------------------------------------")
for line in sys.stdin:
    if search("uptime is", line):
        hostname = search("(.*) uptime is", line).group(1)
    if search("Model [n|N]umber", line):
        model = search(".* : (.*)", line).group(1)
    if search("System [s|S]erial [n|N]umber", line):
        sn = search(".* : (.*)", line).group(1)
    if search("Core \d: CPU util", line):
        print(line)
        mobj = search("seconds: (\d+)%; one minute: (\d+)%; five minutes: (\d+)%", line)
        (five_sec, one_min, five_min) = (mobj.group(1), mobj.group(2), mobj.group(3))
    if search("^CPU util", line):
        mobj = search("seconds: (\d+)%/\d+%+; one minute: (\d+)%; five minutes: (\d+)%", line)
        (five_sec, one_min, five_min) = (mobj.group(1), mobj.group(2), mobj.group(3))
    if search("Processor Pool", line):
        mobj = search("Total:\s+(\d+) Used:\s+(\d+) Free:\s+(\d+)", line)
        (total, used, free) = (mobj.group(1), mobj.group(2), mobj.group(3))
    if search("System memory", line):
        mobj = search("System memory\s+: (\d+)K total, (\d+)K used, (\d+)K free", line)
        (total, used, free) = (mobj.group(1), mobj.group(2), mobj.group(3))
    if search("bytes total", line):
        mobj = search("(\d+) bytes total \((\d+) bytes free\)", line)
        (flash_total, flash_free) = (mobj.group(1), mobj.group(2))
        flash_used = int(flash_total) - int(flash_free)
    if search("Cisco IOS", line):
        ios=line.split(' ')[7].split(',')[0]
    if search("BOOTLDR", line):
        bootldr=line.split(' ')[6]
    if search("POWER is OK", line):
        power = "ok"
    if search("1[AB]\s+\w+-\w+-\w+\s+\w+\s+OK", line):
        power = "ok"
    if search("Built-in\s+Good", line):
        power = "ok"
    if search("FAN is OK", line):
        fan = "ok"
    if search("FAN \d is OK", line):
        fan = "ok"
    if search("TEMPERATURE is OK", line):
        temperature = "ok"

# Core 0-3 CPU utilization : (1 2 3 4) / cores

print("* rpt ------------------------------------------------------------")
print("- hostname :", hostname)
print("- model :", model)
print("- serial number :", sn)
print("- ios :", ios)
print("- boot loader :", bootldr)
print("- cpu(5s 1m 5m) :", five_sec, one_min, five_min)
print("- memory(total used free) :", total, used, free)
print("- flash(total used free) :", flash_total, flash_used, flash_free)
print("- temperature :", temperature)
print("- power :", power)
print("- fan :", fan)

# chk
#
# cat "host(192.168.0.1).txt" | python3 sw.py
# for file in *.txt; do echo $file; cat "$file" | python3 sw.py $file; sleep 1; done

