#!/bin/bash 
<<tehtava4-5
Create a script that has 3 functions: mk_folder, download_image and change_perm.

- mk_folder function asks a new folder path from the user and creates the folder.
- download_image function downloads the following image to the previously created 
directory and renames it as a linux-tux.png:
https://student.labranet.jamk.fi/~pekkju/script/tux.png
- change_perm function sets the folder and image permissions in a way that only owner 
has rights to them (rwx). chmod 700

Every possible variable substitution and command execution must be shown in the 
terminal during the execution.
/home/kali/Documents/JAMK/tt00cd76/Shell-4/turha
tehtava4-5


function mk_folder() 
{
read -p "Anna hakemisto: " hakemisto # globali muuttuja
set -x
mkdir $hakemisto
}

function download_image() 
{
# echo download $hakemisto
# wget -O /home/kali/Documents/JAMK/tt00cd76/Shell-4/linux-tux.png https://student.labranet.jamk.fi/~pekkju/script/tux.png
image="https://student.labranet.jamk.fi/~pekkju/script/tux.png"
wget -O $hakemisto/linux-tux.png $image  # -O uudelleen nimeää latauksessa
#mv $halkemisto/tux.png $hakemisto/linux-tux.png
}

function change_perm()
{
#echo $hakemisto/turha.png
chmod 700 $hakemisto/linux-tux.png
}

mk_folder
download_image
change_perm


