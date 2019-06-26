#!/bin/bash
#备份学习资料的脚本

DATE=`date "+%Y-%m-%d"`
echo $DATE
NAME="_script.gz.tar"
BAK_NAME="$DATE$NAME"
echo /$BAK_NAME

/usr/bin/tar -czvf /$BAK_NAME /common

if [ $? == 0 ];then
	date "+%Y-%d-%m %H:%M:%S 备份成功" >> /common/log/script_bak_log
else
	date"+%Y-%d-%m %H:%M:%S 备份失败" >> /common/log/script_bak_log
	exit
fi

#/usr/bin/chmod 777 /$BAK_NAME

if [ -f /ftp_data/scriptBak/$BAK_NAME ];then

	date "+%Y-%d-%m %H:%M:%S 备份文件已经存在,删除重新备份！" >> /common/log/script_bak_log
	#echo "备份文件已经存在！！！"
	rm -rf /ftp_data/script_bak/$BAK_NAME

fi


/usr/bin/mv /$BAK_NAME /ftp_data/scriptBak

if [ $? == 0 ];then
	date "+%Y-%d-%m %H:%M:%S 已经移动到ftp服务器" >> /common/log/script_bak_log
else
	date "+%Y-%d-%m %H:%M:%S 移动失败" >> /common/log/script_bak_log	
	exit
fi

