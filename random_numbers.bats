#!/usr/bin/env bash

load $HOME/test/'test_helper/batsassert/load.bash'
load $HOME/test/'test_helper/batscore/load.bash'
upper_limit=10
digits_re='^[0-9]+$'

@test "scriptExecution" {
  run sh random_numbers.sh
  [ "$status" -eq 0 ] #Ended OK
}

@test "arrayLenght" {
  run cat array_size.txt
  [ $output == $upper_limit ]
}

@test "sortedArrayValidation" {
  run cat numbers.txt
  numbers_string=($output)
  [ "$output" == "1 2 3 4 5 6 7 8 9 10" ]
}

@test "shuffledArrayValidation" {
  run cat numbers.txt
  numbers_string=($output)
  IFS=' ' read -r -a numbers_array <<< "$numbers_string"
  
  run cat shuffled_numbers.txt
  shuffled_numbers_string=($output)
  IFS=' ' read -r -a shuffled_numbers_array <<< "$shuffled_numbers_string"
  
  for del in ${numbers_array[@]}
  do
    shuffled_numbers_array=("${shuffled_numbers_array[@]/$del}")
  done

  ! [[ $shuffled_numbers_array =~ $digits_re ]]
}
