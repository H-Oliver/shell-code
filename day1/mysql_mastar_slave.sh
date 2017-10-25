#!/bin/bash
one=3307
two=3306
mysql -uroot -p123 -S /data/$one/mysql.sock -e "flush tables with read lock;show master status;system mysqldump -uroot -p123 -A -B -F --events -S /data/$one/mysql.sock >full.sql;unlock tables;" > a.log
mysql -uroot -p123 -S /data/$two/mysql.sock < full.sql
file=`grep mysql a.log |awk '{print $1}'`
pos=`grep mysql a.log |awk '{print $2}'`
mysql -uroot -p123 -S /data/$two/mysql.sock -e "slave stop;change master to master_host='10.0.0.82',master_port="$one",master_user='rep',master_password='123',master_log_file='"$file"',master_log_pos='$pos';slave start;show slave master;">b.log
cat b.log|mail -s 主从同步步骤 oliver@shangtv.cn
