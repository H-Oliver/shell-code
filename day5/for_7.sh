#!/bin/bash
for ((i=1;i<=100;i++))
do
   let sum1+=i
done
echo $sum1


for n in `seq 100`
do
   ((sum2+=n ))
done
echo $sum2


echo $((100*(100+1)/2))
