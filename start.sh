#!/bin/sh

basepath=$(cd `dirname $0`;pwd)

if [ ! -d ./codes ];
then
mkdir -p codes;
fi

if [ ! -d ./outputs ];
then
mkdir -p outputs;
fi

a=0
for line in `cat ${basepath}/git.txt`
do
mygit=$line
mygits[$c]=$mygit
((c++))
done

cd ${basepath}/codes

index=0
gitLink=""
for i in ${mygits[@]}
do
    echo "第${index}个工程为: ==> ${i}"
    git clone ${i}
    let index++
done

for file_a in ${basepath}/codes/*
do
temp_file=`basename $file_a`
echo $temp_file
gitinspector --timeline=true --format=xml --file-types=** --until=2019-09-30 --since=2019-09-01 ${basepath}/codes/${temp_file}/ > ${basepath}/outputs/${temp_file}.xml
done


