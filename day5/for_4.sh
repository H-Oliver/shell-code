#!/bin/bash
for ((i=1;i<=10;i++))
do
   mkdir -p ./test
   touch ./test/`echo $RANDOM|md5sum|cut -c 1-8`_finished.html
done
