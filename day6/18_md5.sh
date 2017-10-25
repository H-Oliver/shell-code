#!/bin/bash
for n in {0..33000}
do
  MD5=`echo $n|md5sum|cut -c 1-8`
  if [ "${MD5}" == "$1" ]
  then
     echo "$n IS IS IS "
     exit 1
  else
     echo "$n NO NO NO"
  fi
done
