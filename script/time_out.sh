#!/bin/bash
#********************************************************************
#Author:Lgx
#Email:297979949@qq.com
#Date:2019-06-24 13:44:16
#FileName:time_out.sh
#Description： 
#********************************************************************


TMOUT=3
read -p "please input your name:" name

if [ -z $name ];then

    echo "your name is null"

else

    echo "yor name is $name"

fi
