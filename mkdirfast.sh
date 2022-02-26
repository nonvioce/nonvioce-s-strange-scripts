#/bin/bash
#按照name.txt中每行的文本建立文件夹
for line in $(<name.txt); do mkdir $line; done
