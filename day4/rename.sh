#!/bin/bash
Path=/oldboy
[ -d $Path ] && cd $Path
for file in `ls`
do
  mv $file `echo $file|sed -e "s#oldboy#oldgirl#g" -e "s#html#HTML#g" `
done
