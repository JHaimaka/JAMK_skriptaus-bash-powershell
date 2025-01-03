#!/bin/bash
### Shell-3 Task 4

<<tehtava
Modify Task 3.
User can give unlimited number of paths and given paths are saved in the array.
Function takes an array as an argument.
Hints:
read commands options might be useful or some kind of loop.
tehtava


function count_objects() 
{
tmp=$@
      	# echo  "Funktiossa parametrit : $tmp"
# HUOM ! käyttöoikeudet  
# läpikäydään koko taulukon hakemistot
for x in ${tmp[@]}
do
  	# echo $x
  objektit=$(ls -la $x |  wc -l)
  let objektit--       # total 36 -tekstirivi pois laskuista
  echo "Objektien määrä hakemistossa (total -rivi pois) $x on $objektit"
done
}

i=0
declare -a hakemisto_taulu
while true
do
read -p "Anna hakemisto tai x lopettaaksesi ja tulostaaksesi : " hakemisto
	#echo "Hakemisto : $hakemisto"
   if [ $hakemisto = "x" ]
    then  # lopetus ja tulostetaan annetut objektit 
    	count_objects ${hakemisto_taulu[@]} 
    break
   else   # lisätään tauluun
     hakemisto_taulu[$i]+=$hakemisto
     	# echo "Koko hakemisto-taulun alkiot : ${hakemisto_taulu[@]}"
     let i++
   fi
done
