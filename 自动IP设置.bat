rem ���ϴ���GIthub��https://github.com/yiranzai/SmartBat
echo offclstitle ���IP����
echo �������IP��ַ�����Ժ򡭡�
netsh interface ip set address name="��̫��" source=dhcp 
echo ���ڸ���DNS���ã����Ժ򡭡�
netsh interface ip set dns "��̫��" static 115.159.55.78 primary 
netsh interface ip add dns name = "��̫��" addr=201.196.118.168
echo ɾ��IP���ã�����Ϊ�Զ���
echo *************** ��ϲ�㣬����ɹ���ɣ�*************