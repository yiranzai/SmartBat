@echo off
rem 已上传到GIthub：https://github.com/yiranzai/SmartBat
mode con: cols=80 lines=32
color 0a
title 我的小工具  Powered By 段再续
color 0a
cls
:main
color 0a
cls
echo ########################################################################
echo ##                                                                    
echo ##                         我的小工具          By 段再续              
echo ##                                                                    
echo ##                        WIFI  操作	--1                        
echo ##                        IP    操作	--2                        
echo ##                        小程序操作	--3                        
echo ##                        关机  操作	--4                        
echo ##                                                                    
echo ##                                                                    
echo ########################################################################
echo 部分功能需要管理员权限，请在图标右键选择"以管理员身份运行"
echo Wifi工具不支持XP以前系统，仅支持WinNT 6.x以后的版本(vista win7/8/8.1/10等)
echo Tips:
echo   1. 第一次使用热点需要先创建
echo   2. 创建完毕后，在以太网或者本地连接处右键属性-共享-全部勾选
echo         并在第一个勾选的下拉框中选定刚建立的Wifi热点，一般为“本地连接*”
echo   3. 静态IP切换需要自行右键打开编辑
echo   4. 如果无法切换IP请右键编辑本文件，将“以太网”更改为“本地连接”
echo                       有问题请联系        wuqingdzx@163.com
echo                 已上传到GitHub：https://github.com/yiranzai/SmartBat
echo                                                             By 段再续
set /p option=请输入相应选项，输入q则退出：
@echo off
if "%option%"=="1" goto wifi
if "%option%"=="2" goto ipset
if "%option%"=="3" goto exes
if "%option%"=="4" goto shutd
if "%option%"=="q" goto exit
cls
goto main

:shutd
cls
echo ########################################################################
echo ##                                                                    
echo ##                         我的小工具          By 段再续              
echo ##                                              
echo ##                        自定义关机     --1
echo ##                        关机	         --2
echo ##                          休眠         --3
echo ##                            重启       --4
echo ##                              注销     --5
echo ##                        取消关机       --6  
echo ##									   
echo ##						q:退出	0:返回            
echo ########################################################################
set /p opshut=请输入相应选项，输入q则退出：
@echo off
if "%opshut%"=="1" goto diyShutdown
if "%opshut%"=="2" goto Shutdown
if "%opshut%"=="3" goto Sleep
if "%opshut%"=="4" goto restart
if "%opshut%"=="5" goto logout
if "%opshut%"=="6" goto recall
if "%opshut%"=="q" goto exit
if "%opshut%"=="0" goto main
cls
goto shutd

:diyshutdown
set /p opdiy=请输入延迟的时间(分钟)：
set /a diy = %opdiy%*60
shutdown -s -t %diy%
echo %opdiy%分钟后即将关机
echo 请按任意键返回主界面...
pause>nul
goto shutd

:Shutdown
shutdown -s -t 0
echo 请按任意键返回主界面...
pause>nul
cls
goto shutd

:Sleep
shutdown -h
echo 请按任意键返回主界面...
pause>nul
cls
goto shutd

:restart
shutdown -r
echo 请按任意键返回主界面...
pause>nul
cls
goto shutd

:logout
shutdown -l
echo 请按任意键返回主界面...
pause>nul
cls
goto shutd

:recall
shutdown -a
echo 请按任意键返回主界面...
pause>nul
cls
goto shutd

:wifi
cls
echo ########################################################################
echo ##                                                                    
echo ##                         我的小工具          By 段再续              
echo ##                                                                    
echo ##                        开启热点		--1                        
echo ##                        关闭热点		--2                        
echo ##                        自定义创建热点	--3                        
echo ##                        一键创建热点  	--4              	   
echo ##									   
echo ##						q:退出	0:返回             
echo ##    一键创建将默认建立SSID为DzxWifi密码aaaa0000的热点并退出本程序。 
echo ##                                                                    
echo ########################################################################
echo Tips:
echo   1. 第一次使用请选择3或者4创建热点，4中的内容可右键编辑自行修改
echo   2. 创建完毕后，在以太网或者本地连接处右键属性-共享-全部勾选
echo         并在第一个勾选的下拉框中选定刚建立的Wifi热点，一般为“本地连接*”
set /p opWifi=请输入相应选项，输入q则退出：
@echo off
if "%opWifi%"=="1" goto openWifi
if "%opWifi%"=="2" goto closeWifi
if "%opWifi%"=="3" goto setWifi
if "%opWifi%"=="4" goto onekeyWifi
if "%opWifi%"=="q" goto exit
if "%opWifi%"=="0" goto main
cls
goto wifi

:setWifi
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::ssid为WIFI名字 key为WIFI密码
set /p ssid=请输入要建立的热点名称(SSID):
set /p key=请输入要建立的热点密码(8位以上):
echo 如果卡住请稍等，Windows正在后台处理...一直卡住请稍后重新运行本工具
netsh wlan start hostednetwork
netsh wlan set hostednetwork mode=allow
netsh wlan set hostednetwork ssid="%ssid%" key="%key%"
netsh wlan set hostednetwork mode=allow
netsh wlan start hostednetwork
netsh wlan start settings
netsh wlan start hostednetwork
echo 建立完毕,若显示以下三条信息则建立成功。
echo -----承载网络模式已设置为允许。
echo -----已成功更改承载网络的 SSID。
echo -----已成功更改托管网络的用户密钥密码。
echo 若返回其它结果请自行上网查询。
echo 请按任意键返回主界面...
pause>nul
goto wifi

