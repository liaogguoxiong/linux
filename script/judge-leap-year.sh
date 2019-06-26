#!/bin/bash
#********************************************************************
#Author:Lgx
#Email:297979949@qq.com
#Date:2019-06-19 14:57:26
#FileName:judge-leap-year.sh
#Description：judge a year is leap-year
#             能被4整除,但不能被100整除的年份都是闰年
#	      能被100整除,但又能被400整除的年份是闰年
#********************************************************************

read -p "please input a year num:" year

let "n4=$year % 4"
let "n100=$year % 100"
let "n400=$year % 400"

echo $n4,$n100,$n400

if [ $n4 -eq 0 -a $n100 -ne 0 ];then

    echo "$year is leap-year"

elif [ $n100 -eq 0 -a $n400 -eq 0 ];then

    echo "$year is leap-year"

else

    echo "$year not is leap-year"

fi
    
