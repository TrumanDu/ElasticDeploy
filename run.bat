@echo off
echo ===============================
echo deploy **** app
echo 确认修改本地winscp地址
echo 确认修改本地putty地址
echo ===============================
echo please input "y" to continue......
set /p input=
if "%input%"=="y" (
rem 删除之前log文件
if exist upload_log.log (
 echo delete history log... 
 del upload_log.log
) 
echo ===============================
echo 上传修改文件 
echo ===============================
call D:\WinSCP\WinSCP.exe /script=upLoadScript.txt /log=upload_log.log 
echo ===============================
echo 在远程主机上执行shell脚本
echo ===============================
call D:\WinSCP\PuTTY\putty.exe -ssh -pw 12345678 root@192.168.*.* -m command.txt
call D:\WinSCP\PuTTY\putty.exe -ssh -pw 12345678 root@192.168.*.* -m command.txt
echo deploy **** successed!
) else echo Does not execute any command
pause