$line = "hi man";
@tokens = split(/\W/, $line);
foreach $token (@tokens) {
    print $token;
    print "\n";
}
