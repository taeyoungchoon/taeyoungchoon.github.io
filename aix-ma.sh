clear
date

lsattr -El sys0
lsdev -Cc processor
vmstat 3
df -k
iostat -t 3
ifconfig -a
netstat -rn
ping
topas
last
errpt

oslevel -r
(topas ((cpu memory) usage))
df -k | sort -k4
prtconf

* more

prtconf -s
prtconf -m
