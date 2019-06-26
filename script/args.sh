#!/bin/bash
#********************************************************************
#Author:Lgx
#Email:297979949@qq.com
#Date:2019-06-10 10:39:19
#FileName:args.sh
#Description：study agrs
#********************************************************************

ARGS=1
E_BADARGS=55
E_NOFILE=56

if [ $# -ne $ARGS ];then

    echo "Usage:[executable file] [input file]"
    exit $E_BADARGS
fi
