#!/bin/bash
<<tehtava_5-3
Script should have function that adds a new entry to the cars.csv file based on 
the user input.
Every value must be asked from the user separately and value/values added should 
be given to the function as an argument.
Hints:
Remember delimiters.
One string might be easier than multiple --> how you can combine multiple strings 
(concatenate)?
tehtava_5-3

function add_new ()
{
 # echo "Lisattava funktiossa $1"
echo $1 >> cars.csv
}

lisattava=''
read -p "Manufacturer : " manuf
read -p "Model : " model
read -p "Year : " year
read -p "Color : " color

lisattava="$manuf,$model,$color,$year"
  #echo "Lisattava : $lisattava"

add_new "$lisattava" 
