#!/bin/bash
<<tehtava_4-3
Create a script that installs the program using apt, based on the user input. (cowsay etc.)
If the installation is successfull, tell that to the user and exit normally.
If not, inform user and exit with a code 111.
Hints: sudo permissions and apt options
tehtava_4-3

read -p "Anna asennettava ohjelma (kuten cowsay): " ohjelma
sudo apt install $ohjelma -y
if [ $? -eq 0 ]  # jos onnistui
then
  echo "Ohjelman $ohjelma asennus onnistui"  
  exit 0
else
  echo "Ohjelman $ohjelma asennus epäonnistui"
  exit 111
fi

