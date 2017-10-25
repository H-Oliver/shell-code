#!/bin/bash
dir=/oldboy
[ ! -d $dir ] && mkdir -p $dir
for n in `seq 10`
do
   touch $dir/oldboy-$n.html
done
