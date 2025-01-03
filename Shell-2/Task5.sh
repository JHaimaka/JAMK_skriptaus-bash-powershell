#!/bin/bash
<<tehtava
Create a script that mimics a simple calculator.
At first, script asks the operation from the user (-, +, *, / ). 
After the user selects operation, two values are asked and the outcome is printed to the user.
Script execution stops when the user selects "exit" operation.
tehtava

#valinta=" "
while true 
do
read -p "Valitse laskutoimitus (-, +, *, / ) tai (x) lopetus " valinta
echo "Valinta on $valinta"
  if [ "$valinta" = "x" ] || [ "$valinta" = "X" ]
    then
    break
  fi 
read -p "Anna luku 1 : " luku1
read -p "Anna luku 2 : " luku2
  if [ "$valinta" = "+" ]
  then
    echo "$luku1 + $luku2 = $(($luku1 + $luku2))"
  elif [ "$valinta" = "-" ]
  then
    echo "$luku1 - $luku2 = $(($luku1 - $luku2))"
  elif [ "$valinta" = "*" ]     # ei toimi $valinta = "*" täytyy olla "$valinta" = "*". Muut toimii.
  then
     echo "$luku1 * $luku2 = $(($luku1 * $luku2))"
  elif [ "$valinta" = "/" ]
  then
    jako_tulos=$(echo "scale=1; ($luku1 / $luku2)" | bc -l)  # 1 desimaalin tarkkuus
    echo "$luku1 / $luku2 = $jako_tulos" 
  fi
done  # while
