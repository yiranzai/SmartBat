rem ���ϴ���GIthub��https://github.com/yiranzai/SmartBat
echo offclstitle ����IP
echo ��������IP��ַ�����Ժ򡭡�
netsh interface ip set address "��̫��" static 10.33.6.99 255.255.0.0 10.33.250.250 1
echo ���ڸ���DNS���ã����Ժ򡭡�
netsh interface ip set dns "��̫��" static 115.159.55.78 primary 
netsh interface ip add dns name = "��̫��" addr=201.196.118.168
echo ******��ϲ�㣬�޸���ɣ�******