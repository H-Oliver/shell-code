#!/bin/bash
menu() {
cat << END
==================================
   1.[install lamp]
   2.[install lnmp]
   3.[exit]
   please input the num you want:
==================================
END
}
menu

read num
[ $num -eq 1 ]&&{
  echo "install lamp."
  [ -x /scripts/lamp.sh ]||exit 1
  /bin/bash /scripts/lamp.sh && exit 0
}

[ $num -eq 2 ]&&{
  echo "install lnmp."
  [ -x /scripts/lnmp.sh ]||exit 1
  /bin/bash /scripts/lnmp.sh && exit 1
}
[ $num -eq 3 ]&&{
  echo "byebye" && exit 3
}
echo "input error" && exit 0



