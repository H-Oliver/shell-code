#!/bin/bash
read -p "please two num: " num1 num2
a=$num1
b=$num2

[ -z $a -a -z $b ]&&{
  echo "USAGE: num1 num2"
  exit 1
}

[ "`echo "$a"|sed -r ' s#[^0-9]##g'`" = "$a" ]||{
  echo "first arg must be int."
  exit 2
}

[ "`echo "$b"|sed -r ' s#[^0-9]##g'`" = "$b" ]||{
  echo "second arg must be int."
  exit 2
}

[ $a -lt $b ]&&{
  echo "$a<$b"
  exit 0
}

[ $a -eq $b ]&&{
  echo "$a=$b"
  exit 0
}

[ $a -gt $b ]&&{
  echo "$a>$b"
  exit 0
}
