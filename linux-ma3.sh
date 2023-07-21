# wrap
function wrap () {
    eval "$*"
    echo '---'
}
# p0: timestamp
wrap date
# p1: os
wrap cat /etc/redhat-release
# p2: product
wrap dmidecode --type 1 | egrep -i product
# p3: hostname
wrap hostname
# p4: cpu
wrap cat /proc/cpuinfo | grep 'model n' | uniq
# p5: memory 
wrap free -m
# p6: kernel version
wrap uname -r
# p7: cpu usage 
wrap top -b -n 1 | grep Cpu
# p8: memory usage
if free | grep avail &>/dev/null; then 
    wrap free -m | awk '/Mem/ { print ($2-$7)*100/$2}'
else
    wrap free -m | awk '/cache:/ { print $3*100/($3+$4) }'
fi
# p9: disk usage
wrap df -Ph | column -t | sed 's/%//' | sort -k5 -r
# p10: system log
#-journalctl -b --no-pager -p crit(2), err(3), warning(4) -p 2..4
if which journalctl &>/dev/null; then
    wrap journalctl -b --no-pager -p 2..4 | tail -3 | cat -n
else
    wrap cat /var/log/messages | egrep -i "warn|erro|crit" | tail -3 | cat -n
fi
# p11: boot log
wrap dmesg | tail -3 | cat -n
# p12: last logged in users
wrap last | head -3 | cat -n
# p13: history
#history -c
#export HISTSIZE=0
# p14: network
wrap ip r | awk '/^default/ { system("ip a s " $5) }' | awk '/inet / { print $2 }'
wrap ip r | awk '/^default/ { system("ping -c 3 " $3) }'
# fine ----------------------------------------------------------------------
