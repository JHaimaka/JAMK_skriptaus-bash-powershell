#!/bin/bash
<<tehtava
Create a script to automate user creation. NOTE: no password setup!
Script asks username from the user and before the user is created, script must check 
if the user with that name exists.
Use the following syntax in you conditional statement: 
if id -u USERNAME. If the user doesn't exist, conditional statement returns false 
(actual id command returns "no such user" / error code 1).
New user must have home directory under the /home/ directory and default shell as bash.
Hint: User creation needs sudo permissions, how to execute script with it?
tehtava

<<maarittely
sudo adduser => luo oletuksena kotihakemiston ja shellin ... mutta kyselee tiedot
useradd sopii paremmin automaattiseen luontiin, mutta määritettävä:
1. kotihakemisto
2. bash -shell
sudo useradd --create-home --shell /bin/bash $user
Huom ! ilman optiota --password PASSWORD tili on lukittu
Käyttäjän poisto userdel -r user  (poistaa myös kotihakemiston)
maarittely

# kysy käyttäjänimi
read -p "Anna käyttäjätunnus luontiin : " kayttaja
onko_kayttaja=$(id --user $kayttaja 2>/dev/null)  # virheessä 2>/dev/null poistaa id:..: no such user
# echo "onko käyttäjä : $onko_kayttaja viimeksi suoritetun komennon exit $?"
# Ei ole tyhjän eikä moni sanaisen käyttäjätunnuksen käsittelyä

if [ ! $onko_kayttaja ]  # print only the effective user ID, if false user doesnot exist
then
  echo "Käyttäjää $kayttaja EI ole olemassa -> luodaan ..." 
  sudo useradd --create-home --shell /bin/bash $kayttaja
  if [ $? = 0 ]
  then  
   echo "käyttäjän luonti onnistui"
  else
     echo "käyttäjän luonti epäonnistui"
  fi

else
  echo "Käyttäjä $kayttaja on jo olemassa -> EI luoda"

fi
