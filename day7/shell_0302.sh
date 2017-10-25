echo stu{01..10}|tr " " "\n"|sed -r 's#(.*)#useradd \1;pass=$RANDOM|md5sum|cut -c 1-8;echo "$pass|passwd --stdin \1;echo -e "\1 \t `echo "$pass"`">> /tmp/oldboy.log"#g' |bash
