use Net::NTP;
use Data::Dumper::Concise;
use YAML;

my %response = get_ntp_response();
#print Dumper( %response ), "\n";
die YAML::Dump(\%response);
