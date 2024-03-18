#!/bin/bash


START_DATE="17/May/2015:10:05:47"
if test -f ./end_date; then
    START_DATE=$(<./end_date) 
fi
END_DATE=$(LANG=en_EN date '+%d/%b/%Y:%H:%M:%S')
echo $END_DATE > ./end_date

mypidfile=./script.sh.pid

trap "rm -f -- '$mypidfile'" EXIT

echo $$ > "$mypidfile"

for pid in $(pidof -x script.sh); do
    if [ $pid != $$ ]; then
        echo "[$(date)]: script.sh: Process is already running with PID $pid"
        exit 1
    fi
done


START_LINE=$(cat $(find ./*logs) | grep -n -m1 $START_DATE | cut -f1 -d:)
cat $(find ./*logs) | tail -n +$START_LINE | awk '{print $1}' | sort | uniq -c | sort -k 1nr | head -n 10 | awk 'BEGIN {print "Number IP"} {print $1"    ",$2}'
cat $(find ./*logs) | tail -n +$START_LINE | awk '{print $7}' | sort | uniq -c | sort -k 1nr | head -n 10 | awk 'BEGIN {print "Number URL"} {print $1"    ",$2}'
cat $(find ./*logs) | tail -n +$START_LINE | awk '{print $9}' | sort | uniq -c | sort -k 1nr | head -n 10 | awk 'BEGIN {print "Number HTTP Code"} {print $1"    ",$2}'
cat $(find ./*logs) | awk '$9 !="200" {print $0}'
