<#
Create a script that counts how many files and folders are in given folder. 
The script shows the name of the folder and the number of the files.
#>

$hakemisto = Read-Host "Pls, give the folder to search: "
$tiedostot_ja_hakemistot=Get-ChildItem -Path $hakemisto
    # Write-Host("tiedostot_ja_hakemisto : $tiedostot_ja_hakemistot")
$maara = $tiedostot_ja_hakemistot.Count
Write-Host("$maara files and/or directories found at $hakemisto (dir . and .. not counted)")

#    C:\Users\Win10