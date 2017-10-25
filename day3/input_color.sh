#!/bin/bash
RED_COLOR='\E[1;31m'
GREEN_COLOR='\E[1;32m'
YELLOW_COLOR='\E[1;33m'
BLUE_COLOR='\E[1;34m'
PINK='\E[1;35m'
RES='\E[0m'

usage(){
    if [ $# -ne 2 ];then
        echo "USAGE:$0 {red|green|yellow|pink}" contents
        exit 1
    fi
}

color(){
if [ "$1" = "red" ];then
    echo -e "${RED_COLOR}$2 $RES"
elif [ "$1" = "green" ];then
    echo -e "${GREEN_COLOR}$2 $RES"
elif [ "$1" = "yellow" ];then
    echo -e "${YELLOW_COLOR}$2 $RES"
elif [ "$1" = "blue" ];then
    echo -e "${BLUE_COLOR}$2 $RES"
elif [ "$1" = "pink" ];then
   echo -e "${PINK}$2 $RES"
else
   usage
fi
}

main(){
    if [ $# -ne 2 ];then
        usage
    fi
    color $1 $2
}

main $*
