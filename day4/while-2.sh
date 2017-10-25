#!/bin/bash
sum=0
i=1
while [ $i -le 100 ]
do
  ((sum+=$i))
   ((i++))
done
echo "$sum"
