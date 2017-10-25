#!/bin/bash
array=(
   10.0.0.1
   10.0.0.2
   10.0.0.3
)
for n in ${array[*]}
do
    echo $n
done
echo "--------------------------------"
for((ip=0;ip<${#array[@]};ip++))
do
   echo ${array[ip]}
done
