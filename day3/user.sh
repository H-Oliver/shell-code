#!/bin/bash

Path=/etc/user.conf
if [ ! -f "$Path" ];then
  touch $Path
  chmod 644 $Path
fi

if [ 2 -ne $# ];then
  echo "USAGE: sh adduser {-add|-del|-search} username "
  exit 1
fi

Age=$1
User=$2

if [ 0 -lt $(echo "$User" |grep -E "[^a-z,A-Z,0-9,_]"|wc -l) ];then
  echo "The age format is error"
  exit 2
fi

function checkuser() {
  check=$(grep -w "$User" $Path|wc -l)
  if [ $check -eq 0 ];then
     return 0
  else
     return 1
  fi
}

function adduser() {
  checkuser
  if [ $? -eq 0 ];then
    echo "$User" >> $Path
  else
    echo "The user is having"
    exit 3
  fi
}

function deluser() {
  checkuser
  if [ $? -eq 0 ];then
    echo "The is no user"
  else
    sed -ri /^$User$/d $Path
    exit 4
  fi
}

function search() {
  checkuser
  if [ $? -eq 0 ];then
    echo "No user match"
  else
    echo "$User is having"
  fi
}

case "$Age" in
   -add)
        adduser
       ;;
   -del)
        deluser
       ;;
   -search)
        search
       ;;
   *)
        echo "USAGE: sh adduser {-add|-del|-search} username "
       ;;
esac
