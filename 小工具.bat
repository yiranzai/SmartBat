@echo off
rem ���ϴ���GIthub��https://github.com/yiranzai/SmartBat
mode con: cols=80 lines=32
color 0a
title �ҵ�С����  Powered By ������
color 0a
cls
:main
color 0a
cls
echo ########################################################################
echo ##                                                                    
echo ##                         �ҵ�С����          By ������              
echo ##                                                                    
echo ##                        WIFI  ����	--1                        
echo ##                        IP    ����	--2                        
echo ##                        С�������	--3                        
echo ##                        �ػ�  ����	--4                        
echo ##                                                                    
echo ##                                                                    
echo ########################################################################
echo ���ֹ�����Ҫ����ԱȨ�ޣ�����ͼ���Ҽ�ѡ��"�Թ���Ա�������"
echo Wifi���߲�֧��XP��ǰϵͳ����֧��WinNT 6.x�Ժ�İ汾(vista win7/8/8.1/10��)
echo Tips:
echo   1. ��һ��ʹ���ȵ���Ҫ�ȴ���
echo   2. ������Ϻ�����̫�����߱������Ӵ��Ҽ�����-����-ȫ����ѡ
echo         ���ڵ�һ����ѡ����������ѡ���ս�����Wifi�ȵ㣬һ��Ϊ����������*��
echo   3. ��̬IP�л���Ҫ�����Ҽ��򿪱༭
echo   4. ����޷��л�IP���Ҽ��༭���ļ���������̫��������Ϊ���������ӡ�
echo                       ����������ϵ        wuqingdzx@163.com
echo                 ���ϴ���GitHub��https://github.com/yiranzai/SmartBat
echo                                                             By ������
set /p option=��������Ӧѡ�����q���˳���
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
echo ##                         �ҵ�С����          By ������              
echo ##                                              
echo ##                        �Զ���ػ�     --1
echo ##                        �ػ�	         --2
echo ##                          ����         --3
echo ##                            ����       --4
echo ##                              ע��     --5
echo ##                        ȡ���ػ�       --6  
echo ##									   
echo ##						q:�˳�	0:����            
echo ########################################################################
set /p opshut=��������Ӧѡ�����q���˳���
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
set /p opdiy=�������ӳٵ�ʱ��(����)��
set /a diy = %opdiy%*60
shutdown -s -t %diy%
echo %opdiy%���Ӻ󼴽��ػ�
echo �밴���������������...
pause>nul
goto shutd

:Shutdown
shutdown -s -t 0
echo �밴���������������...
pause>nul
cls
goto shutd

:Sleep
shutdown -h
echo �밴���������������...
pause>nul
cls
goto shutd

:restart
shutdown -r
echo �밴���������������...
pause>nul
cls
goto shutd

:logout
shutdown -l
echo �밴���������������...
pause>nul
cls
goto shutd

:recall
shutdown -a
echo �밴���������������...
pause>nul
cls
goto shutd

:wifi
cls
echo ########################################################################
echo ##                                                                    
echo ##                         �ҵ�С����          By ������              
echo ##                                                                    
echo ##                        �����ȵ�		--1                        
echo ##                        �ر��ȵ�		--2                        
echo ##                        �Զ��崴���ȵ�	--3                        
echo ##                        һ�������ȵ�  	--4              	   
echo ##									   
echo ##						q:�˳�	0:����             
echo ##    һ��������Ĭ�Ͻ���SSIDΪDzxWifi����aaaa0000���ȵ㲢�˳������� 
echo ##                                                                    
echo ########################################################################
echo Tips:
echo   1. ��һ��ʹ����ѡ��3����4�����ȵ㣬4�е����ݿ��Ҽ��༭�����޸�
echo   2. ������Ϻ�����̫�����߱������Ӵ��Ҽ�����-����-ȫ����ѡ
echo         ���ڵ�һ����ѡ����������ѡ���ս�����Wifi�ȵ㣬һ��Ϊ����������*��
set /p opWifi=��������Ӧѡ�����q���˳���
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
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::ssidΪWIFI���� keyΪWIFI����
set /p ssid=������Ҫ�������ȵ�����(SSID):
set /p key=������Ҫ�������ȵ�����(8λ����):
echo �����ס���Եȣ�Windows���ں�̨����...һֱ��ס���Ժ��������б�����
netsh wlan start hostednetwork
netsh wlan set hostednetwork mode=allow
netsh wlan set hostednetwork ssid="%ssid%" key="%key%"
netsh wlan set hostednetwork mode=allow
netsh wlan start hostednetwork
netsh wlan start settings
netsh wlan start hostednetwork
echo �������,����ʾ����������Ϣ�����ɹ���
echo -----��������ģʽ������Ϊ����
echo -----�ѳɹ����ĳ�������� SSID��
echo -----�ѳɹ������й�������û���Կ���롣
echo �������������������������ѯ��
echo �밴���������������...
pause>nul
goto wifi

