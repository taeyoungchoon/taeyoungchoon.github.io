
function t_os {
    test -e /etc/redhat-release \
	&& cat /etc/redhat-release \
	|| cat /etc/os-release | egrep -i "^(name|version=)"
}

function t_product { dmidecode --type 1 | grep -i product; }

function t_mem_usage {	
    if free | grep avail >/dev/null 2>/dev/null; then
	echo avail
	free -m | awk '/Mem/ { print ($2-$7)*100/$2}'
    else
	echo old
	free -m | awk '/cache:/ { print $3*100/($3+$4) }'
    fi
}

function t_log {
    if which journalctl >/dev/null 2>/dev/null; then
	journalctl -n 3 | cat -n
    else
	cat /var/log/messages | egrep -i "warn|erro|crit" | tail -3 | cat -n
    fi
}

function t_cpu { cat /proc/cpuinfo | grep 'model n' | uniq; }

function t_cpu_usage { top -b -n 1 | grep Cpu | awk '{ print $2 + $4 }'; }

function t_df { df -Ph -x tmpfs -x devtmpfs | column -t | sed 's/%//' | sort -k5 -r -n | head -5; }

function t_dmesg { dmesg | tail -3 | cat -n; }

function t_last { last | head -3 | cat -n; }

function t_ping { ip r | awk '/^default/ { system("ping -c 3 " $3) }'; }

function t_ip { ip r | awk '/^default/ { system("ip a s " $6) }' | awk '/inet / { print $2 }'; }

function g1 {
	clear; date; t_os; uname -m; t_product; hostname; \
	t_cpu; t_cpu_usage; uname -r; free -g | grep Mem; t_mem_usage; t_df
}

function g2 {
	clear; t_log; echo; t_dmesg; echo; t_last \
	t_ip; t_ping; history | tail -3
}
