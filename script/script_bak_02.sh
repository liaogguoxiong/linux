#!/bin/bash
#********************************************************************
#Author:Lgx
#Email:297979949@qq.com
#Date:2019-06-11 11:12:02
#FileName:script_bak_02.sh
#Description:	
#   I find a better way that backup script data ,it is zip.
#   I  will use [zip -u] to update we need to backup script data.
#********************************************************************

B_SOURCE="/common"
B_TARGET_1="/ftp_data/scriptBak/common.zip"
B_TARGET_2="/mnt/cpan/common.zip"
LOG_PATH="/common/log/script_bak_log"

date "+%Y-%m-%d %H:%M:%S:" >> $LOG_PATH
sudo /usr/bin/zip -r -u $B_TARGET_1 $B_SOURCE >> $LOG_PATH

if [ $? -eq 0 ];then

    echo -e "\033[32m[$B_TARGET_1] is already updated\033[0m" | tee $LOG_PATH

else

    echo -e "\033[31m[$B_TARGET_1] update failed\033[0m" | tee $LOG_PATH

fi


date "+%Y-%m-%d %H:%M:%S:" >> $LOG_PATH
sudo /usr/bin/zip -r -u $B_TARGET_2 $B_SOURCE >> $LOG_PATH

if [ $? -eq 0 ];then

    echo -e "\033[32m[$B_TARGET_2] is already updated\033[0m" | tee $LOG_PATH

else

    echo "\033[31m[$B_TARGET_2] update failed\033[0m" | tee $LOG_PATH

fi

