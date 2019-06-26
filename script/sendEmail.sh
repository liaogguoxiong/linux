#/bin/bash
#这是一个用来发送邮件的脚本
#需要传入3个参数,收件人,主题,内容
to=$1
subject=$2
content=$3
/usr/local/bin/sendEmail -f 297979949@qq.com -s smtp.qq.com -u $subject -t $to \
-xu 297979949@qq.com -xp zvwnzgpshdqcbihe -o message-charset=utf8 -m $content
