#!/bin/bash
<<tehtava1
Create a script that asks a file to remove from the user.
File is removed if it's a regular file and it's empty, 
otherwise some kind of error message is printed.
tehtava1

# if test => 
# -f FILE = True if file exists and is a regular file.
# -s FILE =  True if file exists and is not empty = on sisältöä

read -p "Anna poistettava tiedosto : " tiedosto

#    on tavallinen     ja   ei ole sisältöä
if [ -f ./$tiedosto ]  && [ ! -s ./$tiedosto ]  # ko. hakemistossa
then
   rm ./$tiedosto
   echo "Tyhjä tiedosto poistettiin"    # poistetaan tavallinen tyhjä tiedosto	
else 
   echo "Poistovirhe: Tiedosto ei ole tavallinen tai tyhjä" 
fi