:onekeyWifi
netsh wlan start hostednetwork
netsh wlan set hostednetwork mode=allow
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::ssid为WIFI名字 key为WIFI密码
netsh wlan set hostednetwork ssid=DzxWifi key=aaaa0000
netsh wlan set hostednetwork mode=allow
netsh wlan start hostednetwork
netsh wlan start settings
netsh wlan start hostednetwork
echo .
echo   创建完毕后，在以太网或者本地连接处右键属性-共享-全部勾选
echo         并在第一个勾选的下拉框中选定刚建立的Wifi热点，一般为“本地连接*”
echo 请按任意键返回主界面...
pause>nul
goto wifi

:openWifi
echo 如果卡住请稍等，Windows正在后台处理...一直卡住请稍后重新运行本工具
netsh wlan start hostednetwork
echo 请按任意键返回主界面...
pause>nul
goto wifi

:closeWifi
echo 如果卡住请稍等，Windows正在后台处理...一直卡住请稍后重新运行本工具
netsh wlan stop hostednetwork
echo 请按任意键返回主界面...
pause>nul
goto wifi

:ipset
cls
echo ########################################################################
echo ##                                                                    
echo ##                         我的小工具          By 段再续              
echo ##                                                                    
echo ##                        切换为静态IP	--1	                   
echo ##                        切换为动态IP	--2	                   
echo ##									   
echo ##						q:退出	0:返回            
echo ########################################################################
set /p opip=请输入相应选项，输入q则退出：
@echo off
if "%opip%"=="1" goto staticip
if "%opip%"=="2" goto dhcpip
if "%opip%"=="q" goto exit
if "%opip%"=="0" goto main
cls
goto ipset

:staticip
echo offclstitle 设置IP
echo 正在设置IP地址，请稍候……
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::依次是 IP  子网掩码  默认网关 1::::::::::::::::::::
netsh interface ip set address "以太网" static 10.33.6.99 255.255.0.0 10.33.250.250 1
echo 正在更改DNS设置，请稍候……
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::主要的DNS
netsh interface ip set dns "以太网" static 115.159.55.78 primary
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::次要的DNS
netsh interface ip add dns name = "以太网" addr=201.196.118.168
echo ******恭喜你，修改完成！******
echo 请按任意键返回主界面...
pause>nul
goto ipset

:dhcpip
echo offclstitle 清除IP设置
echo 正在清除IP地址，请稍候……
netsh interface ip set address name="以太网" source=dhcp 
echo 正在更改DNS设置，请稍候……
netsh interface ip set dns "以太网" all
echo 正在刷新DNS，请稍候……
ipconfig /flushdns
echo *************** 恭喜你，命令成功完成！*************
echo 请按任意键返回主界面...
pause>nul
goto ipset

:exes
cls
echo ########################################################################
echo ##                                                                    
echo ##                         我的小工具          By 段再续              
echo ##                                                                    
echo ##				关闭小程序	--1                        
echo ##				开启小程序	--2                        
echo ##									   
echo ##						q:退出	0:返回             
echo ########################################################################
set /p opexes=请输入相应选项，输入q则退出：
@echo off
if "%opexes%"=="1" goto exeStart
if "%opexes%"=="2" goto exeClose
if "%opexes%"=="q" goto exit
if "%opexes%"=="0" goto main
cls
goto exes

:exeStart
::                    start 程序名 程序路径
start "ONENOTEM" "C:\Program Files\Microsoft Office\Office16\ONENOTEM.EXE"	
echo 启动onenote
start "flux" "C:\Users\wuqin\AppData\Local\FluxSoftware\Flux\flux.exe"			
echo 启动色温自动调节程序
start "whatpulse" "D:\Program Files (x86)\WhatPulse2\whatpulse.exe"				
echo 启动键盘鼠标统计程序
start "TicKeys" "D:\Program Files (x86)\Tickeys1.1.1\Release\TicKeys.exe"			
echo 启动按键音效程序
start "vmware-tray" "C:\Program Files (x86)\VMware\VMware Workstation\vmware-tray.exe"	
echo 启动虚拟机托盘
start "Snipaste" "D:\Program Files (x86)\Snipaste-1.10.4-x64\Snipaste.exe"			
echo 启动快捷截图
echo 请按任意键返回主界面...
pause>nul
goto exes

:exeClose
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::/im 你要干掉的进程在任务管理器中的名字
taskkill /f /im ONENOTEM.EXE /im flux.exe /im whatpulse.exe /im TicKeys.exe /im vmware-tray /im Snipaste.exe
echo 已经关闭所有小程序
echo 请按任意键返回主界面...
pause>nul
goto exes

:exit
echo 感谢您的使用，本工具即将退出。
echo 如有任何问题请联系本人。
echo 再次感谢您的使用！
echo 5..
echo 4..
echo 3..
echo 2..
echo 1..
echo 如果你能看清这几行字，说明你的电脑有些卡。- -！
exit