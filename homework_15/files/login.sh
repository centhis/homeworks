#!/bin/bash
if [ $(date +%a) = "Sat" ] || [ $(date +%a) = "Sun" ]; then
#        echo "true"
	if getent group admin | grep -qw "$PAM_USER"; then
#		echo "true"
		exit 0
	else
		exit 1
	fi
else
	exit 0
fi
