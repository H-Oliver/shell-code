#!/bin/bash
. /etc/init.d/functions
uplist=/tmp/uplist.log
downlist=/tmp/downlist.log
[ -f $uplist ] || touch $uplist
[ -f $uplist ] && > $uplist

[ -f $downlist ] || touch $downlist
[ -f $downlist ] && > $downlist

function for_ping(){
for n in `seq 254`
do
  ping -c 1 -i 0.01 192.168.1.$n &>/dev/null
  if [ $? -eq 0 ];then
      action "192.168.1.$n is up" /bin/true |tee -a $uplist
  else
      action "192.168.1.$n is down" /bin/false |tee -a $downlist
  fi
done
}

function while_ping(){
IP=1
while [ $IP -le 255 ]
do
    ping -c 1 -i 0.5 192.168.1.$IP &>/dev/null
    STRING=$?
    if [ $STRING -eq 0 ];then
      action "192.168.1.$IP is up" /bin/true |tee -a $uplist
    else
      action "192.168.1.$IP is down" /bin/false |tee -a $downlist
    fi
    let IP=$IP+1
done
}

while_ping
