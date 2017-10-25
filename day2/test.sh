#!/bin/bash
read -t 5 -p "please two number:" a b

[ -z "$a" ] && {
  echo "a error"
  exit 1
}
[ -z "$b" ] && {
  echo "b error"
  exit 2
}

expr $a + $b + 1 &>/dev/null
[ $? -ne 0 ] && {
  echo "the num you input must be int"
  exit 3
}

if [ $b -eq 0 ]; then
 echo "b=0 can not be 0"
else
 
fi
