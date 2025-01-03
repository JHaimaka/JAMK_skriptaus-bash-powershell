#!/bin/bash
<<tehtava4_1
Create a script that asks URL from the user and a function that tries to ping 
it with a 1 package.
If ping is successfull, return a exit code 0.
If not, return a exit code 1.
Based on the exit code that the function returned, print outcome to user.
testaa: ./Task1.sh 8.8.8.8   (Google DNS)
tehtava4_1

read -p "Anna PINGattava IP-osoite : " IP_osoite

function pingaa()
{
ping -c 1 $1
if [ $? -eq 0 ] # PING onnistui
then 
   return 0
else
   return 1
fi
}

pingaa $IP_osoite
paluu_koodi=$?

if [ $paluu_koodi -eq 0 ]
then  
  echo "Ping onnistui"
  exit 0
else
   echo "Ping EPÄonnistui"
   exit 1
fi
