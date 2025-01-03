#!/bin/bash
<<tehtava
Write a shell script that checks if the file /etc/hosts exists.
If the file exists, script prints the outcome: /etc/hosts available.
Also check can you write in the file.
Script prints the outcome: You have permission to edit the file 
OR you dont have permission to edit the file
tehtava

tiedosto="/etc/hosts"
# -e FILE = True if file exists.
if [ -e $tiedosto ]
then
   echo "/etc/hosts available."
   # -w FILE =  True if the file is writable by you. 
   if [ -w $tiedosto ]
   then  
      echo "You have permission to edit the file"
   else
      echo "you dont have permission to edit the file"
   fi  # voi kirjoittaa
fi     # on olemassa
