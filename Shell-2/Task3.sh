#!/bin/bash
<<tehtava
Create a script that returns a type of objects given (file or directory or something else).
User can give unlimited number of paths using the commandline arguments.
Every object type is printed on the own line.
tehtava

#arg_maara=$#
argumentit=$@
#echo "Määrä $arg_maara"
#echo "Argumentit: $argumentit"

for a in $argumentit    # läpikäy annetut argumentit
do
  #echo $a
  if [ -f $a ]   # -f True if file exists and is a regular file.
  then 
      echo "$a is file"
  elif [ -d $a ]   # -d True if file is a directory.
  then
     echo "$a is directory"
  else
    echo "$a is something else object" 
  fi

done   # for
