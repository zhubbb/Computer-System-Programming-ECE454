#!/bin/bash
echo "Running..."
t=0 
p=$1
#no space when assign
for i in {1..5}
do
	echo "Compilation time: $i"
	make clean 1>/dev/null
        #p=$((2**(($i-1)*2)))
	
	t=$(echo $(/usr/bin/time -f %e  make -j$p 2>&1 1>/dev/null)+$t|bc -l)

done
sleep 1
t=$(echo $t/5|bc -l)
echo "The average compilation time is $t seconds."
