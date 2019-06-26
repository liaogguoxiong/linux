#!/bin/bash
#********************************************************************
#Author:Lgx
#Email:297979949@qq.com
#Date:2019-06-21 17:09:30
#FileName:lovedays_check.sh
#Description：use this script to check days that love with zsy is right 
#********************************************************************

# start go together date

start=`date -d '2016-06-13' +%s`
echo $start
now=`date +%s`
echo $now

((time=now-start))
echo $time

((days=time/86400+1))
echo $days

get_days=`cat /common/script/dateSum`
#because date is tomorrow in /common/script/dateSum,so this value must be minused
((get_days-=1))
echo $get_days

if [ $get_days -ne $days ];then

    date +"%x%X:实际恋爱天数[$days]和发送邮件天数[$get_days]不符合" >> /common/log/check_lovedays
    sh /common/script/sendEmail.sh 297979949@qq.com "恋爱天数对不上" "恋爱天数对不上,请赶紧更新~!"
    if [ $? -eq 0 ];then

	date +"%x%X:已经发送邮件通知主人了" >> /common/log/check_lovedays

    else
    
	date +"%x%X:邮件发送出现了意外~" >> /common/log/check_lovedays
	

    fi

else

    date +"%x%X:实际恋爱天数[$days]和发送邮件天数[$get_days]符合" >> /common/log/check_lovedays

fi
