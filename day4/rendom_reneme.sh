#!/bin/bash
dir=/oldboy/
[ ! -d $dir ] && mkdir -p $dir
for i in `seq 10`
do
  touch $dir/`echo $RANDOM|md5sum|cut -c 1-10`_oldboy.html
done
