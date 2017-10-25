#!/bin/bash
TOTAL=1000
MSG_FEE=15
. /etc/init.d/functions

function IS_NUM(){
expr $1 + 1 &>/dev/null
if [ $? -ne 0 -a "$1" != "-1" ];then
   return 1
fi
return 0
}

function consum(){
read -p "Pls input your msg:" TXT
read -p "Are you to send?[y|n]" OPTION
case "$OPTION" in
   [yY]|[yY][eE][sS])
       action "Send sunccessfully!" /bin/true
       ((TOTAL=TOTAL-MSG_FEE))
       echo "Your have $TOTAL left"
   ;;
   [nN]|[nN][oO])
       action "Canceled" /bin/false
   ;;
   *)
       echo "Invalid Input "
   ;;
  esac
}

function charge(){
if [ $TOTAL -lt $MSG_FEE ];then
    read -p "Money is not enough,Are you want to charge?[y/n]" OPT2
    case "$OPT2" in
          y|Y)
              while true
              do
                  read -p "How much are you want to charge" CHARGE
                  IS_NUM $CHARGE&&break||{
                  echo "Invalid input"
                  exit 100
                  }
              done
              ((TOTAL+=$CHARGE)) && echo "You have $TOTAL money."
              ;;
          n|N)
              exit 101
              ;;
          *)
              echo "Invalid input"
              exit 102
          esac
     fi
}

main(){
while [ $TOTAL -ge $MSG_FEE ]
do
  consum
  charge
done
}

main
