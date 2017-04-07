print "let's begin, clean" . "\n";
system("ls -ltr *.fas *.lib");
system("rm *.fas *.lib");
print "done is done" . "\n";
print "and check" . "\n";
system("ls -ltr *.fas *.lib");
