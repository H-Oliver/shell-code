#!/bin/bash
[ -f /etc/init.d/functions ]&& . /etc/init.d/functions

#define array url list
array=(
http://www.etiantian.org
http://www.taobao.com
http://oldboy.blog.51cto.com
http://10.0.0.7 
)

#check url
wait(){
echo -en "wait 3s"
for((i=0;i<3;i++))
do
    echo -n "."
    sleep 1
done
echo 
}

check_url(){
   wget -T 5 -t 2 --spider $1 &>/dev/null
   RETVAL=$?
   if [ $RETVAL -eq 0 ];then
      action "check $1"  /bin/true
   else
      action "check $1" /bin/false
   fi
   return $RETVAL
}

main(){
   wait
   for ((i=0;i<${#array[*]};i++))
   do
     check_url ${array[i]}
   done
}
main $*
