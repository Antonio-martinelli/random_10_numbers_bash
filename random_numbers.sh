#!/bin/bash

lower_limit=1
upper_limit=10

numbers=($(seq $lower_limit 1 $upper_limit))

if [ "${#numbers[@]}" -ne $upper_limit ]; then
	echo "The array is not of the required size"
	exit 1
else
	echo ${numbers[@]} > numbers.txt
fi

shuffled_numbers=($(shuf -e "${numbers[@]}"))

if [ "${#shuffled_numbers[@]}" -ne $upper_limit ]; then
	echo "The shuffle did not work properly"
	exit 1
else
	echo ${shuffled_numbers[@]}
	echo ${shuffled_numbers[@]} > shuffled_numbers.txt
	echo ${#shuffled_numbers[@]} > array_size.txt
fi
