#!/bin/bash
#********************************************************************
#Author:Lgx
#Email:297979949@qq.com
#Date:2019-06-17 14:47:27
#FileName:child.sh
#Description： 
#********************************************************************

echo "the child process is:$$"
echo "the father process is:$PPID"

echo "env_var=$env_var"
echo "env_local=$local_var"

env_var="i am a  env_var from child "
local_var="i am a local_var from child"
echo "env_var=$env_var"
echo "local_var=$local_var"
