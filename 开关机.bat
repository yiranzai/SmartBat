@ECHO off
TITLE BY WJ.L(copy oyzx00)每天定时关机/仅本次关机(当天)&CLS&COLOR 0e&MODE con: COLS=41 

LINES=18
:SetHour
CLS
ECHO.
SET ask=
SET /p ask=是否设定为每天执行关机命令(y/n):
IF NOT "%ask%"=="" SET ask=%ask:~0,1%
IF /I "%ask%"=="y" GOTO startet
IF /I "%ask%"=="n" GOTO no
GOTO SetHour
:startet
TITLE BY WJ.L(copy oyzx00)每天定时关机
echo 你选择了每天定时关机，
ECHO 请指定24小时制式时间,格式为 小时:分钟
SET shutdowntime=
SET /p shutdowntime=输入:
at %shutdowntime% /every:M,T,W,Th,F,S,Su tsshutdn 0 /delay:0 /powerdown >nul
IF NOT errorlevel 1 GOTO ok
cls
ECHO %shutdowntime% 不是标准的时间格式,请重新输入
ECHO.
GOTO startet
:no
TITLE BY WJ.L(copy oyzx00)仅本次关机(当天)
echo 你选择了仅本次关机(当天)，
ECHO 请指定24小时制式时间,格式为 小时:分钟
SET shutdowntime=
SET /p shutdowntime=输入:
at %shutdowntime% tsshutdn 0 /delay:0 /powerdown >nul
IF NOT errorlevel 1 GOTO ok
cls
ECHO %shutdowntime% 不是标准的时间格式,请重新输入
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
SET HM=%ah%时%am%分
) ELSE (
SET HM=%bh%时%bm%分)
IF /I "%ask%"=="y" ECHO 系统将于每天的%HM%关闭
IF /I "%ask%"=="n" ECHO 系统将于%HM%关闭
ECHO 设定完毕! 按任意键继续...
PAUSE >nul
exit