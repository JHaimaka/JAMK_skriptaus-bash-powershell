#!/bin/bash
### Task 3/3

<<tehtava
Create a script that prints a number of objects in a given directory to the user. 
The path is asked from the user.

Task 2:
Create a script that prints a number of objects in the directory where
you executed the script from.
Script must consist a function called count_objects. Function must have 
one local variable, that will hold the actual value, before it's printed to the user.
Hints:
Function has a print functionality. wc command might be useful.
tehtava

function count_objects() 
{
# echo  "Funktiossa parametri : ${1}"
# HUOM ! käyttöoikeudet  

objektit=$(ls -la ${1} | wc -l)
#(( objektit-- ))    # total 36 -tekstirivi pois laskuista
let objektit--       # total 36 -tekstirivi pois laskuista
echo "Objektien määrä ko. hakemistossa (total -rivi pois) : $objektit"
}

read -p "Anna hakemisto " hakemisto
count_objects $hakemisto
