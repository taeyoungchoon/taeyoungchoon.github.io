#!/usr/bin/env bash
#
# todo : ip, nmcli, /proc
#

hn=`hostname`
echo -n $hn
echo -n " "

for interface in `netstat -rn | grep ^[0-9] | awk '{ print $8 }' | sort | uniq`
do
         echo -n $interface
echo -n " "

         ip=`ifconfig $interface | grep inet | grep -v inet6 | awk '{ print $2 }' | cut -d ':' -f 2`
         echo -n $ip
echo -n " "

         mac=`ifconfig $interface | grep HWaddr | awk '{ print $5 }'`
         echo -n $mac
echo -n " "
done

echo ""


#
# old : ether
#
#hn=`hostname`
#int=`netstat -rn | grep UG | awk '{ print $8 }'`
#ip=`ifconfig $int | grep -v inet6 | grep inet | awk '{ print $2 }'`
#mac=`ifconfig $int | grep ether | awk '{ print $2 }'`
#echo $hn $int $ip $mac

#
# anyway new : HWaddr
#
#hn=`hostname`
#int=`netstat -rn | grep UG | awk '{ print $8 }'`
#ip=`ifconfig $int | grep -v inet6 | grep inet | awk '{ print $2 }' | cut -d ':' -f 2`
#mac=`ifconfig $int | grep HWaddr | awk '{ print $5 }'`
#echo $hn $int $ip $mac

#
# but two
#
#hostname
#netstat -rn | grep ^[0-9] | awk '{ print $8 }' | grep -v usb | grep -v lo | sort | uniq | wc -l
#netstat -rn | grep ^[0-9] | awk '{ print $8 }' | sort | uniq | sed 's/^/ifconfig /' | sh | egrep "(HWaddr|inet)" | grep -v inet6
