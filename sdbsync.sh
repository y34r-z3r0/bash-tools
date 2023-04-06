#!/bin/bash

sd1="/Volumes/SD1"
sd2="/Volumes/SD2"
db="secrets.kdbx"

ds1_hash=$(md5 $sd1/$db | awk '{print$4}')
ds2_hash=$(md5 $sd2/$db | awk '{print$4}')

function hash {
	echo "SD1 = ${ds1_hash}"
	echo "SD2 = ${ds2_hash}"
}

if [ -d $sd1 ] && [ -d $sd2 ]; then
	if [ -f $sd1/$db ] && [ -f $sd2/$db ]; then
		echo '' ; echo "Nice! Both cards and databases is available."
		if [ $ds1_hash = $ds2_hash ]; then
			echo '' ; hash
			echo '' ; echo "Oh, wow. No need to update. Lovely." ; echo ''
		else
			echo '' ; hash
			echo '' ; read -p "Сan we start syncing? [y/n]: " sync
			if [ $sync = "y" ]; then
				cp -f $sd1/$db $sd2
				echo '' ; hash ; echo ''
			elif [ $sync = "n" ]; then
				echo '' ; echo "Well... bye." ; echo ''
			else
				echo '' ; echo "Read carefully next time, man." ; echo ''
			fi
		fi
	else
		echo '' ; echo "Looks like there is no database on DS2"
		echo '' ; read -p "Do you want to copy it from DS1? [y/n]: " copy
		if [ $copy = "y" ]; then
			cp $sd1/$db $sd2
			ds2_hash=$(md5 $sd2/$db | awk '{print$4}')
			echo '' ; hash ; echo ''
		elif [ $copy = "n" ]; then
			echo '' ; echo "Well... bye." ; echo ''
		else
			echo '' ; echo "Read carefully next time, man." ; echo ''
		fi
	fi	
else
	echo '' ; echo "Oh, shit... one or more cards are not available." ; echo ''
fi