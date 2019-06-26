c="A"
v="B"
if [ -d /tmp/DBback ];then
   rm -rf /tmp/DBback
   mkdir /tmp/DBback
else
   mkdir /tmp/DBback
fi
until echo "$c" |grep -q '^[12]$' || test "$c" = "" ;do
   echo -n "备份全部税号资料按1，备份指定税号资料按2(默认输入为1)："
   read c
done;
if [ "$c" = "" ];then
	c=1
fi
if [ "$c" = 1 ];then
        for dir in `ls -d /var/jscard*`
	do
		id=${dir##*jscard_}
		pg_dump -a -F t -U postgres fwkp_$id > `echo "/tmp/DBback/${id}.dat"`
	done
else
cat /2.txt | while read line
do
    for i in `ls -d /usr/local/*`
      do
	if [[ "$i" =~ "${line}" ]];then
	pg_dump -a -F t -U postgres fwkp_${line} > `echo "/tmp/DBback/${line}.dat"`	
	fi
      done
done
fi
echo "备份完成"
until echo "$v" |grep -q '^[12]$' || test "$v" = "" ;do
	echo -n "传到其他主控按1，保留在本机按2:"
	read v
done;
if [ "$v" = "" ];then
        v=2
fi
if [ "$v" = 1 ];then
until echo "$ip" | grep -q '^[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}$' ;do
	echo -n "请输入目标主机ip:"
	read ip
done
sftp "$ip" <<!
mkdir /tmp/DBback
mput /tmp/DBback/* /tmp/DBback
!
rm -rf /tmp/DBback
echo "传输完毕，备份的数据在/tmp/DBback下，在对端主机运行还原脚本自动还原备份。"
else
echo "备份完毕，备份的数据在/tmp/DBback下。"
exit
fi
