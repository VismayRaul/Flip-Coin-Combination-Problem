#!/bin/bash -x

heads=0;
tails=1;

result=$((RANDOM%2))

if [[ $result -eq $heads ]]
	then
		echo heads
	else
		echo tails
fi
