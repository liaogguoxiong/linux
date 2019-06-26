#!/bin/bash
#********************************************************************
#Author:Lgx
#Email:297979949@qq.com
#Date:2019-06-17 14:13:52
#FileName:father.sh
#Description:we can know more knowledge about env var and local var
#********************************************************************

echo "Father process ID is $$"


#define a env var

env_var="i am a env_var"
export env_var
echo "env_var=$env_var"

#defind local var

local_var="i am a local_var"

echo "local_var=$local_var"


#call a script and crete a child pid

sh child.sh


echo "Father process ID is $$"
echo "env_var=$env_var"
echo "local_var=$local_var"




