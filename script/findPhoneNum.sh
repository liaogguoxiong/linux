#!/bin/bash
#Description:
#		user input a name,system export phoneNum

read -p "please input a num:" inp_name
echo $inp_name
name1="\<$inp_name\>"
echo $name1

out_name=`awk 'BEGIN {FS="/"}  {print $1}' /common/awk/stu_grade | grep $name1 `
out=`awk 'BEGIN {FS="/"}  {print $0}' /common/awk/stu_grade | grep $name1 `
phone_num=`echo $out | awk 'BEGIN {FS="/"} {print $4}'`

echo $out_name
if [ $inp_name = $out_name ];then

    #phone_num=`awk 'BEGIN {FS="/"} {print $4}' /common/awk/stu_grade | grep $name1 `
    echo $phone_num 

else
    
    echo "$inp_name is no exist"

fi
