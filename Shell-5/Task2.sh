#!/bin/bash
<<tehtava_5-2
Create a script that reads cars.csv file.
(https://gitlab.labranet.jamk.fi/ttc2060/shell-tasks/-/blob/master/Shell-5/cars.csv)
File that is read must be given at the script startup as a command line argument.
Script reads information from the file and prints the values to the user.
Output format:
--- Line 1 ---
Manufacturer: X
Model: X
Color: X
Year: X
--- Line 2 ---
Manufacturer: Y
Model: Y
Color: Y
Year: Y

Muodossa:
Manufacturer,Model,Year,Color
Volkswagen,Passat,2013,Black
Audi,Q7,2018,White
tehtava_5-2

luettava_CSV=$1
  # echo "Luettava CSV : $luettava_CSV"
  # wget $luettava_CSV

i=0
while read -r line
do
      # CSV_sisalto+=(${line})
  # pois eka CSvn rivi
  if [ $i -eq 0 ] 
  then 
    (( i++ ))
    continue
  else
    echo "--- Line $i  --- "
      #echo "Line : $line"
    echo "Manufacturer: $(echo "$line" | cut -d ',' -f 1)"
    echo "Model: $(echo "$line" | cut -d ',' -f 2)"
    echo "Color: $(echo "$line" | cut -d ',' -f 3)"
    echo "Year: $(echo "$line" | cut -d ',' -f 4)"
    (( i++ ))
  fi
done < $luettava_CSV 

<<testi
  while read line
  do
  printf "%s %s %s %s\n" ${line[0]} ${line[1]} ${line[2]} ${line[3]}
  done < $luettava_CSV

while IFS=',' read -r Manufacturer Model Year Color
do
  (( i++ ))
  echo "--- Line $i  --- "
  echo "Valmistaja : ${Manufacturer}"
  echo "Malli : ${Model}"
  echo "Vuosimalli : ${Year}"
  echo  "Väri : ${Color}"
done < $luettava_CSV
testi
