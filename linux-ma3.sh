# p0: timestamp
date
# p1: os
test -e /etc/redhat-release && cat /etc/redhat-release || cat /etc/os-release | egrep -i "^(name|version=)"
# p2: product
dmidecode --type 1 | egrep -i product
# p3: hostname
hostname
# p4: cpu
cat /proc/cpuinfo | grep 'model n' | uniq
# p5: memory 
free -m | grep Mem
# p6: kernel version
uname -a
# p7: cpu usage 
top -b -n 1 | grep Cpu | awk '{ print $2 + $4 }'
# p8: memory usage
if free | grep avail &>/dev/null; then
    echo avail
    free -m | awk '/Mem/ { print ($2-$7)*100/$2}'
else
    echo old
    free -m | awk '/cache:/ { print $3*100/($3+$4) }'
fi
# p9: disk usage
df -Ph | column -t | sed 's/%//' | sort -k5 -r -n | head -5
# p10: system log
#-journalctl -b --no-pager -p crit(2), err(3), warning(4) -p 2..4
# if which journalctl &>/dev/null; then
#     journalctl -b --no-pager -p 2..4 | tail -3 | cat -n
# else
#     cat /var/log/messages | egrep -i "warn|erro|crit" | tail -3 | cat -n
# fi
# p11: boot log
dmesg | tail -3 | cat -n
# p12: last logged in users
last | head -3 | cat -n
# p13: history
#history -c
#export HISTSIZE=0
# p14: network
ip r | awk '/^default/ { system("ip a s " $5) }' | awk '/inet / { print $2 }'
ip r | awk '/^default/ { system("ping -c 3 " $3) }'
# fine ----------------------------------------------------------------------
dmidecode --type memory | egrep "Size:.*(MB|GB)"
which journalctll
