#!/bin/bash

# oletuksena INT -tyyppisiä muuttujia
let tulos=$(( $1+$2 ))
echo "Addition $1 + $2 = $tulos" 

let tulos=$(( $1-$2 ))
echo "Substraction $1 - $2 = $tulos" 

let tulos=$(( $1*$2 ))
echo "Multiplication $1 * $2 = $tulos" 
