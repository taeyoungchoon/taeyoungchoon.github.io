# aix works #####
hn=`hostname`
echo "$hn \c"

for interface in `netstat -rn -f inet | grep ^[0-9] | awk '{ print $6 }' | grep -v lo | sort | uniq`
do
         echo "$interface \c"

         ip=`ifconfig $interface | grep inet | awk '{ print $2 }'`
         echo "$ip \c"

         mac=`entstat $interface | grep -i hardware | awk '{ print $3 }'`
         echo "$mac \c"
done

echo ""

exit 0

#
# enhancing but
#
# echo `netstat -rn -f inet | grep ^[0-9] | awk '{ print $6 }' | grep -v lo | sort | uniq | wc -l`
# echo ''
# hn=`hostname`
# int=`netstat -rn -f inet | grep ^[0-9] | awk '{ print $6 }' | grep -v lo | sort | uniq`
# ip=`ifconfig $int | grep inet | awk '{ print $2 }'`
# mac=`entstat $int | grep -i hardware | awk '{ print $3 }'`
# echo $hn $int $ip $mac

#
# but two
#
# hostname
# netstat -rn -f inet | grep ^[0-9] | awk '{ print $6 }' | grep -v lo | sort | uniq
# netstat -rn -f inet | grep ^[0-9] | awk '{ print $6 }' | grep -v lo | sort | uniq | sed 's/^/ifconfig /'  | sh
# netstat -rn -f inet | grep ^[0-9] | awk '{ print $6 }' | grep -v lo | sort | uniq | sed 's/^/entstat /' | sh | egrep "(ETH|Har)"

#
# aix
#
# hostname
# netstat -rn | grep \= | awk '{ print $6 }' 
# ifconfig en0 | grep inet | awk '{ print $2 }'
# entstat ent0 | grep -i hardware | awk '{ print $3 }'

