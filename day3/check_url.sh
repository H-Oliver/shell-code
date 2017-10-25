#!/bin/bash
[ -f /etc/init.d/functions ]&& . /etc/init.d/functions

usage(){
    echo "USAGE:$0 url"
    exit 1
}

RETVAL=0
checkUrl(){
    wget -T 10  --spider -t 2 $1 &>/dev/null
    RETVAL=$?
    if [ $? -eq 0 ];then
         action "$1 url" /bin/true
    else
         action "$1 url" /bin/false
    fi
    return $RETVAL
}

main(){
    if [ $# -ne 1 ];then
        usage
    fi
    checkUrl $1
    RETVAL=$?
    return $RETVAL
}

main $*
