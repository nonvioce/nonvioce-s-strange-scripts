#/bin/sh
#Author:nonvioce

#默认文件夹
DDIR="~/Downloads/"


#判断文件夹是否存在，不存在创建新的
mDir(){
	if [ ! -d $1 ];then
		mkdir $1
	fi
}

#判断文件类型并归类
mV(){
	fileN=$1
	#后缀名
	lastName=${fileN##*.}
	#配置文件
	typeLong=`grep $lastName<keepYourFuckingDownloadsFolderClean.config`
	echo "start"
	#移动文件
	mv $fileN $DownloadsDir${typeLong%%:*}"/"
}


#设置默认文件夹,也可由第一个参数加入要整理的文件夹
DownloadsDir=$1
if [ -z "$DownloadsDir" ]
then
	DownloadsDir=$DDIR
fi

#格式化为以/结尾
if [ "${DownloadsDir:-1}" != '/' ];then
	DownloadsDir=$DownloadsDir'/'
fi

#判断文件夹是否存在，不存在创建新的
mDir $DownloadsDir"图片"
mDir $DownloadsDir"视频"
mDir $DownloadsDir"文档"
mDir $DownloadsDir"压缩文件"
mDir $DownloadsDir"影音"
mDir $DownloadsDir"文本"
mDir $DownloadsDir"编程"
mDir $DownloadsDir"Windows可执行程序"
mDir $DownloadsDir"字体"
mDir $DownloadsDir"文献"

#遍历文件
for file in `ls $DownloadsDir`
do  
	if [ -f $file ];then
		mV $DownloadsDir$file
	fi
done
