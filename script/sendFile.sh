#!/bin/bash
#一个服务器互传文件的脚本
#需要传入4个参数,第一个传输文件的路径,如果不是在当前位置的话,需要传入绝对路径
#第二个传入,收件人的账号;
#第3个传入收件人的ip地址
#第4个传入文件存放的位置
source=$1
user=$2
ip=$3
host=$4
/usr/bin/scp $source $user@$ip:/$host
if [ $? == 0 ];then
	echo -e "\033[31m文件传输成功\033[0m"
fi 
