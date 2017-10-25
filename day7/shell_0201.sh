#!/bin/bash
cd /oldboy
for file in `ls`
do
   mv $file `echo $file|awk -F [-.] '{print "linux-"$2".HTML"}'`
done
