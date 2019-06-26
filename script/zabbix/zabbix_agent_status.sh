#!/bin/bash
#通过systemctl status zabbix-agent
#来看zabbix-agent的状态,如果是active
#则输出1,否则输出0

###!!!!!!坑,其他的服务都能够执行,
STATUS=`systemctl status zabbix-agent | sed -n '/Active/p' | awk '{print $2}'`
#echo $?
#echo $STATUS
if [[ $STATUS == "active" ]];then
	echo 1 > /common/script/zabbix_status.txt
	date "+%Y-%m-%d %H:%M:%S:zabbix-agent正常" >> /common/status_file/zabbix_status_log
else	
	echo 0 > /common/script/zabbix_status.txt
	date "+%Y-%m-%d %H:%M:%S:zabbix-agent挂了" >> /common/status_file/zabbix_status_log
fi
