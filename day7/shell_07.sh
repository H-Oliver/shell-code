#!/bin/bash
[ -f /etc/init.d/functions ] && . /etc/init.d/functions
MYUSER=root
MYPASS=oldboy123
SOCKET=/data/3306/mysql.sock
MYCMD="mysql -u$MYUSER -p$MYPASS -S$SOCKET"
MYADMIN="mysqladmin -u$MYUSER -p$MYPASS -S$SOCKET"
MYPS=`netstat -nelp |grep 3306 |wc -l`

judge(){
  RETVAL=$?
  sleep 2
  if [ $RETVAL -eq 0 ];then
    action "$1 mysql" /bin/true
  else
     action "$1 mysql" /bin/false
  fi
  return $RETVAL
}

start(){
  mysqld_safe --defaults-file=/data/3306/my.cnf &>/dev/null &
  judge start
}

stop(){
  $MYADMIN shutdown >/dev/null 2>&1
  judge stop
}

case "$1" in
   start)
       start
       ;;
   stop)
       stop
       ;;
   restart)
       stop
       sleep 3
       start
       ;;
   *)
       echo -e "\nUsage: $0 {start|stop|restart}\n"
       exit $RETVAL
esac
