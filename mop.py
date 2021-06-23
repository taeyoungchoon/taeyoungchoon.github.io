#!/usr/bin/env python3
#
# maintenance output parser
# version: 0.0.5
# written by t0spring
#

import sys
from re import search

fan="none"
(flash_total, flash_used, flash_free) = (0, 0, 0)
show=0
# req : c4500 : show env
temperature="nil"

print("")
print("* start parsing --------------------------------------------------")
for line in sys.stdin:
    if search("show", line):
        show = show + 1
    if search("uptime is", line):
        hostname = search("(.*) uptime is", line).group(1)

    if search("Model [n|N]umber", line):
        model = search(".* : (.*)", line).group(1).strip()
    if search("PID: CISCO2901/K9", line):
        model = search("PID: (CISCO2901/K9)", line).group(1)
    if search("PID: WS-C450\d-E", line):
        model = search("PID: (WS-C450\d-E)", line).group(1)

    if search("System [s|S]erial [n|N]umber", line):
        sn = search(".* : (.*)", line).group(1).strip()
    if search("Hw Serial#: \w+,", line):
        sn = search("Hw Serial#: (\w+),", line).group(1)
    if search("PID: WS-C450\d-E\s+, VID: V0\d\s+,\sSN: \w+", line):
        sn = search("PID: WS-C450\d-E\s+, VID: V0\d\s+,\sSN: (\w+)", line).group(1)
        
    if search("Core \d: CPU util", line):
    #if search("Core 0: CPU util", line):
        print(line)
        mobj = search("seconds: (\d+)%; one minute: (\d+)%; five minutes: (\d+)%", line)
        (five_seconds, one_minute, five_minutes) = (mobj.group(1), mobj.group(2), mobj.group(3))
    if search("^CPU util", line):
        mobj = search("seconds: (\d+)%/\d+%+; one minute: (\d+)%; five minutes: (\d+)%", line)
        (five_seconds, one_minute, five_minutes) = (mobj.group(1), mobj.group(2), mobj.group(3))

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

    if search("Cisco IOS Software, C\d", line):
        ios=line.split()[7]
    if search("Cisco IOS Software, Ca", line):
        ios=line.split()[10]
    if search("Cisco IOS Software, IOS-XE Software, Catalyst L3", line):
        ios = line.split()[11]
    if search("Cisco IOS Software, IOS-XE Software, Catalyst 45", line):
        ios = line.split()[12]
    if search("Cisco IOS Software \[", line):
        ios = line.split()[10]
        
    if search("^ROM: \w+", line):
        bootldr=line.split(' ')[1].strip()
    if search("ROM: System Bootstrap", line):
        bootldr=line.split(' ')[4].split(',')[0]
    if search("BOOTLDR", line):
        tks = line.split()
        if len(tks) == 2:
            bootldr = tks[1]
        else:
            bootldr = tks[6].split(',')[0]

    if search("POWER is OK", line):
        power = "ok"
    if search("1[AB]\s+\w+-\w+-\w+\s+\w+\s+OK", line):
        power = "ok"
    if search("Power Supply \d+V Output Status: Normal", line):
        power = "ok"
    if search("Built-in\s+Good", line):
        power = "ok"
    if search("^PS\d", line):
        print(line.strip())
        if(line.split()[-1] == "good"):
            power = "ok"        
    if search("FAN is OK", line):
        fan = "ok"
    if search("System Fan OK line", line):
        fan = "ok"
    if search("FAN \d is OK", line):
        fan = "ok"

    if search("TEMPERATURE is OK", line):
        temperature = "ok"
    if search("^Temperature Value: \d+ Degree Celsius", line):
        temperature = search("Temperature Value: (\d+) Degree Celsius", line).group(1)
    if search("^Inlet Temperature Value: \d+ Degree Celsius", line):
        temperature = search("^Inlet Temperature Value: (\d+) Degree Celsius", line).group(1)
    if search("^System Temperature Value: \d+ Degree Celsius", line):
        temperature = search("^System Temperature Value: (\d+) Degree Celsius", line).group(1)
    if search("Exhaust Fan temperature: \d+ Celsius, Normal", line):
        temperature = search("Exhaust Fan temperature: (\d+) Celsius", line).group(1)

print("* show cli count :", show)
        
print("* rpt ------------------------------------------------------------")
print("- hostname :", hostname)
print("- model :", model)
print("- serial number :", sn)
print("- ios :", ios)
print("- boot loader :", bootldr)
print("- cpu(5s 1m 5m) :", five_seconds, one_minute, five_minutes)
print("- memory(total used free) :", total, used, free)
print("- flash(total used free) :", flash_total, flash_used, flash_free)
print("- temperature :", temperature)
print("- power :", power)
print("- fan :", fan)

# for file in *.txt; do echo $file; cat "$file" | python3 mop.py $file; done &> mop.out

