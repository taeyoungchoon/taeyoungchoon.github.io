#!/bin/env perl

my $uname = `uname`;
my $platform;

if ($uname =~ /darwin/i) { 
    $platform = "mac"; 
}
if ($uname =~ /linux/i) { 
    $platform = "linux"; 
}

print sprintf("%s\n", $platform);


