@ECHO off
TITLE BY WJ.L(copy oyzx00)ÿ�춨ʱ�ػ�/�����ιػ�(����)&CLS&COLOR 0e&MODE con: COLS=41 

LINES=18
:SetHour
CLS
ECHO.
SET ask=
SET /p ask=�Ƿ��趨Ϊÿ��ִ�йػ�����(y/n):
IF NOT "%ask%"=="" SET ask=%ask:~0,1%
IF /I "%ask%"=="y" GOTO startet
IF /I "%ask%"=="n" GOTO no
GOTO SetHour
:startet
TITLE BY WJ.L(copy oyzx00)ÿ�춨ʱ�ػ�
echo ��ѡ����ÿ�춨ʱ�ػ���
ECHO ��ָ��24Сʱ��ʽʱ��,��ʽΪ Сʱ:����
SET shutdowntime=
SET /p shutdowntime=����:
at %shutdowntime% /every:M,T,W,Th,F,S,Su tsshutdn 0 /delay:0 /powerdown >nul
IF NOT errorlevel 1 GOTO ok
cls
ECHO %shutdowntime% ���Ǳ�׼��ʱ���ʽ,����������
ECHO.
GOTO startet
:no
TITLE BY WJ.L(copy oyzx00)�����ιػ�(����)
echo ��ѡ���˽����ιػ�(����)��
ECHO ��ָ��24Сʱ��ʽʱ��,��ʽΪ Сʱ:����
SET shutdowntime=
SET /p shutdowntime=����:
at %shutdowntime% tsshutdn 0 /delay:0 /powerdown >nul
IF NOT errorlevel 1 GOTO ok
cls
ECHO %shutdowntime% ���Ǳ�׼��ʱ���ʽ,����������
ECHO.
GOTO no
:ok
ECHO.
SET h=%shutdowntime:~1,1%
SET ah=%shutdowntime:~0,1%
SET am=%shutdowntime:~2,2%
SET bh=%shutdowntime:~0,2%
SET bm=%shutdowntime:~3,2%
IF "%h%"==":" (
SET HM=%ah%ʱ%am%��
) ELSE (
SET HM=%bh%ʱ%bm%��)
IF /I "%ask%"=="y" ECHO ϵͳ����ÿ���%HM%�ر�
IF /I "%ask%"=="n" ECHO ϵͳ����%HM%�ر�
ECHO �趨���! �����������...
PAUSE >nul
exit