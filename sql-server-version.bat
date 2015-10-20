rem https://support.microsoft.com/en-us/kb/321185
rem SELECT SERVERPROPERTY('productversion'), SERVERPROPERTY ('productlevel'), SERVERPROPERTY ('edition')

isql -E -Q "select @@version"
