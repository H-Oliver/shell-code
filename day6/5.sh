#!/bin/bash
#include functions
. /etc/init.d/functions
#
trap "echo "bye,bye";exit" 2
NET=192.168.1.
#
for IP in {1..254}
do
   ping -w 1 -c 1 ${NET}${IP} &>/dev/null
   if [ $? -eq 0 ];then
       action "${NET}${IP}  ......" /bin/true
   else
       action "${NET}${IP}  ......" /bin/false
   fi
done
