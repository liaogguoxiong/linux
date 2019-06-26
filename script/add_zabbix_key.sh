#!/bin/bash

read -p "please input key name:" key_name \
&& read -p " please input key:" key
echo $key_name
echo $key
Parameter=$key_name,$key
UserParameter="UserParameter=Parameter"
echo $UserParameter
echo $UserParameter >> /etc/zabbix/zabbix_agentd.conf

if [ $? == 0 ];then

	echo "new key already add into zabbix_agentd.conf!!"
	systemctl restart zabbix-agent && echo "zabbix-agent restart successfully" || echo "zabbix-agent restart unsuccessfully"
else
	echo "new key add unsuccessfully"
fi
		
	

