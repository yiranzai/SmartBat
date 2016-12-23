rem 已上传到GIthub：https://github.com/yiranzai/SmartBat
echo offclstitle 设置IP
echo 正在设置IP地址，请稍候……
netsh interface ip set address "以太网" static 10.33.6.99 255.255.0.0 10.33.250.250 1
echo 正在更改DNS设置，请稍候……
netsh interface ip set dns "以太网" static 115.159.55.78 primary 
netsh interface ip add dns name = "以太网" addr=201.196.118.168
echo ******恭喜你，修改完成！******