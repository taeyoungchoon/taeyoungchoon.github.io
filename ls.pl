system("ls -tlr | grep ^[-dls] | cut -b 1 | sort | uniq -c");
printf "\n";
system("ls -lSr | tail -3");
printf "\n";
system("ls -ltr | tail -3");
