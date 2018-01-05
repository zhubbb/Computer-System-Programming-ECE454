#!/bin/bash 
arg=$1
echo $arg
find ./OBJ -name '*.o' -exec objdump -d {} \;|grep "$arg" -c



