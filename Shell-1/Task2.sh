#!/bin/bash

<<kuvaus
Create a script that creates a new file in user's home directory.
Script asks a new filename from the user and adds current date as 
an suffix to a filename (Y-M-D).
kuvaus

read -p "Anna luotava tiedostonimi: " tiedosto 
# echo $tiedosto
paiva=$(date +%Y-%m-%d)
# echo $paiva
echo $paiva > $HOME/$tiedosto
