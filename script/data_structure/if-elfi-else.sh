#!/bin/bash
#********************************************************************
#Author:Lgx
#Email:297979949@qq.com
#Date:2019-06-19 13:57:08
#FileName:if-elfi-else.sh
#Description：study if-elif-else strcture
#********************************************************************
while true

do

read -p "please input your score:" score

if [ $score -lt 0 -o $score -gt 100 ];then

    echo "error score!!!"

elif [ $score -eq 100 ];then

    echo "wow~full mark!you get a A+"

elif [ $score -eq 0 ];then

    echo "terrible!!you get a duck's egg!!!"

elif [ $score -lt 100 -a $score -ge 90 ];then

    echo "you get a A !!!!"

elif [ $score -lt 90 -a $score -ge 80 ];then

    echo "you get a B !!!!"

elif [ $score -lt 80 -a $score -ge 70 ];then

    echo "you get a C !!!"

elif [ $score -lt 70 -a $score -ge 60 ];then

    echo "you get a D !!!"

else 
    
    echo "you are fail !!!"

fi

done
