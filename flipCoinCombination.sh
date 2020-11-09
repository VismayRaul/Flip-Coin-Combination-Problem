#!/bin/bash -x

#head=0;
#tail=1;
total=50;

declare -A result

for ((i=1;i<=$total;i++))
do
	result[$i]=$((RANDOM%2))
done

head=`echo ${result[@]} | tr ' ' '\n' | sort -n | uniq -c | head -1 | awk '{print $1}'`

tail=`echo ${result[@]} | tr ' ' '\n' | sort -n | uniq -c | tail -1 | awk '{print $1}'`

tail_win_times=$tail
echo percent=$((tail_win_times/i*100))

head_win_times=$head
echo percent=$((head_win_times/total*100))
