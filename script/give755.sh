#!/bin/bash
for i in $(ls -l /common/script/*sh | awk '{print $9}')

do
	if  [ ! -x $i ];then

		echo $i
		chmod u+x $i

		if [ $? == 0 ];then
			
			 date "+%Y%m%d %H:%M:%S $i授权成功" >> /common/script/giveLog
		fi
		
	fi

done

if [ $? == 0  ];then

	date "+%Y%m%d %H:%M:%S:no existing *.sh file" >>/common/script/giveLog 
fi
