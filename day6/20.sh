#!/bin/bash
str="asd asdf as  asdf asd fasd fasdf. asdf, asd f"
echo $str |awk 'BEGIN{FS=""} {for(i=1;i<=NF;i++)if($i !~ /[., ]/)count[$i]++}END{for(key in count)print key,count[key]}'|sort -k2rn
