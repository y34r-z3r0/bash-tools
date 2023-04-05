#!/bin/bash

sd1_path="/Volumes/SD1"
sd2_path="/Volumes/SD2"
db="secrets.kdbx"

if [ -d $sd1_path ] && [ -d $sd2_path ]; then
	echo "Both cards is available"
	echo $(md5  $sd1_path/$db)
	echo $(md5  $sd2_path/$db)
	read -p "Сan we start syncing? [y/n]: " sync
	if [ $sync = "y" ]; then
		cp -f $sd1_path/$db $sd2_path
		echo $(md5  $sd1_path/$db)
		echo $(md5  $sd2_path/$db)
	elif [ $sync = "n" ]; then
		echo "Stop"
	else
		echo "Read carefully next time, bitch"
	fi
else
	echo "One or more cards are not available"
fi
