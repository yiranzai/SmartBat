rem 已上传到GIthub：https://github.com/yiranzai/SmartBat
echo offclstitle 清除IP设置
echo 正在清除IP地址，请稍候……
netsh interface ip set address name="以太网" source=dhcp 
echo 正在更改DNS设置，请稍候……
netsh interface ip set dns "以太网" static 115.159.55.78 primary 
netsh interface ip add dns name = "以太网" addr=201.196.118.168
echo 删除IP设置，设置为自动。
echo *************** 恭喜你，命令成功完成！*************