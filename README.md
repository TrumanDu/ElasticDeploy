# ElasticDeploy
This is a awesome deployment, maintenance tool ,and it depends winscp and putty
# 利用winscp与putty构建自动化部署
## 前言
在运维过程中，会经常遇到维护的机器很多，更新软件版本比较繁杂，在此借鉴winscp与putty支持脚本的功能之上，使用window bat命令实现在window平台便捷部署linux上的应用。
## 方案
### 上传文件
此处利用winscp。updateLoadScript.txt 具体操作代码如下：
``` bash
option batch on 
option confirm off 
open scp://root:12345678@192.168.*.** 
put E:\deploy\tt.txt /data/projects/
close 
exit

```
*此处主要，要提前用winscp连接到相应主机上，猜测要从缓存中取一些东西*

### 执行命令
此处利用 putty。 command.txt 具体命令如下：
``` bash
export JAVA_HOME=/opt/jdk1.8.0_45
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
cd /data/projects/redis-client
./start.sh stop
./start.sh start
ps -ef|grep redis-client
```

### bat文件
``` bash
@echo off 
echo =============================== 
echo deploy RedisClient app 
echo =============================== 
echo please input "y" to continue...... 
set /p input= 
if "%input%"=="y" ( 
rem --打开控制台 
call D:\WinSCP\WinSCP.exe /script=updateLoadScript.txt  /log=upload_log.txt 
call D:\WinSCP\PuTTY\putty.exe -ssh -pw 12345678 root@192.168.*.** -m command.txt 
call D:\WinSCP\PuTTY\putty.exe -ssh -pw 12345678 root@192.168.*.** -m command.txt 
echo deploy RedisClient successed! 
) else echo Does not execute any command 
pause
```
## 参考
1. winscp 使用 http://www.5iadmin.com/post/1014.html
