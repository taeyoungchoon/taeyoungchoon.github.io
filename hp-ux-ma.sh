## general
date
hostname
machinfo | grep model
machinfo | grep release
machinfo | grep serial
# ifconfig en0

## cpu (Itanum 2 9100)
machinfo | grep proc
# glance

## memory (79% / 8GB)
# glance
machinfo | grep ^Mem
# glance
# swapinfo

## disk
df -Pk | grep /$
df -Pk | sort -k5

## net
# ifconfig en0
netstat -rn
# netstat -an
# ethtool

## proc
ps -ef | wc -l

## uptime
uptime

## user
w

## log
cat /var/adm/syslog/syslog.log | egrep "warn|erro|crit"
