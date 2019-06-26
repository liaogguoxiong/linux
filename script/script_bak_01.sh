#!/bin/bash
#time:2019-5-20 13:58:35
#author:lgx
#description:backup script with a incremental way

path="/common/*"
date=`date "+%Y-%m-%d"`
ename="_common"
fname="$date$ename"
res=${path:-null}

echo $res
echo $fname

if [ $res = "null" ];then
	
	echo -e "\033[34mthis path is null,please input a correct path\033[0m"
	exit
fi

sudo /usr/bin/tar -czvf /ftp_data/scriptBak/$fname.tar.gz --newer-mtime="$date 0:00" $path

if [ $? == 0 ];then

	date "+%Y-%m-%d %H:%M:%S:backup success" >> /common/log/script_backup

else
	
	date "+%Y-%m-%d %H:%M:%S:backup failed" >>	/common/log/script_backup

fi
