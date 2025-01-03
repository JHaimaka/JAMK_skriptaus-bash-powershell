#!/bin/bash

<<kuvaus
Create a script that returns how many objects are in the given directory 
(do not include hidden files). Directory path is asked from the user.
kuvaus

read -p "Anna hakemisto: " hakemisto 
# ohjataan ls annettu_hakemisto muuttujaan sisalto 
sisalto=$(ls $hakemisto | wc -l)   # rivien määrä ko. hakemistossa 
echo $sisalto
