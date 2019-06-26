#!/bin/bash
#********************************************************************
#Author:Lgx
#Email:297979949@qq.com
#Date:2019-06-20 09:56:19
#FileName:case-esac.sh
#Description：study case-esac construction
#********************************************************************

read -p "please input a month's num:" n

case $n in 

1)

     echo "The month is January!!!";;

2)

     echo "The month is February!!!";;

3)

    echo "The month is	March!!!";;

4)
    
    echo "The month is April!!!";;

5)

    echo "The month is May!!!";;

*)

    echo "error"

esac
