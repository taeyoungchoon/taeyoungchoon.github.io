#!/bin/bash
#
# - TODO 
# clean file_exist
#

function file_exist {
    	rt=`ls *~ 2>/dev/null | wc -l`
	# echo $rt
	if [ $rt == 0 ]
	then
	    echo nil
	    exit 1
	fi
}

function file_list {
    	for file in `ls *~`
	do
	    ls $file
	done
	exit 0
}

function file_remove {
    	for file in `ls *~`
	do
	    echo rm $file
	    rm $file
	done
	exit 0
}

arg=$1
case $arg in
    "check")
	file_exist
	file_list
	;;
    "now")
	file_exist
	file_remove
	;;
    *)
	echo add 'check' then 'now'
	exit 1
	;;
esac

