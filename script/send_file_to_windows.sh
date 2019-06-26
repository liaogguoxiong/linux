#!/bin/bash
#********************************************************************
#Author:Lgx
#Email:297979949@qq.com
#Date:2019-06-19 11:23:42
#FileName:send_file_to_windows.sh
#Description：this script can send /ftp_data/scriptBak/common.zip to windows
#********************************************************************

file_path="/ftp_data/scriptBak/common.zip"
log_path="/common/log/send_file_to_windows"

if [ ! -f $file_path ];then

    date "+%Y-%m-%d %H:%M:%S:[$file_path] is not exist!!" >> $log_path
    exit 1

fi

/usr/bin/scp $file_path lgx@192.168.1.10:/d:/linux学习/shell相关/common

if [ $? -eq 0 ];then

    date "+%Y-%m-%d %H:%M:%S:[$file_path] had been send to windows" >> $log_path

else
    
    date "+%Y-%m-%d %H:%M:%S:[$file_path] sended to windows unsuccessfully" >> $log_path

fi



    

