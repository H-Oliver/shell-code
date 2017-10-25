#企业实战题9:如何实现对MySQL数据库进行分表备份，请用脚本实现
#!/bin/bash
BAKPATH=/server/backup
MYUSER=root
MYPASS=oldboy123
SOCKET=/data/3306/mysql.sock
MYCMD="mysql -u$MYUSER -p$MYPASS -S$SOCKET"
MYDUMP="mysqldump -u$MYUSER -p$MYPASS -S$SOCKET -x -F -R"
[ ! -d $BAKPATH ] && mkdir -p $BAKPATH
DBLIST=`$MYCMD -e "show databases;"|sec 1d |egrep -v "_schema|mysql"`
for dbname in $DBLIST
do
  TLIST=`$MYCMD -e "show tables from $dbname;"|sed 1d`
  for tname in $TLIST
  do
    mkdir -p $BACKPATH/$dbname
    $MYDUMP ${dbname} ${tname}|gzip > ${BAKPATH}/${dbname}/${tname}_$(date +%F).sql.gz
  done
done
