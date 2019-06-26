count=$(cat /common/script/dateSum)
echo $count

if [ $count -eq 1104 ];then

	date "+ %Y年%m月%d日 %H:%M:%S $count" >> /common/script/EmailLog
	echo "这是我爱你的第$count天!!!嘻嘻"
	sh /common/script/sendEmail.sh 602823525@qq.com "我的宝宝,生日快乐" "这是我爱你的第$count天!!!嘻嘻,今天是大宝子的22岁生日,但是宝宝看起来还是18岁诶,可能是因为你太漂亮可爱啦!嘿嘿嘿,生日快乐哈,虽然哥哥不在你身边,但是哥哥心里都是你嘿嘿嘿,么么么哒,爱你哦,祝我滴宝宝生日快乐,开开心心,昨晚对不起哦,哥哥太困了就睡觉觉啦,没有及时跟宝宝说生日快乐,该打,哥哥错了,你就原谅哥哥吧!!么么哒!生日快乐!~.~!"
	count=$(($count+1))
	echo $count > /common/script/dateSum
else

	date "+ %Y年%m月%d日 %H:%M:%S $count" >> /common/script/EmailLog
	echo "这是我爱你的第$count天!!!嘻嘻"
	sh /common/script/sendEmail.sh 602823525@qq.com "这就是爱" "这是我爱你的第$count天!!!嘻嘻"
	count=$(($count+1))
	echo $count > /common/script/dateSum
fi 
