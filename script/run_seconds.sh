#!/bin/bash
#********************************************************************
#Author:Lgx
#Email:297979949@qq.com
#Date:2019-06-24 10:45:11
#FileName:run_seconds.sh
#Description：test script runn'time
#********************************************************************

count=1
time=6

while [ $SECONDS -le $time ]

do

    echo "this is $count time!!"
    ((count+=1))
    sleep 2


done

echo "this script run time is $SECONDS"
