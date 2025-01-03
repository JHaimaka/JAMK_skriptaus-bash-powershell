<# PS_5-4
Create a script that writes information of all the local users in a computer to a CSV-file. 
The script has one parameter **filename**. The information includes local users's 1) name 2) full name 3) 
SID and 4) lastlogon.

New-LocalUser -Name 'russja' -FullName 'Jack Russell' -NoPassword
Get-LocalUser | Select-Object Name, FullName, SID, LastLogon | Format-Table
Get-LocalUser | Export-Csv -Path .\localusers.csv -Delimiter ';'
New-EventLog -LogName Application -Source MyPowerShell
Get-EventLog -LogName Application -Source MyPowerShell

Remove-EventLog -LogName "MyPowerShell"
Remove-EventLog -Source MyPowerShell

#>

param (
  [string]$filename = ''      # users_exported.csv
  )

# rekisteröidään oma PowerShell Even Logiin
New-EventLog -LogName Application -Source MyPowerShell
  
$local_users = Get-LocalUser | Select-Object Name, FullName, SID, LastLogon
    # $local_users | ForEach-Object { Write-Host (" Käyttäjät:", $($_.Name)) } 
$local_users | Export-Csv -Path $filename -Delimiter ','

Write-EventLog –LogName Application –Source “MyPowerShell” –EntryType Information –EventID 1000 –Message “Harjoitus 5-4 Local users -> CSV”
    # Get-EventLog -LogName Application -Source MyPoweShell
    # Kirjoitus näkyy Event Viewerissä jos Local security Policy (Audit File System) on päällä - kai



<#
$accoun_maara=0
$vastaus=''
$tyohakemisto = Get-Location
$luettava_CSV = Join-Path -Path $tyohakemisto -ChildPath $filename 
    # Write-Host ("Luettava_CSV : $luettava_CSV")
if (Test-Path -Path $luettava_CSV) # jos on olemassa
    {
        Import-Csv users.csv | ForEach-Object {
     
        #write-host ("CSV sisältö :", $_.User, $_.Firstname ,$_.Lastname)
        $vastaus = Read-Host ("A new local ", $_.User, "will be created for", $_.Firstname ,$_.Lastname, "[Yes/No]")
        if ($vastaus -eq "Yes")
            {

            # write-host ("Luotava account :", $_.User, $_.Firstname ,$_.Lastname)
            # New-LocalUser -Name $newuser -NoPassword
                $accoun_maara += 1
            } # if
             
        #Write-Host ("A new local account $accoun_maara, new accounts created ") 
        }  # foreach
        Get-LocalUser | Where-Object -Property Enabled
     } # if
else
    {
    Write-Host ("The given file $filename does not exist.")
    }
#>