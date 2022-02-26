#/bin/bash
#在同一目录下，批量将文件放入同名文件夹
#输入为路径
Folder_A=$1 
for file_a in ${Folder_A}/*
do  
    echo $file_a
    mv $file_a ./${file_a%.*}/  
done
