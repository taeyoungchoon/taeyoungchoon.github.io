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
Socket=$( lscfg -vp | grep WAY | wc -l | perl -alne 'print $F[-1]' )
Core=
Thread=$( lsattr -El proc0 | grep smt_threads | perl -alne 'print $F[1]' )
Logical=$( bindprocessor -q | perl -alne 'print $F[-1]+1' )

Core=$(( Logical / Thread / Socket ))

# Socket x Core x Thread
# ex,
# S1C4T4=L16
# S2C2T2=L8
echo S${Socket}C${Core}T${Thread}\=L${Logical}
