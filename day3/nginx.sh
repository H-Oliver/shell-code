#!/bin/bash
[ -f /etc/init.d/functions ]&& . /etc/init.d/functions

nginx="/application/nginx/sbin/nginx"

proc=`basename $nginx`

pidfile=/application/nginx/logs/nginx.pid

start(){
    if [ -f $pidfile ];then
      echo "$proc is running"
    else
      [ -f $nginx ] || exit 1
      [ -x $nginx ] || exit 2
      /application/nginx/sbin/nginx &> /dev/null
      action "$proc is started" /bin/true
    fi
}


