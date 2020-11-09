#!/bin/bash 

read -p "number of times flipping of coin to be done - " total;

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

#for triplet
declare -A triplet

for ((k=1;k<=$total;k++))
do
        triplet[$k]=$((RANDOM%8))
done

#count

#0 for HHH
echo HHH=`echo ${triplet[@]} | tr ' ' '\n' | sort -n | uniq -c | head -1 | awk '{print $1}'`
#1 for HHT
echo HHT=`echo ${triplet[@]} | tr ' ' '\n' | sort -n | uniq -c | head -2 | tail -1 | awk '{print $1}'`
#2 for HTH
echo HTH=`echo ${triplet[@]} | tr ' ' '\n' | sort -n | uniq -c | head -3 | tail -1 | awk '{print $1}'`
#3 for THH
echo THH=`echo ${triplet[@]} | tr ' ' '\n' | sort -n | uniq -c | head -4 | tail -1 | awk '{print $1}'`
#4 for TTH
echo TTH=`echo ${triplet[@]} | tr ' ' '\n' | sort -n | uniq -c | tail -4 | head -1 | awk '{print $1}'`
#5 for THT
echo THT=`echo ${triplet[@]} | tr ' ' '\n' | sort -n | uniq -c | tail -3 | head -1 | awk '{print $1}'`
#6 for HTT
echo HTT=`echo ${triplet[@]} | tr ' ' '\n' | sort -n | uniq -c | tail -2 | head -1 | awk '{print $1}'`
#7 for TTT
echo TTT=`echo ${triplet[@]} | tr ' ' '\n' | sort -n | uniq -c | tail -1 | awk '{print $1}'`

#triplet percentage
echo percentage_HHH=`echo $HHH | awk '{print $1/50*100}'`
echo percentage_HHT=`echo $HHT | awk '{print $1/50*100}'`
echo percentage_HTH=`echo $HTH | awk '{print $1/50*100}'`
echo percentage_THH=`echo $THH | awk '{print $1/50*100}'`
echo percentage_TTH=`echo $TTH | awk '{print $1/50*100}'`
echo percentage_THT=`echo $THT | awk '{print $1/50*100}'`
echo percentage_HTT=`echo $HTT | awk '{print $1/50*100}'`
echo percentage_TTT=`echo $TTT | awk '{print $1/50*100}'`
