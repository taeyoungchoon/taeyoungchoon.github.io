#-
export PS1="# "
date

#-
lsattr -El sys0
lsdev -Cc processor
vmstat 3
df -k
iostat -t 3

#-
topas
prtconf

#-
df -k | sort -k4

#-
netstat -rn
ifconfig
ping

#-
errpt

#-
#prtconf -s
#prtconf -m
#oslevel -r
#oslevel -s

# svmon -G | grep ^memory | awk '{ print ($4+$6)*100/$2 }'
# svmon -G | grep ^pg | awk '{ print $4*100/$2 }'

# svmon -O summary=basic,unit=auto
# df -Pg | sort -k5n | tail -2

# smtctl
# bindprocessor -q
# lsdev -Cc processsor
# lsdev -Cc disk
# lsdev -Cc if
# lsdev -Cc adapter

# resize?
# uname -amMI
# uname -L
# ifconfig -l
# lscfg -v

# df -k
# du -sk *
# sar 1 5
# sar -P ALL 1 5
# vmstat 1 5
# sar -q 1 5
# ps aux
# svmon -G
# iostat
# netstat -v?
# netstat -m

