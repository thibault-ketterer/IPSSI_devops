#!/bin/bash

acc=0
count=1
while read i;do
	acc=$((i+acc))
	count=$((count+1))
done
echo $((acc/count))
