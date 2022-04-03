write_bin_arr=()

#获取参数
if [ -z "$1" ];then
echo "not exist need write bin file"
exit 0
fi

cd tools 
pwd
bochsrc_path=`pwd`
bochsrc_path="$bochsrc_path/bochsrc_windows.bxrc"

for arg in $@
do 
    write_bin_arr+=($arg)
    echo $arg
done

echo 'build asm file...'
sector_arr=()
bin_name_arr=()
for element in ${write_bin_arr[@]}
do
if grep '^[[:digit:]]*$' <<< "$element";then
    echo "$element is number"
    sector_arr+=($element)
else
    echo "$element is not number"
    bin_name_arr+=($element)
fi
done

if [ "${#sector_arr[@]}" -ne "${#bin_name_arr[@]}" ]
then
    echo 'write bin file argument error!'
    exit 0
fi 

for sector_index in ${!sector_arr[@]}
do
./vhdwriter.exe -w Base1VirtualDisk.vhd -a ${sector_arr[$sector_index]} -r ../build/${bin_name_arr[$sector_index]}.bin
done

cd /d/Program\ Files/Bochs-2.7/

 ./bochsdbg.exe -f $bochsrc_path
exit 0
