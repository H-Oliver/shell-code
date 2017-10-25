#!/bin/bash
array=(
www.baidu.com
www.fatmouse.com
www.qq.com
192.168.1.222
)

for n in ${array[*]}
do
  curl=`curl -l -s -m 2 $n|egrep "200|302"|wc -l`
  if [  $curl -eq 1 ]
  then
     echo "$n is ok"
  else
     echo "$n is NO"
  fi
done
