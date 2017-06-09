clear
date

psrinfo -pv
prtdiag -v
sar –u 1 3
prstat –Z

prtconf
swap –s
swap –l
df –h 

df –h | grep /$
df –h | sort –k 5

echo | format
iostat -En

zpool list
zfs list

ifconfig
dladm show-link
netstat -rn
ping

prstat
prstat -s cpu -n 10

uptime
w

cat /var/adm/syslog.log | egrep "warn|erro|crit" | wc -l
cat /var/adm/syslog.log | egrep "warn|erro|crit" | tail -5
