#!/usr/bin/env bash

mine='db2'
web='w1 w2'
db='db1 db2'
typos='db web'

 for typo in ${typos[@]}; do
    for svr in ${!typo}; do
	if [[ $svr == $mine ]]; then
	    if [[ $typo == 'db' ]]; then
		proc='select call'
	    fi
	    if [[ $typo == 'web' ]]; then
		proc='http call'
	    fi
	fi
    done
done

echo $mine will do $proc
