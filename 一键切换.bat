@echo off
rem ���ϴ���GIthub��https://github.com/yiranzai/SmartBat
mode con: cols=80 lines=32
color 0a
title �ҵ�С����           Powered By ������
:main
color 0a
cls
echo ############################################################################
echo ##                                                                        ##
echo ##                         �ҵ�С����          By ������              ##
echo ##                                                                        ##
echo ##                         ����wifi�ȵ�--1                                ##
echo ##                         �ر�wifi�ȵ�--2                                ##
echo ##                         ���������ȵ�--3                                ##
echo ##                              һ��                                      ##
echo ##                         �л�Ϊ��̬IP--4                                ##
echo ##                         �л�Ϊ��̬IP--5                                ##
echo ##                         ����С����  --6                                ##
echo ##                         �ر�С����  --7                                ##
echo ##                         ���ٽ����ȵ�--0                                ##
echo ##                                                                        ##
echo ##    һ��������Ĭ�Ͻ���SSIDΪDzxWifi����aaaa0000���ȵ㲢�˳�������     ##
echo ##                                                                        ##
echo ############################################################################
echo ���б�������Ҫ����ԱȨ�ޣ�����ͼ���Ҽ�ѡ��"�Թ���Ա�������"
echo �����߲�֧��XP��ǰϵͳ����֧��WinNT 6.x�Ժ�İ汾(vista win7/8/8.1/10��)
echo Tips:
echo   1. Windows������WIFI�����ܣ������߾����ô�������ȵ㡣
echo   2. ������Ϻ�����̫�����߱������Ӵ��Ҽ�����-����-ȫ����ѡ
echo         ���ڵ�һ����ѡ����������ѡ���ս�����Wifi�ȵ㣬һ��Ϊ����������*��
echo   3. �����л� ��̬IP �� ��̬IP
echo   4. ����޷��л�IP���Ҽ��༭���ļ���������̫��������Ϊ���������ӡ�
echo                       ����������ϵ        wuqingdzx@163.com
echo                 ���ϴ���GitHub��https://github.com/yiranzai/SmartBat

echo                                                             By ������
set /p option=��������Ӧѡ�����q���˳���
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
goto main

:close
taskkill /f /im ONENOTEM.EXE /im flux.exe /im whatpulse.exe /im TicKeys.exe /im vmware-tray /im Snipaste.exe
echo �Ѿ��ر�����С����
echo �밴���������������...
pause>nul
goto main

:staticip
echo offclstitle ����IP
echo ��������IP��ַ�����Ժ򡭡�
netsh interface ip set address "��̫��" static 10.33.6.99 255.255.0.0 10.33.250.250 1
echo ���ڸ���DNS���ã����Ժ򡭡�
netsh interface ip set dns "��̫��" static 115.159.55.78 primary 
netsh interface ip add dns name = "��̫��" addr=201.196.118.168
echo ******��ϲ�㣬�޸���ɣ�******
echo �밴���������������...
pause>nul
goto main

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
goto main

:start
echo �����ס���Եȣ�Windows���ں�̨����...һֱ��ס���Ժ��������б�����
netsh wlan start hostednetwork
echo �밴���������������...
pause>nul
goto main

:stop
echo �����ס���Եȣ�Windows���ں�̨����...һֱ��ס���Ժ��������б�����
netsh wlan stop hostednetwork
echo �밴���������������...
pause>nul
goto main

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

:set
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
goto main

:onekey
netsh wlan start hostednetwork
netsh wlan set hostednetwork mode=allow
netsh wlan set hostednetwork ssid=DzxWifi key=aaaa0000
netsh wlan set hostednetwork mode=allow
netsh wlan start hostednetwork
netsh wlan start settings
netsh wlan start hostednetwork
echo �밴���������������...
pause>nul
goto main