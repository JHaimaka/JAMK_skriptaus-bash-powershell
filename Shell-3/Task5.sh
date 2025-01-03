#!/bin/bash
## Shell-3

### Task 5
<<tehtava
Modify Exercise set 2, Task 5 (Create a script that mimics a simple calculator).
Change the logic that all operations are calculated by using functions.
tehtava

yhteen ()
{
echo "$1 + $2 = $(($1 + $2))"
}

vahennys ()
{
echo "$1 - $2 = $(($1 - $2))"
}

kerto ()
{
echo "$1 * $2 = $(($1 * $2))"

}

jako ()
{
    jako_tulos=$(echo "scale=1; ($1 / $2)" | bc -l)  # 1 desimaalin tarkkuus
    echo "$1 / $2 = $jako_tulos" 
}

#valinta=" "
while true 
do
read -p "Valitse laskutoimitus (-, +, *, / ) tai (x) lopetus " valinta
# echo "Valinta on $valinta"
  if [ "$valinta" = "x" ] || [ "$valinta" = "X" ]
    then
    break
  fi 
read -p "Anna luku 1 : " luku1
read -p "Anna luku 2 : " luku2
  if [ "$valinta" = "+" ]
  then
    yhteen $luku1 $luku2 

    		# echo "$luku1 + $luku2 = $(($luku1 + $luku2))"
  elif [ "$valinta" = "-" ]
  then
    vahennys $luku1 $luku2
  elif [ "$valinta" = "*" ]     
         # ei toimi $valinta = "*" täytyy olla "$valinta" = "*". Muut toimii.
  then
     kerto $luku1 $luku2
  elif [ "$valinta" = "/" ]
  then
    jako $luku1 $luku2 
  fi
done  # while
