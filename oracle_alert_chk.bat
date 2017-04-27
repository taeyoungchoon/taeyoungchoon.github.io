%* ftp

set FTP_SVR=192.168.0.101
set FTP_DEST_DIR=/remote_oracle_log
set FTP_DEP_DIR=d:\oracle_alert_check

cd D:\oracle_alert_check

find "ORA-" < X:\app\Administrator\diag\rdbms\raulora\raulo\trace\alert_raulo.log > D:\oracle_alert_check\temp.txt

for %%F in ("D:\oracle_alert_check\temp.txt") do if %%~zF equ 0 del "%%F"

if exist D:\oracle_alert_check\temp.txt (type D:\oracle_alert_check\title.txt D:\oracle_alert_check\temp.txt D:\oracle_alert_check\bottom.txt > D:\oracle_alert_check\alert_raulo_17.log) else (echo file was not found)

@echo off
echo open %FTP_SVR% > d:\oracle_alert_check\ftpcmd.cmd
echo user >> d:\oracle_alert_check\ftpcmd.cmd
echo ocm>> d:\oracle_alert_check\ftpcmd.cmd
echo ocm>> d:\oracle_alert_check\ftpcmd.cmd
echo cd %FTP_DEST_DIR% >> d:\oracle_alert_check\ftpcmd.cmd
echo lcd %FTP_DEP_DIR% >> d:\oracle_alert_check\ftpcmd.cmd
echo bin >> d:\oracle_alert_check\ftpcmd.cmd
echo has >> d:\oracle_alert_check\ftpcmd.cmd
echo prompt >> d:\oracle_alert_check\ftpcmd.cmd
echo mput *.log >> d:\oracle_alert_check\ftpcmd.cmd
echo quit >> d:\oracle_alert_check\ftpcmd.cmd

ftp -n -s:d:\oracle_alert_check\ftpcmd.cmd

del d:\oracle_alert_check\*.log
del d:\oracle_alert_check\temp.txt
del d:\oracle_alert_check\ftpcmd.cmd

exit
