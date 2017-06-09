export PS1="# "
clear
date

echo "os"
dmcdecode --type 1 | grep Product
dmidecode --type 1 | egrep –i ‘product|serial’
dmidecode --type 4 | grep –i version
lsb_release –a
cat /etc/redhat-release
hostname

echo "cpu"
dmcdecode --type 4 | grep Version | uniq
dmcdecode --type 4 | grep Version | wc -l
cat /proc/cp* | grep ‘el n’
cat /proc/cp* | grep ‘el n’ | wc -l
top -n 1 | grep ^Cpu
vmstat 3 5
sar –u 3 5

echo "mem"
free -m
free -g
free -m | grep buffers/c | awk '{ print $3*100/($3+$4) }'
free -m | grep Mem
free -m | grep Swap | awk '{ print $3*100/($3+$4) }'

echo "dsk"
df -h | head -1
df -h | grep /$
df -h | column -t | sort -k5
hpacucli then ctrl all show config
hpacucli then ctrl all show status

echo "net"
netstat -rn
netstat --inet -an
ifconfig bond0
ifconfig eth0

echo "proc"
ps -ef | wc -l
uptime
w

echo "log"
cat /var/log/messages | egrep "warn|erro|crit" | wc -l
cat /var/log/messages | egrep "warn|erro|crit" | tail -5
