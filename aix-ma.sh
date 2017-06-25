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
