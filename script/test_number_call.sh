#!/bin/bash 
arg=$1
echo $arg
find ./OBJ -name '*.o' -exec objdump -d {} \;|grep "$arg" -c

#or
#find . -name "*.txt" -print0 | while read -d $'\0' file
#do
#    …code using "$file"
#done
