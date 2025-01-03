#!/bin/bash
<<tehtava_4-3
Create a script that has a function called network_information that shows the 
following information:

- ip address: 
- hostname: 

Log the messages in the syslog with a custom tag "network-information".
*Hints:* Utilize arrays and ip or hostname commands with options
tehtava_4-3


function network_information ()
{
local IP_HOST
IP=( $(hostname -I) )
HOST=( $(hostname) )
IP_HOST="${IP} ${HOST}" # hitto mikä syntaksi

# echo $IP_HOST
logger --tag network-information "$IP_HOST"

}


network_information
