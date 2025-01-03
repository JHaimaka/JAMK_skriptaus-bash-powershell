<# 
Create a script that takes one parameter: **foldername**. Check if the given folder exist. 
If the folder exist: show how many files are in the folder and then list the files of the folder. 
If the folder does not exist, the script will show a message: "Sorry, {foldername} does not exist."

C:\Users\Win10\test
#>

param (
[string]$foldername = ''          # testaa 'C:\CODE\git\tt00cd76\powershell\powershell-3\test'
)

if (Test-Path $foldername)   # True, jos hakemisto on olemassa
    {
    $tiedostot=Get-ChildItem -Path $foldername -File  # kaikki ko. hakemiston tiedostot
    $maara=[int]$tiedostot.Count
    Write-Host ($maara, "files in the folder", $foldername)
    # tulostetaan tiedostot allekkain
    Get-ChildItem $foldername | Where { $_.PsIsContainer -eq $false }  | Format-Table Name
    }
else
    {
    write-host ("Sorry, $foldername does not exist.")
    }

<#
$nykyinen_hakemisto = $PWD.Path
$haettava_hakemisto = $nykyinen_hakemisto +'\' + $foldername

$hakemistot=Get-ChildItem $nykyinen_hakemisto -Directory
forEach($hakemisto in $hakemistot)   # läpikäydään koko objektin
    {
    #write-host ("Hakemistot : ", $hakemisto.Name)
    if ('test' -In $hakemisto.Name)   # hakemisto on olemassa objektissa
        {
        $nykyinen_hakemisto = $PWD.Path
        $haettava_hakemisto = $nykyinen_hakemisto +'\' + $foldername
        write-host ("Haettava hakemistot : ", $haettava_hakemisto)
        $ali_hakemistot=Get-ChildItem $nykyinen_hakemisto -Directory
        $tiedostot=Get-ChildItem -Path $nykyinen_hakemisto -File
        $tiedostojen_maara = $tiedostot.Count
        write-host ("$tiedostojen_maara files in the folder $foldername")
        Get-ChildItem -Path $nykyinen_hakemisto -File | Format-Table -Property Name

        }  # if
    else
        {
        write-host (" Sorry, $foldername does not exist.")
        }  # else

    }  # forEach

#}

#}

$tiedostot=Get-ChildItem -Path $HOME -File
$tiedostojen_maara = $tiedostot.Count

#Write-Host ("Sorry, $foldername does not exist.")

#$tiedostot_ja_hakemistot=Get-ChildItem -Path $foldername
#$maara = $tiedostot_ja_hakemistot.Count
#write-host ("On hakemisto ja olemassa jo")

#Write-Host("$maara files and/or directories found at $hakemisto (dir . and .. not counted)")

#>