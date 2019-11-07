#!/bin/bash

acc=0
while read i;do
	acc=$((i+acc))
done
echo $acc
