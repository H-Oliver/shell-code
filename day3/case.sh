#!/bin/bash
RED_COLOR='\E[1;31m'
GREEN_COLOR='\E[1;32m'
YELLOW_COLOR='\E[1;33m'
BLUE_COLOR='\E[1;34m'
PINK='\E[1;35m'
RES='\E[0m'

menu(){
    cat <<EOF
     1.apple
     2.pear
     3.banana
     4.cherry
EOF
read -p "Pls input a num: " num
}


usage(){
    if [ $# -ne 2 ];then
        echo "ple input exixt" contents
    fi
}

#menu

color(){
case "$num" in
   1)
    echo -e "${RED_COLOR} apple $RES"
;;
   2)
    echo -e "${GREEN_COLOR} pear $RES"
    
;;
   3)
    echo -e "${YELLOW_COLOR} banana $RES"

;;
   4)
    echo -e "${BLUE_COLOR}$2 $RES"
;;
   *)
    usage
esac
}

main(){
  while true
  do
     menu
     color
  done
}

main
