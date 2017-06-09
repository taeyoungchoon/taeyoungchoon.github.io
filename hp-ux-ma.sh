clear

## general
date
hostname
machinfo | egrep -i ‘model|serial|release’

## cpu (Itanum 2 9100)
machinfo | grep -i proc
# glance

## memory (79% / 8GB)
# glance
machinfo | grep ^Mem
# glance
swapinfo -atm

## disk
df -Pk | grep /$
df -Pk | sort -k5
strings /etc/lvmtab
lvdisplay -v /dev/vg00 lvol1
ioscan -funC fc

## net
# ifconfig en0
ioscan -funC lan
netstat -rn
netstat -an

## proc
ps -ef | wc -l

## uptime
uptime

## user
w

## log
cat /var/adm/syslog/syslog.log | egrep "warn|erro|crit" | wc -l
cat /var/adm/syslog/syslog.log | egrep "warn|erro|crit" | tail -5
