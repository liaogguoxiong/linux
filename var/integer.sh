#!/bin/bash
#********************************************************************
#Author:Lgx
#Email:297979949@qq.com
#Date:2019-06-13 15:39:52
#FileName:integer.sh
#Description： 
#********************************************************************

a=2009
let "a+=1"
echo "$a"

b=xx09
echo "b=$b"
declare -i b  # str translate int forcibly
echo "$b"

let "b+=1"
echo "b=$b"

exit 0 
