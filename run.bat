@echo off
echo ===============================
echo deploy **** app
echo ȷ���޸ı���winscp��ַ
echo ȷ���޸ı���putty��ַ
echo ===============================
echo please input "y" to continue......
set /p input=
if "%input%"=="y" (
rem ɾ��֮ǰlog�ļ�
if exist upload_log.log (
 echo delete history log... 
 del upload_log.log
) 
echo ===============================
echo �ϴ��޸��ļ� 
echo ===============================
call D:\WinSCP\WinSCP.exe /script=upLoadScript.txt /log=upload_log.log 
echo ===============================
echo ��Զ��������ִ��shell�ű�
echo ===============================
call D:\WinSCP\PuTTY\putty.exe -ssh -pw 12345678 root@192.168.*.* -m command.txt
call D:\WinSCP\PuTTY\putty.exe -ssh -pw 12345678 root@192.168.*.* -m command.txt
echo deploy **** successed!
) else echo Does not execute any command
pause