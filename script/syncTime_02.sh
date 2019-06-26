#!/bin/bash
#用来同步时间
#同步时间的优化版本

TIME_SERVICE_1="time.nuri.net"
TIME_SERVICE_2="time.nist.gov"
TIME_SERVICE_3="asia.pool.ntp.org"
echo  $TIME_SERVICE_1 $TIME_SERVICE_2 $TIME_SERVICE_3

function sync_time()
{
	/usr/sbin/ntpdate $1
	if [ $? == 0 ];then
		
        	date "+%Y-%m-%d %H:%M:%S:$1同步时间成功" >>/common/script/log
		#echo "时间同步成功" >>/common/script/log
		hwclock -w
		return 0
	
	else

        	date "+%Y-%m-%d %H:%M:%S:$1同步时间失败" >>/common/script/log
		return 1

	fi
}

sync_time $TIME_SERVICE_1

# return 1 is that sync time unsuccessfully

if  [ $? == 1 ];then
	
	sync_time $TIME_SERVICE_2
	if [ $? == 1 ];then
		
		sync_time $TIME_SERVICE_3
		
		if [ $? == 1 ];then
			
			#使用了3个同步时间服务器都不能够同步时间，通过邮件来警告用户手动同步时间
			sh /common/script/sendEmail.sh 297979949@qq.com "同步时间失败" "三个同步时间服务器同步时间都失败了,请尽快手动同步时间"
			
			if [ $? == 0 ];then
			
				date "+%Y-%m-%d %H:%M:%S:三个同步时间服务器同步时间都失败了,已邮件告知客户" >>/common/script/log

			fi
		fi
	fi
fi
