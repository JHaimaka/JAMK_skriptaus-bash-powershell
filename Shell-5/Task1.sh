#!/bin/bash
<<tehtava_5-1
Create a script that asks values from the user until user decides to end the script.
Given values are added to the end of file called animal.txt
Finally script prints every value from the file.
tehtava_5-1

# declare -a otokat
vastaus=''
# tiedosto="./animal.txt"

while true
do
read -p "Anna ötökkä tai lopetus enterillä : " vastaus
  if [ -z "$vastaus" ]  # jos tyhjä, lopetetaan
  then 
    break
  else
       # otokat+=("$vastaus") 
       # echo "Lisättävä ötökkä on : $vastaus"
    echo "$vastaus" >> ./animal.txt  # kirjotetaan suoraan tiedoston loppuun
  fi
done

# tiedoston sisältö
sisalto=$(cat ./animal.txt)
echo "$sisalto"
   # echo "Ötökat taulussa : ${otokat[@]}"
