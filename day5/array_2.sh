#!/bin/bash
array=(
   `ls`
)
for f in ${array[*]}
do
   echo $f
done
