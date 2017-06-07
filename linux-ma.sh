export PS1="# "
clear
date

echo "os"
dmcdecode --type 1 | grep Product
cat /etc/redhat-release
hostname

echo "cpu"
dmcdecode --type 4 | grep Version | uniq
dmcdecode --type 4 | grep Version | wc -l
top -n 1 | grep ^Cpu

echo "mem"
free -m | grep buffers/ | awk '{ print $3*100/($3+$4) }'
free -m | grep Mem
free -m | grep Swap | awk '{ print $3*100/($3+$4) }'

echo "dsk"
df -h | head -1
df -h | grep /$
df -h | column -t | sort -k5

echo "net"
netstat -rn
netstat --inet -an
ifconfig bond0

echo "proc"
ps -ef | wc -l
uptime
w

echo "log"
cat /var/log/messages | egrep "warn|erro|crit" | wc -l
cat /var/log/messages | egrep "warn|erro|crit" | tail -5
