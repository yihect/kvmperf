#!/bin/bash

source common.sh

dd if=/dev/zero bs=1M count=500 of=foo > /dev/null 2>&1

DD="dd if=foo bs=1M count=500 of=/dev/null"
$DD > /dev/null 2>&1

for i in `seq 1 $REPTS`; do
	sync
	echo 3 > /proc/sys/vm/drop_caches
	$TIME $DD > /dev/null 2>&1
done
