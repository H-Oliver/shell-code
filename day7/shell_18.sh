#!/bin/bash
array=()
for n in {1..32767}
do
    re=`echo $n|md5sum|cut -c 1-8`
    for (i=0;i<${array[*]};i++)
    do
       if [ {"${array[i]}"} == "$re" ];then
         echo -e "$n\t $re" >> /oldboy/re.txt
       fi
    done
    #echo -e "$n\t`echo $n|md5sum|cut -c 1-8`"
done
