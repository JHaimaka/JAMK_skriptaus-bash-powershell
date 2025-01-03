<# PS4_2
Create a function named **Get-FiluInfo2** that shows Name, Length, LastWriteTime 
properties of files with given extension in user's home folder. 
The extension is like .txt or .csv, and it has been given as a parameter. 
Run the function to prove that it works.
#>

param (
[string]$paate = ''  # .txt tai .csv
)

function Get-FiluInfo2 {
  Param($ext)

  $apu="*$ext"  # esim. * + .txt = *.txt
  $haettava = Join-Path -Path $PWD -ChildPath $apu  # ..\powershell-4\*.txt
        # $haettava = Join-Path -Path $apu_haettava -ChildPath $apu
        #echo "P‰‰te funktiossa : $ext , apu_haettava : $apu_haettava , haettava: $haettava"
  echo "P‰‰te funktiossa : $ext , haettava : $haettava "

  if ( $ext -eq '.txt')
    {
    Get-ChildItem $haettava | Where-Object { $_.PsIsContainer -ne $true }  | Format-Table Name, Length, LastWriteTime
    }
  elseif ( $ext -eq '.csv')
    {
    Get-ChildItem $haettava | Where-Object { $_.PsIsContainer -ne $true }  | Format-Table Name, Length, LastWriteTime
    }

}  # funktio


Get-FiluInfo2 $paate

<#
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

#>

<#
$nykyinen_hakemisto = $PWD.Path
$haettava_hakemisto = $nykyinen_hakemisto +'\' + $foldername

$hakemistot=Get-ChildItem $nykyinen_hakemisto -Directory
forEach($hakemisto in $hakemistot)   # l‰pik‰yd‰‰n koko objektin
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