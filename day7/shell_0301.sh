#!/bin/bash
. /etc/init.d/functions
[ $UID -ne 0 ] &&{
   echo "only allow root to exec this cmd."
   exit
}

for n in `seq -w 10`
do
   pass="`echo $RANDOM|md5sum|cut -c 1-8`"
   useradd oldboy$n &>/dev/null &&\
   echo $pass|passwd --stdin oldboy$n &>/dev/null
   if [ $? -eq 0 ];then
       action "useradd oldboy$n" /bin/true
   else
       action "useradd oldboy$n" /bin/false
   fi
   echo -e "oldboy$n-t$pass" >> /oldboy.user.txt
   
done
