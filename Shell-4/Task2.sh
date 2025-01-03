#!/bin/bash
<<tehtava_4-2
Create a script that prints 3 random numbers on the terminal and also generates a syslog message 
with a correlating number for each random number.
Log message priority should be user.info.
Hints: Special variable $RANDOM
tehtava_4-2

for x in {1..3}
do
  syslog_tag=$RANDOM
  echo "Random numero : " $syslog_tag
  logger --priority user.info --tag tehtava_4-2 $syslog_tag
done
