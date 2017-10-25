#!/bin/bash
for name in `chkconfig --list|grep 3:on|awk '{print $1}'|egrep -v "ssh"`
do
   chkconfig $name off
done
