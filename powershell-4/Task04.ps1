<# PS4_4
Create a script that ask file names from an user. The names are asked until 
the user gives empty input. 
After that, the script creates the files with given names to user's home folder. 
The script writes the current date and time to the files in the following format **30.9.2021 12.30**. 
Finally show a message that how many files were created succesfully.
#>

$aika=Get-Date -Format "dd.MM.yyyy HH.mm"

$tiedostot = @()  # tyhj‰ taulukko
$vastaus=""

while ($true)
{
    $vastaus = Read-Host ("Give a filename, press Enter to quit") 
    if ($vastaus -eq "") { break }  # jos tyhj‰ - lopetetaan
    else
    {
      $tiedostot += $vastaus  # lis‰t‰‰n tiedoston nimi taulukkoon
    }
}

$nykyinen_hakemisto = Get-Location 

if ($tiedostot.Length -ne 0)  # jos ei tyhj‰ taulukko
    {
    foreach ($tiedosto in $tiedostot)
        {
        $tallennetaan = Join-Path $nykyinen_hakemisto -ChildPath $tiedosto
        Add-Content -Path $tallennetaan -Value $aika # lis‰‰ aika tiedostoon,luodaan tarvittaessa
            #Write-Host ("Tiedosto : $tallennetaan $aika")
        }
    Write-Host ($tiedostot.Length, "created successfully")
    }



<# 
param (
[string]$tiedosto_arg = ''
)

$workstations = @()  # tyhj‰ taulukko
$index=0

do {
    $vastaus = Read-Host ("Give a workstation name, press Enter to quit") 
    $workstations += $vastaus
      #  Write-Output ("Taulukko [$index] -> $workstations[$index]")
    $index++
}
until ($vastaus -eq "")

$nykyinen_hakemisto = Get-Location 
$tallennetaan = Join-Path $nykyinen_hakemisto -ChildPath $tiedosto_arg
    # Write-Host ("Tallenetaan : ",$tallennetaan ," : ", $workstations)

Add-Content -Path $tallennetaan -Value $workstations # lis‰‰ tiedostoon,luodaan tarvittaessa
Write-Host ("$tallennetaan created successfully")

#>


<#
Write-Output("You got it: " + $number)



alla oleva on PS4-2
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
#>

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