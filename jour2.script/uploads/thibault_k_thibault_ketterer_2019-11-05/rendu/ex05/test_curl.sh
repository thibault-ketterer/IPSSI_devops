#!/bin/bash

set -e

if [ -z $1 ];then
	echo "donnez un nom de site"
	exit 1
else
	if curl -s -I $1 >/dev/null ;then
		echo "OK"
	else
		echo "FAIL"
		exit 2
	fi
fi

exit 0

