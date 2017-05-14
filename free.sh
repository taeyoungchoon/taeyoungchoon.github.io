cat free.out | grep ^- | awk '{ print int( $4/($3+$4)*100 ) "% used" }'
