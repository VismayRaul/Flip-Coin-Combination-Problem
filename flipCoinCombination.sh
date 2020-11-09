#!/bin/bash -x

total=50;

#for singlet
declare -A result

for ((i=1;i<=$total;i++))
do
	result[$i]=$((RANDOM%2))
done

#head=0;
head=`echo ${result[@]} | tr ' ' '\n' | sort -n | uniq -c | head -1 | awk '{print $1}'`

#tail=1;
tail=`echo ${result[@]} | tr ' ' '\n' | sort -n | uniq -c | tail -1 | awk '{print $1}'`

#counts
echo $tail
echo $head

#percentage of singlet
echo percentage_tail=`echo $tail | awk '{print $1/50*100}'`
echo percentage_head=`echo $head | awk '{print $1/50*100}'`

#for duplet
declare -A duplet

for ((j=1;j<=$total;j++))
do
	duplet[$j]=$((RANDOM%4))
done

#0 for HH
head_head=`echo ${duplet[@]} | tr ' ' '\n' | sort -n | uniq -c | head -1 | awk '{print $1}'`
#1 for HT
head_tail=`echo ${duplet[@]} | tr ' ' '\n' | sort -n | uniq -c | head -2 | tail -1 | awk '{print $1}'`
#2 for TH
tail_head=`echo ${duplet[@]} | tr ' ' '\n' | sort -n | uniq -c | tail -2 | head -1 | awk '{print $1}'`
#3 for TT
tail_tail=`echo ${duplet[@]} | tr ' ' '\n' | sort -n | uniq -c | tail -1 | awk '{print $1}'`

#counts
echo $head_head
echo $head_tail
echo $tail_head
echo $tail_tail

#percentage of duplet
echo percentage_HH=`echo $head_head | awk '{print $1/50*100}'`
echo percentage_HT=`echo $head_tail | awk '{print $1/50*100}'`
echo percentage_TH=`echo $tail_head | awk '{print $1/50*100}'`
echo percentage_TT=`echo $tail_tail | awk '{print $1/50*100}'`
