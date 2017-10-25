#!/bin/bash
. /etc/init.d/functions

path=/scripts
userdb=$path/user.db
faildb=$path/fail_user.db

[ -d "$path" ] || mkdir -p $path
[ -f "$userdb" ] || touch $userdb
[ -f "$faildb" ] || touch $faildb

for n in $(seq -w 10)
do
  passwd=`echo $(date +%t%N)$RANDOM|md5sum|cut -c 2-9`
  useradd oldboy$n >&/dev/null && user_status=$?
  echo "$passwd"|passwd --stdin oldboy$n >& /dev/null && pass_status=$?
  if [ $user_status -eq 0 -a $pass_status -eq 0 ];then
      action "adduser oldboy$n" /bin/true
      echo -e "user:\t oldboy$n passwd:$passwd" >>$userdb
  else
      action "adduser oldboy$n" /bin/false
      echo -e "user:\t oldboy$n passwd:$passwd" >>$faildb
  fi
done
