exec < nginx.log
while read line
do
  i=`echo $line|awk '{print $10}'`
  expr $i + 1 &>/dev/null
  if [ $? -ne 0 ];then
     continue
  fi
  ((sum+=i))
done
[ -n "$sum" ] && echo $sum
