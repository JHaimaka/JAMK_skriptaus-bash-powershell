#!/bin/bash
### Task 3/1
index=0
declare -a taulu

while true
read -p "Anna arvo tai exit poistuaksesi: " arvo
do
  if  [ $arvo = "exit" ]
  then
    break
  fi
taulu[$index]=$arvo
((index++))
done

index=0
for i in ${taulu[@]}
do
  echo "$index : $i" 
  ((index++))
done 
