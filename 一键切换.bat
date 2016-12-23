@echo off
rem 已上传到GIthub：https://github.com/yiranzai/SmartBat
mode con: cols=80 lines=32
color 0a
title 我的小工具           Powered By 段再续
:main
color 0a
cls
echo ############################################################################
echo ##                                                                        ##
echo ##                         我的小工具          By 段再续              ##
echo ##                                                                        ##
echo ##                         开启wifi热点--1                                ##
echo ##                         关闭wifi热点--2                                ##
echo ##                         建立无线热点--3                                ##
echo ##                              一键                                      ##
echo ##                         切换为动态IP--4                                ##
echo ##                         切换为静态IP--5                                ##
echo ##                         启动小程序  --6                                ##
echo ##                         关闭小程序  --7                                ##
echo ##                         快速建立热点--0                                ##
echo ##                                                                        ##
echo ##    一键开启将默认建立SSID为DzxWifi密码aaaa0000的热点并退出本程序。     ##
echo ##                                                                        ##
echo ############################################################################
echo 运行本工具需要管理员权限，请在图标右键选择"以管理员身份运行"
echo 本工具不支持XP以前系统，仅支持WinNT 6.x以后的版本(vista win7/8/8.1/10等)
echo Tips:
echo   1. Windows内置了WIFI共享功能，本工具就利用此命令建立热点。
echo   2. 创建完毕后，在以太网或者本地连接处右键属性-共享-全部勾选
echo         并在第一个勾选的下拉框中选定刚建立的Wifi热点，一般为“本地连接*”
echo   3. 可以切换 静态IP 和 动态IP
echo   4. 如果无法切换IP请右键编辑本文件，将“以太网”更改为“本地连接”
echo                       有问题请联系        wuqingdzx@163.com
echo                 已上传到GitHub：https://github.com/yiranzai/SmartBat

echo                                                             By 段再续
set /p option=请输入相应选项，输入q则退出：
@echo off
if "%option%"=="1" goto start
if "%option%"=="2" goto stop
if "%option%"=="3" goto set
if "%option%"=="4" goto dhcpip
if "%option%"=="5" goto staticip
if "%option%"=="6" goto kaiqi
if "%option%"=="7" goto close
if "%option%"=="0" goto onekey
if "%option%"=="q" goto exit
if "%option%"=="main" goto main

:kaiqi
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
goto main

:close
taskkill /f /im ONENOTEM.EXE /im flux.exe /im whatpulse.exe /im TicKeys.exe /im vmware-tray /im Snipaste.exe
echo 已经关闭所有小程序
echo 请按任意键返回主界面...
pause>nul
goto main

:staticip
echo offclstitle 设置IP
echo 正在设置IP地址，请稍候……
netsh interface ip set address "以太网" static 10.33.6.99 255.255.0.0 10.33.250.250 1
echo 正在更改DNS设置，请稍候……
netsh interface ip set dns "以太网" static 115.159.55.78 primary 
netsh interface ip add dns name = "以太网" addr=201.196.118.168
echo ******恭喜你，修改完成！******
echo 请按任意键返回主界面...
pause>nul
goto main

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
goto main

:start
echo 如果卡住请稍等，Windows正在后台处理...一直卡住请稍后重新运行本工具
netsh wlan start hostednetwork
echo 请按任意键返回主界面...
pause>nul
goto main

:stop
echo 如果卡住请稍等，Windows正在后台处理...一直卡住请稍后重新运行本工具
netsh wlan stop hostednetwork
echo 请按任意键返回主界面...
pause>nul
goto main

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

:set
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
goto main

:onekey
netsh wlan start hostednetwork
netsh wlan set hostednetwork mode=allow
netsh wlan set hostednetwork ssid=DzxWifi key=aaaa0000
netsh wlan set hostednetwork mode=allow
netsh wlan start hostednetwork
netsh wlan start settings
netsh wlan start hostednetwork
echo 请按任意键返回主界面...
pause>nul
goto main