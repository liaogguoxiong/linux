#!/bin/bash
#Describe:it is a script that sync time
#Version:this is third version

TIME_SERVICE_1="time.nuri.net"
TIME_SERVICE_2="time.nist.gov"
TIME_SERVICE_3="asia.pool.ntp.org"
PATH="/common/log/sync_time"

function sync_time()
{
	/usr/sbin/ntpdate $1
	if [ $? == 0 ];then
		echo "0" > /common/status_file/sync_time	
		/usr/bin/date "+%Y-%m-%d %H:%M:%S:$1同步时间成功" >>$PATH
		/usr/sbin/hwclock -w
		return 0	
	
	else

        	/usr/bin/date "+%Y-%m-%d %H:%M:%S:$1 sync time failling" >>$PATH
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
			
			#if three ntp Server can't sync time,it will send email to 297979949@qq.com
			#sh /common/script/sendEmail.sh 297979949@qq.com "sync time failling!!" \
			# "three ntp Server can't sync time,please sync time immediately by yourself"
			#if [ $? == 0 ];then
			
				#date "+%Y-%m-%d %H:%M:%S:three ntp Server can't sync time,already send Email to 297979949@qq.com!" >>/common/script/log
			
			#fi
			
			###############upper code is old code,under code is new####################
			
			#In second version,if do this script once a minute,and that
			#three ntp Server don't work,this script will send email to
			#297979949@qq.com once a minute,it is terrible.so i optimize
			#this script once again.
			

			#return 1 mean sync time failling,i write this return value into
			# a file and write the other one script that to send Email to 
			# 297979949@qq.com.

			echo "1" > /common/status_file/sync_time
		else
			
			echo "0" > /common/status_file/sync_time
		fi
	fi
fi
