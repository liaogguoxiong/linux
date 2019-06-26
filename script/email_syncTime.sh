#!/bin/bash
#describe:it is a script that send email when three ntp Server can't work normal

status=`cat /common/status_file/sync_time`

if [ $status !=  0 ];then

	sh /common/script/sendEmail.sh 297979949@qq.com "sync time failling" "three ntp Server sync time failing,please sync time immediately"
 	
	if [ $? -eq 0 ];then
	
		date "+%Y-%m-%d %H:%M:%S:sync time failed and alread send email to 297979949@qq.com">>/common/log/email_sync_time  	    
	
	else
		
		date "+%Y-%m-%d %H:%M:%S:send email failed" >>/common/log/email_sync_time
	
	fi
	
fi
	
