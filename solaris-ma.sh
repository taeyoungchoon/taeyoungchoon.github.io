#-
export PS1="# "
date
prtdiag -v | grep ^System
uname -a
hostname
showrev
#hostid
prtdiag -v

#-
psrinfo -pv
prtdiag -v
sar –u 1 3
prstat –Z

#-
prtconf | grep ^Mem
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
prtat
#prstat -s cpu -n 10
uptime

#-
cat /var/adm/messages.log | egrep "warn|erro|crit" | wc -l
cat /var/adm/messages.log | egrep "warn|erro|crit" | tail -5

#------------------------------------------------------------------------------
#prstat -Z
#echo ::memstat | mdb -k
#top -n 1
#svcs | grep cron
#svcadmin restart cron
