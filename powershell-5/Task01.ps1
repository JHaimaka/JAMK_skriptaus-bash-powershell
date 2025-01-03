<#
Create a script that creates new accounts for a placebo system 
(placebo means here that the **system** not really exists). 
The script takes one parameter filename. The parameter points 
to a csv file including user names. Check first that the given 
file exist, then read all lines. User's account is created by 
taking first four characters of lastname and two characters of 
firstname. The account contains only lowercase letters. 
Give a message presented in the picture below. 

If the given file does not exist, the script will show an error message.

#>

param (
  [string]$filename = ''  # users.csv
  )

$accoun_maara=0
$tyohakemisto = Get-Location
$luettava_CSV = Join-Path -Path $tyohakemisto -ChildPath $filename 
    # Write-Host ("Luettava_CSV : $luettava_CSV")
if (Test-Path -Path $luettava_CSV) # jos on olemassa
    {
        Import-Csv users.csv | ForEach-Object {
        write-host ("Hello my colleague", $_.Firstname ,$_.Lastname, "this is your new account:")
        # 4 char lastname
        for ($i=0; $i -lt 4; $i++) 
            { 
            $luotava_account += $_.Lastname[$i] 
               # Write-Host ("For [$i] Luotava account: -> ", $luotava_account)
            }
        # 2 char firstname
        $luotava_account += $_.Firstname[0] + $_.Firstname[1]     
                # Write-Host ("FOR Luotava account: -> ") $luotava_account.ToLower()    
        write-host $luotava_account.ToLower()
        $luotava_account=''
        $accoun_maara += 1
        } # foreach
    Write-Host ($accoun_maara, "new accounts created ") 
    }  # if

else
    {
    Write-Host ("The given file $filename does not exist.")
    }