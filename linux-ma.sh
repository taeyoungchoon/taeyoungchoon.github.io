export PS1="# "
clear
date
dmcdecode --type 1 | grep Product
cat /etc/redhat-release
hostname
dmcdecode --type 4 | grep Version | uniq
dmcdecode --type 4 | grep Version | wc -l

top -n 1 | grep ^Cpu
free -m | grep buffers/ | awk '{ print $3*100/($3+$4) }'
free -m | grep Mem
free -m | grep Swap | awk '{ print $3*100/($3+$4) }'

df -h | head -1
df -h | grep /$
df -h | sort -k5

netstat -rn
netstat --inet -an
ifconfig bond0

ps -ef | wc -l
uptime
w
cat /var/log/messages | egrep "warn|erro|crit" | wc -l
cat /var/log/messages | egrep "warn|erro|crit" | tail -5
