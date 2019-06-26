#!/bin/bash
#一个安装配置zabbix_service的脚本
#2019年3月22日20:44:35  1st 开始编写


##############关闭Selinux的强制模式####################

#首先判断Selinux是不是enforcing,如果是
#则修改为Permissive或者disable.

res=`getenforce`
config_file=/etc/selinux/config   #selinux的配置文件

if [ $res = "Enforcing" ];then
	echo -e "\033[31mSelinux为Enforcing,需要修改配置文件\033[0m"
	sed -i "s/SELINUX=enforcing/SELINUX=permissive/g" $config_file
	if [ $? == 0 ];then
		echo -e "\033[32m$config_file已经修好了,重启生效"
	else
		echo -e "\033[31m修改$config_flie失败,请检查配置文件"
	fi
	
fi

###############关闭防火墙#################

systemctl stop firewalld
systemctl disable firewalld

if [ $? == 0 ];then
	echo -e "\033[31m防火墙已经关闭了\033[0m"
fi


#################安装zabbxi-server############

rpm -ivh http://repo.zabbix.com/zabbix/3.4/rhel/7/x86_64/zabbix-release-3.4-2.el7.noarch.rpm

if [ $? == 0 ];then
	echo -e "\033[32m已经成功下载zabbix相关安装包\033[0m"
else
       echo -e "\033[31m下载出错了\033[0m"
fi
	
yum install -y zabbix-server-mysql zabbix-get zabbix-web zabbix-web-mysql zabbix-agent zabbix-sender


###############安装Apache##################

echo -e "\033[31m安装apche\033[0m"
yum -y install httpd 

if [ $? == 0 ];then
       echo -e "\033[31mapche已经成功安装apche\033[0m"
else
       echo -e "\033[31m安装出错了\033[0m"	
fi

#修改时区
time_conf_file=/etc/httpd/conf.d/zabbix.conf
sed -i "s/# php_value date.timezone Europe\/Riga/php_value date.timezone Asia\/Shanghai/g" $time_conf_file
 
if [ $? == 0 ];then
       echo -e "\033[31m修改时区成功\033[0m"
else
       echo -e "\033[31m时区已经修改或者发生了错误,具体查看$time_conf_file配置文件\033[0m"	
fi

#启动httpd服务设置开机启动

systemctl start httpd
systemctl enable httpd


#################安装数据库#################
yum -y install mariadb mariadb-server
if [ $? == 0 ];then
	echo -e "\033[32m已经成功安装mysql\033[0m"
	systemctl start mariadb
	systemctl enable mariadb
	
else
       echo -e "\033[31m安装mysql出错了\033[0m"	
fi

#创建zabbix数据库
create_database_sql="create database zabbix character set utf8 collate utf8_bin"
mysql -e "${create_database_sql}"

#创建zabbix账号和授权,这sql语句的意思是:给来自本地账户zabbix
#对zabbix数据库中的所有表的所有操作的权限,并设置密码为zabbix

create_user="grant all privileges on zabbix.* to zabbix@localhost identified by 'zabbix'"
mysql -e "${create_user}"

#导入zabbix需要的数据表
gunzip /usr/share/doc/zabbix-server-mysql-3.4.15/create.sql.gz
import_sql="source /usr/share/doc/zabbix-server-mysql-3.4.15/create.sql"
mysql zabbix -e "${import_sql}"
if [ $? == 0 ];then
	echo -e "\033[32m成功导入数据表\033[0m"
	systemctl start mariadb
	systemctl enable mariadb
	
else
       echo -e "\033[31m数据表导入错误\033[0m"	
fi


##############安装PHP文件###############

yum -y install php php-mysql


##########配置zabbix server文件 ########

zabbix_server_conf=/etc/zabbix/zabbix_server.conf

sed -i "s/# DBPassword=/DBPassword=zabbix/g" $zabbix_server_conf
sed -i "s/# DBHost=localhost/DBHost=localhost/g" $zabbix_server_conf
sed -i "s/# DBSocket=\/tmp\/mysql.sock/DBSocket=\/var\/lib\/mysql\/mysql.sock/g" $zabbix_server_conf
systemctl start zabbix-server
systemctl enable zabbix-server

