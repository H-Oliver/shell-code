#!/bin/bash
while :
do
read num1 num2
[[ $num1 -eq $num2 ]]&& echo 0 || echo 1
done
