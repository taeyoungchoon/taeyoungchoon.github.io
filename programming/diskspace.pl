#
# diskspace issue
#
# func : print
# func : check (suggestion with yellow and red)
# - 85% warning
# - 90% error
#
# tested on 
# - mac os x 10.8.4
#
# todo
# - helper func : getDiskSpace
#
use Term::ANSIColor;

sub printDiskSpace {
    @diskspace = `df -lh`;

    $lineNumber = 0;
    foreach $line (@diskspace) {
	$lineNumber = $lineNumber + 1;
	if ($lineNumber >= 2) {
	    ($filesystem, $size, $used, $avail, $capacity, $iused, $ifree, $iused, $mountedOn)
		= split(/\s+/, $line);
	    $output = sprintf("%s mounted on %s (%s used)\n", $filesystem, $mountedOn, $capacity);
	    print $output;
	}
    }
}

sub checkDiskSpace {
    @diskspace = `df -lh`;

    $lineNumber = 0;
    foreach $line (@diskspace) {
	$lineNumber = $lineNumber + 1;
	if ($lineNumber >= 2) {
	    ($filesystem, $size, $used, $avail, $capacity, $iused, $ifree, $iused, $mountedOn)
		= split(/\s+/, $line);
	    $output = sprintf("%s mounted on %s (%s used)\n", $filesystem, $mountedOn, $capacity);
	    
	    $capacityNumber = substr($capacity, 0, -1);

	    if ($capacityNumber >= 90) {
		print color("red"), "[ERR] " . $output, color("reset");
	    } elsif ($capacityNumber >=85) {
		print color("yellow"), "[WARN] " . $output, color("reset");
	    }
	}
    }
}
print "----------------------------\n";    
print "disk space usage information\n";    
print "----------------------------\n";    
printDiskSpace();
print "\n";

print "----------------------------\n";    
print "check disk space usage\n";    
print "----------------------------\n";    
checkDiskSpace();
print "\n";

