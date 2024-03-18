#!/bin/bash


for i in $(find /proc -maxdepth 2 -type d -regex '.*/[0-9]+'); do
	pid=$(echo "$i" | sed -r 's/[/proc]+//g')
	
	comand=$(tr -d '\0' < $i/cmdline) 2>/dev/null

	if [ $comand = "" ]; then
    		echo "$i File is empty"
	else
    		echo "File is not empty"
	fi
	
	

	echo "$pid $comand"
done    
