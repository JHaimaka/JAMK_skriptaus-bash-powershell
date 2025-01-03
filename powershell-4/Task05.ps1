<# PS4_5
Create a script that takes one parameter: **foldername**. First check that the given folder exist, 
then write all names of files in the folder to a text file named files.txt. 
Create the file to user's home folder. 
If the folder does not exist, the script will show a message: "Sorry, {foldername} does not exist."

#>

param (
[string]$foldername = '' # 'C:\CODE\git\tt00cd76\powershell\powershell-4\temp' #, HOME=C:\Users\Win10\
)

if (Test-Path $foldername)   # True,jos hakemisto on olemassa
    {
    $tiedostot_hakemistossa=Get-ChildItem -Path $foldername -File  # kaikki ko. hakemiston tiedostot
    $tallennetaan = Join-Path $HOME -ChildPath 'files.txt'
    Add-Content -Path $tallennetaan -Value "Name" # lisää tiedostoon,luodaan tarvittaessa
    Add-Content -Path $tallennetaan -Value "---" 
        foreach ($tiedosto in $tiedostot_hakemistossa)
        {
        Add-Content -Path $tallennetaan -Value $tiedosto 
            # Write-Host ("$foldername\$tiedosto -> $tallennetaan ")
        }
    Write-Host ($tiedostot_hakemistossa.Length, "filenames were written to file",$tallennetaan)
    }
else
    {
    write-host ("Sorry, $foldername does not exist.")
    }



<#
$aika=Get-Date -Format "dd.MM.yyyy HH.mm"

$tiedostot = @()  # tyhjä taulukko
$vastaus=""

while ($true)
{
    $vastaus = Read-Host ("Give a filename, press Enter to quit") 
    if ($vastaus -eq "") { break }  # jos tyhjä - lopetetaan
    else
    {
      $tiedostot += $vastaus  # lisätään tiedoston nimi taulukkoon
    }
}

$nykyinen_hakemisto = Get-Location 

if ($tiedostot.Length -ne 0)  # jos ei tyhjä taulukko
    {
    foreach ($tiedosto in $tiedostot)
        {
        $tallennetaan = Join-Path $nykyinen_hakemisto -ChildPath $tiedosto
        Add-Content -Path $tallennetaan -Value $aika # lisää aika tiedostoon,luodaan tarvittaessa
            #Write-Host ("Tiedosto : $tallennetaan $aika")
        }
    Write-Host ($tiedostot.Length, "created successfully")
    }
#>


<# 
param (
[string]$tiedosto_arg = ''
)

$workstations = @()  # tyhjä taulukko
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

Add-Content -Path $tallennetaan -Value $workstations # lisää tiedostoon,luodaan tarvittaessa
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
        #echo "Pääte funktiossa : $ext , apu_haettava : $apu_haettava , haettava: $haettava"
  echo "Pääte funktiossa : $ext , haettava : $haettava "

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