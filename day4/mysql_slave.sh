#!/bin/bash
. /etc/init.d/functions

USER=root
PASSWORD=123456
PORT=3307
error=(1158 1159 1008 1007 1062)
MYSQLCMD="mysql -u$USER -p$PASSWORD -P$PORT"

is_run(){
  [ `lsof -i:$PORT|wc -l` -lt 2 ]&&{
    echo "mysql server is stopped."
    exit 1
  }
}

status_array(){
  status=($($MYSQLCMD -e "show slave status\G"|egrep "_Running|Last_Errno|Behind_Master"|awk '{print $NF}'))
}

status_error(){
  for((i=0;i<${#error[*]};i++))
  do
    if [ "$1" == "${error[$i]}" ]
      then
        $MYSQLCMD -e "stop slave;set global sql_slave_skip_counter=1;start slave;"
    else
        echo "Mysql slave is failed,errorno is $1"
    fi
  done
}

judge_salve(){
  status_array
  if [  "${status[0]}" == "Yes" -a "${status[1]}" == "Yes" -a "${status[3]}" == "0" ];then
    echo "Mysql slave is ok"
  else
    status_error ${status[2]}
  fi
}

main(){
while true
do
  is_run
  judge_slave
  sleep 60
done
}

main