:onekeyWifi
netsh wlan start hostednetwork
netsh wlan set hostednetwork mode=allow
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::ssidΪWIFI���� keyΪWIFI����
netsh wlan set hostednetwork ssid=DzxWifi key=aaaa0000
netsh wlan set hostednetwork mode=allow
netsh wlan start hostednetwork
netsh wlan start settings
netsh wlan start hostednetwork
echo .
echo   ������Ϻ�����̫�����߱������Ӵ��Ҽ�����-����-ȫ����ѡ
echo         ���ڵ�һ����ѡ����������ѡ���ս�����Wifi�ȵ㣬һ��Ϊ����������*��
echo �밴���������������...
pause>nul
goto wifi

:openWifi
echo �����ס���Եȣ�Windows���ں�̨����...һֱ��ס���Ժ��������б�����
netsh wlan start hostednetwork
echo �밴���������������...
pause>nul
goto wifi

:closeWifi
echo �����ס���Եȣ�Windows���ں�̨����...һֱ��ס���Ժ��������б�����
netsh wlan stop hostednetwork
echo �밴���������������...
pause>nul
goto wifi

:ipset
cls
echo ########################################################################
echo ##                                                                    
echo ##                         �ҵ�С����          By ������              
echo ##                                                                    
echo ##                        �л�Ϊ��̬IP	--1	                   
echo ##                        �л�Ϊ��̬IP	--2	                   
echo ##									   
echo ##						q:�˳�	0:����            
echo ########################################################################
set /p opip=��������Ӧѡ�����q���˳���
@echo off
if "%opip%"=="1" goto staticip
if "%opip%"=="2" goto dhcpip
if "%opip%"=="q" goto exit
if "%opip%"=="0" goto main
cls
goto ipset

:staticip
echo offclstitle ����IP
echo ��������IP��ַ�����Ժ򡭡�
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::������ IP  ��������  Ĭ������ 1::::::::::::::::::::
netsh interface ip set address "��̫��" static 10.33.6.99 255.255.0.0 10.33.250.250 1
echo ���ڸ���DNS���ã����Ժ򡭡�
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::��Ҫ��DNS
netsh interface ip set dns "��̫��" static 115.159.55.78 primary
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::��Ҫ��DNS
netsh interface ip add dns name = "��̫��" addr=201.196.118.168
echo ******��ϲ�㣬�޸���ɣ�******
echo �밴���������������...
pause>nul
goto ipset

:dhcpip
echo offclstitle ���IP����
echo �������IP��ַ�����Ժ򡭡�
netsh interface ip set address name="��̫��" source=dhcp 
echo ���ڸ���DNS���ã����Ժ򡭡�
netsh interface ip set dns "��̫��" all
echo ����ˢ��DNS�����Ժ򡭡�
ipconfig /flushdns
echo *************** ��ϲ�㣬����ɹ���ɣ�*************
echo �밴���������������...
pause>nul
goto ipset

:exes
cls
echo ########################################################################
echo ##                                                                    
echo ##                         �ҵ�С����          By ������              
echo ##                                                                    
echo ##				�ر�С����	--1                        
echo ##				����С����	--2                        
echo ##									   
echo ##						q:�˳�	0:����             
echo ########################################################################
set /p opexes=��������Ӧѡ�����q���˳���
@echo off
if "%opexes%"=="1" goto exeStart
if "%opexes%"=="2" goto exeClose
if "%opexes%"=="q" goto exit
if "%opexes%"=="0" goto main
cls
goto exes

:exeStart
::                    start ������ ����·��
start "ONENOTEM" "C:\Program Files\Microsoft Office\Office16\ONENOTEM.EXE"	
echo ����onenote
start "flux" "C:\Users\wuqin\AppData\Local\FluxSoftware\Flux\flux.exe"			
echo ����ɫ���Զ����ڳ���
start "whatpulse" "D:\Program Files (x86)\WhatPulse2\whatpulse.exe"				
echo �����������ͳ�Ƴ���
start "TicKeys" "D:\Program Files (x86)\Tickeys1.1.1\Release\TicKeys.exe"			
echo ����������Ч����
start "vmware-tray" "C:\Program Files (x86)\VMware\VMware Workstation\vmware-tray.exe"	
echo �������������
start "Snipaste" "D:\Program Files (x86)\Snipaste-1.10.4-x64\Snipaste.exe"			
echo ������ݽ�ͼ
echo �밴���������������...
pause>nul
goto exes

:exeClose
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::/im ��Ҫ�ɵ��Ľ���������������е�����
taskkill /f /im ONENOTEM.EXE /im flux.exe /im whatpulse.exe /im TicKeys.exe /im vmware-tray /im Snipaste.exe
echo �Ѿ��ر�����С����
echo �밴���������������...
pause>nul
goto exes

:exit
echo ��л����ʹ�ã������߼����˳���
echo �����κ���������ϵ���ˡ�
echo �ٴθ�л����ʹ�ã�
echo 5..
echo 4..
echo 3..
echo 2..
echo 1..
echo ������ܿ����⼸���֣�˵����ĵ�����Щ����- -��
exit