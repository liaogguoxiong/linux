#!/bin/bash


echo "\$0 is:$0"
echo "\$1 is:$1"
echo "\$2 is:$2"
dirname $0
basename $0
echo $*
echo $#
echo $$
echo $@
echo "==========================="
for i in "$@"
do
	echo $i
done

echo "==========================="

for i in "$*"
do
	echo $i
done	
echo "==========================="
pwd
echo $_	
