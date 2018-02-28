#!/bin/bash
#
# gather processor information on AIX below :
#
# CPU Socket(s)
# Core(s) per Socket
# Thread(s) per Core
#
# tested on :
#
# [ ] AIX 7.1
# [v] AIX 6.1
# [v] AIX 5.3
#
# todo :
# 
# [ ] parse "      4-WAY  PROC CUOD:" | awk '{ print $1 }' | cut -d "-" -f 1

Socket=$( lscfg -vp | grep "\-WAY" | wc -l | perl -alne 'print $F[-1]' )
Core=$( lscfg -vp | grep "\-WAY" | head -1 | awk '{ print $1 }' | cut -d "-" -f 1' )
# Core=
Thread=$( lsattr -El proc0 | grep smt_threads | perl -alne 'print $F[1]' )
Logical=$( bindprocessor -q | perl -alne 'print $F[-1]+1' )

# chk using :
# Core=$(( Logical / Thread / Socket ))

# Socket x Core x Thread
# ex,
# S2C2T2=L8 
# S1C4T4=L16 with 00E7473 (4core cpu)
# S1C8T4=L32 with 00E7469 (8core cpu)
echo S${Socket}C${Core}T${Thread}\=L${Logical}
