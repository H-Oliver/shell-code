#!/bin/bash

[ $# -ne 2 ]&&{
  echo "USAGE: num1 num2"
  exit 1
}

[ "`echo "$1"|sed -r ' s#[^0-9]##g'`" = "$1" ]||{
  echo "first arg must be int."
  exit 2
}

[ "`echo "$2"|sed -r ' s#[^0-9]##g'`" = "$2" ]||{
  echo "second arg must be int."
  exit 2
}

[ $1 -lt $2 ]&&{
  echo "$1<$2"
  exit 0
}

[ $1 -eq $2 ]&&{
  echo "$1=$2"
  exit 0
}

[ $1 -gt $2 ]&&{
  echo "$1>$2"
  exit 0
}
