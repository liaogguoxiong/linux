#!/bin/bash
#********************************************************************
#Author:Lgx
#Email:297979949@qq.com
#Date:2019-06-11 14:27:00
#FileName:script_bak_03.sh
#Description： 
#   I find a better way that backup script data ,it is zip.
#   I  will use [zip -u] to update we need to backup script data.
#   this script use a method that instrodute some parameters.
#   script_bak_02.sh's optimized version is this script!
#   
#   time:2019-06-19 13:39  update script
#   
#   add:call a script that named send_file_to_windows.sh to 
#   come true from linux send file to windows
#
#********************************************************************

B_SOURCE="/common"
B_TARGET_1="/ftp_data/scriptBak/common.zip"
B_TARGET_2="/mnt/cpan/common.zip"
LOG_PATH="/common/log/script_bak_log"
SCRIPT_PATH="/common/script/send_file_to_windows.sh"

function backup_common()

{

    date "+%Y-%m-%d %H:%M:%S:" >> $1
    sudo /usr/bin/zip -r -u $2 $3 >> $1

    if [ $? -eq 0 ];then
         
	 echo -e "\033[32m[$2] is already updated\033[0m" | tee -a $1
	   
    else
	 
	 echo -e "\033[31m[$2] update failed\033[0m" | tee -a $1
	       
    fi


}

#backup data to /ftp_data/scriptBak/common.zip

backup_common $LOG_PATH $B_TARGET_1 $B_SOURCE

#backup data to /ftp_data/scriptBak/common.zip

backup_common $LOG_PATH $B_TARGET_2 $B_SOURCE

## we can send this zip to windows ##

sh $SCRIPT_PATH


