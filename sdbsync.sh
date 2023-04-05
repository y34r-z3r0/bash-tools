#!/bin/bash

sd1="/Volumes/SD1"
sd2="/Volumes/SD2"
db="oops.kdbx"

function hash {
	ds1_hash=$(md5 $sd1/$db | awk '{print$4}')
	echo "SD1 = ${ds1_hash}"
	ds2_hash=$(md5 $sd2/$db | awk '{print$4}')
	echo "SD2 = ${ds2_hash}"
}

if [ -d $sd1_path ] && [ -d $sd2_path ]; then
	echo '' ; echo "Nice! Both cards is available."
	if [ $ds1_hash = $ds2_hash]; then
		echo '' ; hash
		echo '' ; echo "Oh, wow. No need to update. Lovely." ; echo ''
	else
		echo '' ; hash
		echo '' ; read -p "Сan we start syncing? [y/n]: " sync
		if [ $sync = "y" ]; then
			cp -f $sd1/$db $sd2
			echo '' ; hash
		elif [ $sync = "n" ]; then
			echo '' ; echo "Well... bye." ; echo ''
		else
			echo '' ; echo "Read carefully next time, man." ; echo ''
		fi
	fi
else
	echo '' ; echo "Oh, shit... one or more cards are not available." ; echo ''
fi
