@echo off
chcp 437>NUL

for /f "tokens=1" %%a in ('hostname') do set hn=%%a
rem echo %hn%

for /f "tokens=3" %%a in ('route print ^| findstr Default') do set nic=%%a
rem echo %nic%

for /f "tokens=5" %%a in ('netsh int ipv4 show route ^| findstr %%nic%%') do set idx=%%a
rem echo %idx%

for /f "tokens=6" %%a in ('route print ^| findstr /c:%%idx%%') do set key=%%a
rem echo %key%

for /f "tokens=1" %%a in ('getmac /nh ^| findstr /c:-%%key%%') do set mac=%%a
rem echo %mac%

for /f "tokens=1 delims=," %%a in ('getmac /fo csv /v ^| findstr %%mac%%') do set cname=%%a
rem echo %cname%

for /f "tokens=2 delims=," %%a in ('getmac /fo csv /v ^| findstr %%mac%%') do set adapter=%%a
rem echo %adapter%

for /f "tokens=3" %%a in ('netsh int ipv4 show config "%%cname%%" ^| findstr IP') do set ip=%%a
rem echo %ip%

echo %hn% %cname% %mac% %ip%

REM ipconfig /all | findstr /c:Desc /c:Phys /c:IPv4

REM hostname > hostname.out
REM set /p hn=< hostname.out
REM echo %hn%
REM wmic nic where speed=3000000 get name
REM wmic nic get Name, Installed, MACAddress
REM wmic nic where "macaddress like '%64%'" get name

REM for /f "tokens=1 delims==" %a in ('wmic nic where "macaddress like '%%key%%'" get name ^| findstr -v Name ^| findstr [a-zA-Z]') do set mac=%a


