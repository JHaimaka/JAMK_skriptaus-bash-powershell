<# 
Create a script that takes two parameters: **foldername** and **newname**. 
Check first if the given folder, exists. If not, show a proper message and quit the script. 
If the folder exist, count files in the folder, and ask from a user: "All {number} files will be renamed with name {newname}. Yes/No". 
If the user returns "Yes", rename all files in the folder.

C:\Users\Win10\test
#>

param (
[string]$foldername = '',  # testaa: 'C:\CODE\git\tt00cd76\powershell\powershell-3\turha' 'jotain.txt' 3
[string]$filename = '',
[int]$number=0 
)

if ( (Test-Path $foldername) -eq $false )   # jos hakemistoa ei ole olemassa -> luodaan
    {
    write-host ("$foldername NOT exist -> create ...")
    New-Item -Path $foldername -ItemType Directory
    } # if - hakemisto olemassa

for ($i=1; $i -le $number ;$i++)
    {
    # $i.GetType().Name
    # yhdistet‰‰n hakemisto, tiedosto ja indexi
    $luotava_tiedosto=Join-Path -Path $foldername -ChildPath ([string]$i + $filename)
    write-host ("$i  $luotava_tiedosto ")
    New-Item -Path $luotava_tiedosto -ItemType File
    }

Get-ChildItem $foldername | Where { $_.PsIsContainer -eq $false }  | Format-Table Name



#$testattava_filu=Join-Path -Path $foldername -ChildPath $filename # yhdistet‰‰n hakemisto ja tiedosto


<#
if (Test-Path -Path $testattava_filu -PathType Leaf)   # True, jos tiedosto on olemassa
        {
        write-host ("$testattava_filu exists.")
        }  # if
else
        {
        $vastaus=''
        $vastaus=Read-host ("Create the file $filename? Yes/No")
        if ($vastaus -eq 'Yes')
            {
            New-Item -Path $testattava_filu -ItemType File
            }  # if
        } # else - ei tehd‰ mit‰‰n


#>

<#
    $tiedostot=Get-ChildItem -Path $foldername -File  # kaikki ko. hakemiston tiedostot
    $maara=[int]$tiedostot.Count

    $luotava_filu1=Join-Path -Path $nykyinen_hakemisto -ChildPath $filu1

    Write-Host ($maara, "files in the folder", $foldername)
    # tulostetaan tiedostot allekkain
    Get-ChildItem $foldername | Where { $_.PsIsContainer -eq $false }  | Format-Table Name
    }

  
else
    {
    write-host ("Sorry, $filename in the $foldername does not exist.")
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