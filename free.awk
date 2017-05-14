BEGIN {
    print "memory usage : "
}

{
    used = $4/($3+$4)*100
#    print int( $4/($3+$4)*100 )
#    print $4/($3+$4)*100
    print int(used) "% used"
}
