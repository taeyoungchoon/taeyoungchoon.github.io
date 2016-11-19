#!/usr/bin/perl
#
# read more : http://weblogs.sqlteam.com/dang/archive/2009/01/18/Dont-Use-sp_attach_db.aspx
# 

$type = "DATA_LOG";

$year = 2013;

foreach $mon (03..03) {
    foreach $day (1..3) {
	$dbname = sprintf("%s_%d%02d%02d_000000", $type, $year, $mon, $day);
	print sprintf("sp_attach_db \@dbname=N'%s'\, \@filename1=N'N:\\$year%02d\\%s\.mdf'\, \@filename2=N'N:\\$year%02d\\%s_log\.ldf' \n", $dbname, $mon, $dbname, $mon, $dbname);
	# print sprintf("sp_detach_db %s \n", $dbname);
	print "go\n";
    }
}

__END__

sp_detach_db M6_LOG_20150131_000000
isql -E -Q "sp_detach_db M6_LOG_20150131_000000"

sp_attach_db @dbname=N'M6_LOG_20130107_000000', @filename1=N'N:\201301\M6_LOG_20130107_000000.mdf', @filename2=N'N:\201301\M6_LOG_20130107_000000_log.ldf'
go
