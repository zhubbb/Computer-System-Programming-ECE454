#!/bin/bash
echo "Running..."
t=0 
for i in {1..5}
do
	echo "Compilation time: $i"
	make clean 1>/dev/null
	t=$(echo $(/usr/bin/time -f %U  make  2>&1 1>/dev/null)+$t|bc -l)

done
sleep 1
t=$(echo $t/5|bc -l)
echo "The average compilation time is $t seconds."
