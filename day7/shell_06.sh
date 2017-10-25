#!/bin/bash
if [ $# -ne 1 ];then
   echo  "Usage:$0 ARG"
   exit 1
fi
ipt(){
awk '{print $1}' $1|grep -v "127.0.0.1"|sort|uniq -c|sort -rn -k1 >/tmp/tmp.log
exec < /tmp/tmp.log
while read line
do
ip=`echo $line|awk '{print $2}'`
if [ `echo $line|awk '{print $1}'` -gt 10 -a `iptables -L -n |grep "$ip"|wc -l` -lt 1 ];then
    iptables -I INPUT -s $ip -j DROP
    echo $ip >> /tmp/ip_$(date +%F).log
fi
done
}
del(){
   touch /tmp/ip_$(date +%F -d '-1day'.log)
   exec < /tmp/ip_$(date +%F -d '-1day'.log)
   while read line
   do
      if [ `iptables -L -n |grep "$ip"|wc -l` -ge 1 ];then
         iptables -D INPUT -s $line -j DROP
      fi
   done
}

main(){
while true
do
   ipt $1
   sleep 5
   del
done
}
main $*
