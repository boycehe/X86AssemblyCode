#!/bin/bash

build_files_arr=()
#获取参数
if [ -z "$1" ];then
echo "not exist need build file"
exit 0
fi
#删除build产物
rm -rf build/
mkdir build

cd ./src/

for arg in $@
do 
    build_files_arr+=($arg)
done

echo 'build asm file...'
for file in ${build_files_arr[@]}
do
echo 'build ' $file ' ...'
ext=${file##*.}
fname=`basename $file $ext`
fname=$fname"bin"
fname="$fname"
nasm $file -o ../build/$fname
done
exit 0
