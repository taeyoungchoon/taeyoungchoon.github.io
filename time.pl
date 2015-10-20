print "-start--\n";
open($fh,'ntpdate -q time.bora.net|');
while(<$fh>) {
    print;
}
close($fh);
print "-end--\n";
