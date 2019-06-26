#!/bin/bash
#Desciption:
#	     input userName and this script will output uId and userHomePath


read -p "please input a username that you want to find homePath:" username

if [[ $username = "" ]];then
    
    echo "this username is null"

else
    
   awk -v uname=$username ' BEGIN {FS=":"} { if($1~uname) print $0 } ' /etc/passwd > record
   num=`cat record | wc -l`
   echo $num

   if [ $num == 1 ];then
    
	uId=`cat record |awk 'BEGIN{FS=":"} {print $3}'`
	homePath=`cat record | awk 'BEGIN{FS=":"} {print $6}' `
	echo "$username's uid is:$uId"
	echo "$username's homePath is:$homePath"
   
   else
	
	while read -r line
	    
	    do

		echo $line
	    
	    done <record

    fi

fi

