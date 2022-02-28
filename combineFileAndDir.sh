#/bin/bash
#在同一目录下，批量将文件放入同名文件夹
#输入为路径
Folder=$1
if [ "${Folder:-1}" != '/' ];then
    Folder=$Folder'/'
    echo "已将$1格式化为$Folder"
fi
for file in ${Folder}*
do  
    if [ -f $file ];then
    	echo "正在移动$file"
    	(mv $file ${file%.*}/)||(mkdir ${file%.*}/;echo "已创建目录${file%.*}/";mv $file ${file%.*}/)
    fi
done
echo "批量移动完成"
