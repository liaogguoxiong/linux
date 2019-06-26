#!/bin/bash
#********************************************************************
#Author:Lgx
#Email:297979949@qq.com
#Date:2019-06-24 10:23:21
#FileName:bash_version_info.sh
#Description：BASH_VERSINFO is a array and has six elements.now i ouput them by loop 
#********************************************************************

for i in `seq 0 5`

do 

    echo "BASH_VERSINFO[$i]=${BASH_VERSINFO[$i]}"

done
