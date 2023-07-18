#-
export PS1="# "
date

#-
dmidecode --type 1 | egrep -i product
dmidecode --type 4 | egrep -i version
# lsb_release –a
cat /etc/redhat-release
hostname
dmidecode --type 1 | egrep -i serial

#-
cat /proc/cp* | grep 'model n' | uniq
cat /proc/cp* | grep 'model n' | wc -l
top -n 1 | grep Cpu
vmstat 3 5 | awk 'NR < 3 { print } END { print }'
#sar –u 3 5

#-
#free -m | grep buffers/c | awk '{ print $3*100/($3+$4) }'
#free -m | grep Mem
#free -m | grep Swap | awk '{ print $3*100/($3+$4) }'
#free -m | perl -alne '/Swap/ && print $F[3]*100/($F[3]+$F[4])'
free -m | awk '/Mem/ { print int($7 * 100 / $2) }'

#-
df -h | head -1
df -h | grep /$
df -h | column -t | sort -k5
#hpacucli then ctrl all show config | grep logical | grep -v ok
#hpacucli then ctrl all show status
#dmsetup table
#lvs vgs pvs
#blkid lsblk
#cat /proc/mdstat

#-perl to shell/awk
#netstat --inet -rn
#netstat --inet -rn | perl -alne '/UG/ && system "ifconfig $F[-1]"'
#netstat --inet -rn | perl -alne '/UG/ && system "ping -c 3 $F[1]"'
ip r | awk '/^default/ { system("ip a s " $5) }' | awk '/inet / { print $2 }'
ip r | awk '/^default/ { system("ping -c 3 " $3) }'

#-
ps -ef | wc -l
uptime

#-journalctl -b --no-pager -p crit(2), err(3), warning(4) -p 2..4
#cat /var/log/messages | egrep "warn|erro|crit" | wc -l
#cat /var/log/messages | egrep "warn|erro|crit" | tail -5
journalctl -b --no-pager -p 2..4 | wc -l
journalctl -b --no-pager -p 2..4 | tail -3

#---------------------------------------------------------
#dmidecode --type 4 | grep Version
#dmidecode --type 4 | grep "Core Count"
#dmidecode --type 4 | grep "HT"
