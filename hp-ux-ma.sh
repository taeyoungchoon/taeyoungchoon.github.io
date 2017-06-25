#-
set -o emacs
export PS1="# "

#-
date
machinfo | egrep -i ‘model'
machinfo | egrep -i ‘release'
hostname
machinfo | egrep -i ‘serial'
#netstat -f inet -rn | perl -alne '/UG/ && system "ifconfig $F[-1]"' | egrep "inet "

#-
machinfo | egrep -i proc
vmstat 3 3

#-
swapinfo -atm | grep mem
machinfo | grep ^Mem
swapinfo -atm | grep dev

#-
df -Pk | grep /$
df -Pk | sed 's/%//' | sort -k 5
#df -Pk | perl -alne 'print "@{[map { $_ =~ /^\d+$/ ? int $_/1024/1024 : $_ } @F]}"'

#-
netstat -f inet -rn
netstat -f inet -rn | grep UG | awk '{ print "ifconfig " $6 }' | sh
#netstat -f inet -rn | perl -alne '/UG/ && system "ifconfig $F[-1]"'
netstat -f inet -rn | grep UG | awk '{ print "ping " $2 }' | sh
#netstat -f inet -rn | perl -alne '/UG/ && system "ping $F[1]"'

#-
ps -ef | wc -l
uptime

#-
cat /var/adm/syslog/syslog.log | egrep "warn|erro|crit" | wc -l
cat /var/adm/syslog/syslog.log | egrep "warn|erro|crit" | tail -5

#- 
#swinfo lvdisplay lanscan ioscan
