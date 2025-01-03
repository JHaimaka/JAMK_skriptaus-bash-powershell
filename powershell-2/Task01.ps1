<#
Create a script that counts how many files are in user's home folder. 
The script shows the home folder name and the number of the files.
#>
$tiedostot=Get-ChildItem -Path $HOME -File
$tiedostojen_maara = $tiedostot.Count
Write-Host("$tiedostojen_maara files found at $HOME")