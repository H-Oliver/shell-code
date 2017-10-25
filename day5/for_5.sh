#!/bin/bash
for n in `ls ./test/*.html`
do
   mv $n  `echo $n|sed 's#_finished.html#.HTML#g'`
   rename "_finished.html" ".HTML" $n
   ls $n |awk -F '[_]' '{print "mv " $0,$1".HTML"}'
done
