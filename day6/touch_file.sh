#!/bin/bash
trap "find /tmp -type f -name 'oldboy_*'|xargs rm -f && exit" INT


while :
do
    touch /tmp/oldboy_$(date +%F_%T)
    usleep 50000
done
