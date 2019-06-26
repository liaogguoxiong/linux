#!/bin/bash
#用来同步时间
#同步时间的建议版本

TIME_SERVICE_1="time.nuri.net"
TIME_SERVICE_2="time.nist.gov"
TIME_SERVICE_3="asia.pool.ntp.org"
echo  $TIME_SERVICE_1 $TIME_SERVICE_2 $TIME_SERVICE_3

function sync_time()
{
	/usr/sbin/ntpdate $1
	if [ $? == 0 ];then
	
        	date "+%Y-%m-%d %H:%M:%S:同步时间成功" >>/common/script/log
		#echo "时间同步成功" >>/common/script/log
		hwclock -w
	else
	
	
        	date "+%Y-%m-%d %H:%M:%S:同步时间失败" >>/common/script/log
	fi
}
sync_time $TIME_SERVICE_1
