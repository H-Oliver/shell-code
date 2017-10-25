array=(I am oldboy teacher welcome to oldboy training class.)


for word in ${array[*]}
do
    if [ ${#word} -le 6 ];then
       echo -n " $word"
    fi
done
echo 
