#-
export PS1="# "
date
prtdiag -v
uname -a
hostname
showrev
prtdiag -v

#-
psrinfo -pv
prtdiag -v
sar –u 1 3
prstat –Z

#-
prtconf
swap –s
swap –l
df –h 

#-
df –h | grep /$
df –h | sort –k 5
#echo | format
#iostat -En
#zpool list
#zfs list
#metastat

#-
netstat -rn
ifconfig -a
#dladm show-link
ping

#-
prstat
#prstat -s cpu -n 10
uptime

#-
cat /var/adm/messages.log | egrep "warn|erro|crit" | wc -l
cat /var/adm/messages.log | egrep "warn|erro|crit" | tail -5

#-
#
