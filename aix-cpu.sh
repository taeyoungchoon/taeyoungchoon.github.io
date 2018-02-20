#!/bin/bash
#
# NOT YET
#
# gather processor information on AIX below :
# 
# Thread(s) per Core
# Core(s) per Socket
# CPU Socket(s)
#
# (not yet) tested on :
# 
# [ ] IBM P740 using Power7 processor on AIX 7.1
# [ ] IBM System P5 using Power5 processor on AIX 5.3
#
Socket=$( prtconf | grep "Number of Processors" | perl -alne 'print $F[-1]' )
Core=
Thread=$( lsattr -El proc0 | grep smt_threads | perl -alne 'print $F[-1]' )
Logical=$( bindprocessor -q | perl -alne 'print $F[-1]+1' )

Core=$(( Logical / Thread / Socket ))
#echo $Core

# Core x Thread x Socket
# C8T4S1=L32
echo C${Core}T${Thread}S${Socket}\=L${Logical}
