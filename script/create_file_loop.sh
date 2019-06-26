#!/bin/bash
#Describe:loop create file and rename a filename by rules

filename=`cat /common/status_file/file_name`
dirname="/common/script/test12"

for f in $filename

do
	echo $f

	if [ ! -d $dirname ];then

		mkdir $dirname
	fi
	#echo $dirname/$f
	touch $dirname/$f
	
	if [ $? == 0 ];then
		
		echo "$f create successfully"
	else
		echo "$f create failed"
	fi
	#echo /common/script/test/${f%000*}.jps
	mv $dirname/$f $dirname/${f%000*}.jps


done
