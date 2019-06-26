#!/bin/bash
#这是一个安装zabbix-agent的脚本

rpm -ivh http://repo.zabbix.com/zabbix/3.4/rhel/7/x86_64/zabbix-release-3.4-2.el7.noarch.rpm
yum -y install zabbix-agent zabbix-sender

read -p "请输入zabbix-server的IP地址>>:" IP

AGENT_CONF=/etc/zabbix/zabbix_agentd.conf
sed -i "s/127.0.0.1/$IP/g" $AGENT_CONF

systemctl start zabbix-agent
systemctl enable zabbix-agent
systemctl restart zabbix-agent
systemctl status zabbix-agent
