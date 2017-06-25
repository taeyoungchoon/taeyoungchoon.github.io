#-
export PS1="# "
date

#-
dmcdecode --type 1 | egrep -i product
dmidecode --type 4 | egrep –i version
lsb_release –a
cat /etc/redhat-release
hostname
dmidecode --type 1 | egrep –i serial

#-
cat /proc/cp* | grep ‘model n’ | uniq
cat /proc/cp* | grep ‘model n’ | wc -l
top -n 1 | grep ^Cpu
vmstat 3 5
#sar –u 3 5

#-
free -m | grep buffers/c | awk '{ print $3*100/($3+$4) }'
free -m | grep Mem
free -m | grep Swap | awk '{ print $3*100/($3+$4) }'
#free -m | perl -alne '/Swap/ && print $F[3]*100/($F[3]+$F[4])'

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

#-
netstat -f inet -rn
netstat -f inet -rn | perl -alne '/UG/ && system "ifconfig $F[-1]"'
netstat -f inet -rn | perl -alne '/UG/ && system "ping $F[1]"'

#-
ps -ef | wc -l
uptime

#-
cat /var/log/messages | egrep "warn|erro|crit" | wc -l
cat /var/log/messages | egrep "warn|erro|crit" | tail -5
