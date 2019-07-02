#!/bin/bash
#********************************************************************
#Author:Lgx
#Email:297979949@qq.com
#Date:2019-06-19 11:23:42
#FileName:send_file_to_windows.sh
#Description：this script can send /ftp_data/scriptBak/common.zip to windows
# 需要传入4个参数:$1:linux要传输的文件的绝对路径
#		  $2:接受方的ip地址
#		  $3:接收方的接收文件路径
#		  $4:接收方的用户名
#
#   执行格式:sh 脚本名 $1 $2 $3 $4
#********************************************************************

#file_path="/ftp_data/scriptBak/common.zip"
log_path="/common/log/send_file_to_windows"

if [ ! -f $1 ];then

    date "+%Y-%m-%d %H:%M:%S:[$1] is not exist!!" >> $log_path
    exit 1

fi
#d:/linux学习/shell相关/common

/usr/bin/scp $1 $4@$2:$3

if [ $? -eq 0 ];then

    date "+%Y-%m-%d %H:%M:%S:[$1] had been send to windows" >> $log_path

else
    
    date "+%Y-%m-%d %H:%M:%S:[$1] sended to windows unsuccessfully" >> $log_path

fi



    

