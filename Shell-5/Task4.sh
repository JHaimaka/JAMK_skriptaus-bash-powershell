#!/bin/bash
<<tehtava_5-4
server {
    listen         80 default_server;
    listen         [::]:80 default_server;
    server_name    example.com www.example.com;
    root           /var/www/example.com;
    index          index.html;
}

./Task4.sh '8080' 'defaul.html'
tehtava_5-4

function change_services()
{
  # echo "Funktiossa: $1 $2"
# https://www.gnu.org/software/sed/manual/sed.html#Character-Classes-and-Bracket-Expressions
# https://www.gnu.org/software/sed/manual/sed.html
# korvataan kaikki 80 $1 
# -r use ERE, -i file in-place, -n suppress output
# g replace all, s substitute
sed -r -i "s/80/$1/g" example.conf  # $1 vaatii ""
# $2 default.html -> index.html
sed -r -i "s/index.html/$2/g" example.conf
}

change_services $1 $2
