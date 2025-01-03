#!/bin/bash

<<kuvaus
Create a script that copies the given file to a path provided by the user. 
So both paths should be asked from the user.
Finally script prints: "copied the "original file" to "given path"!".
kuvaus

read -p "Provide path: " path 
read -p "Provide file: " file
cp $file $path 
echo "copied the $file to $path !"
