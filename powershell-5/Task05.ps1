<# PS_5-5

In this task you have to create a new function called **Add-MyEvent**. 
The function takes two parameter: **Type** and **Message**. The type can be: Error, Warning, or Information. 
Message is a clear message. Add the following functionality to the task 04 using your new function.
- if the script can create a new CSV-file succesfully, then it will add a Information message to the eventlog. 
- if the script cannot create a file succesfully, then it adds a Error message to the eventlog.
Before using your new function create a new source named "MyPowerShell" to the Evenlog for writing your events.


New-LocalUser -Name 'russja' -FullName 'Jack Russell' -NoPassword
Get-LocalUser | Select-Object Name, FullName, SID, LastLogon | Format-Table
Get-LocalUser | Export-Csv -Path .\localusers.csv -Delimiter ';'
New-EventLog -LogName Application -Source MyPowerShell
Get-EventLog -LogName Application -Source MyPowerShell

Remove-EventLog -LogName "MyPowerShell"
Remove-EventLog -Source MyPowerShell
Clear-EventLog -LogName Application


#>

param (
  [string]$filename = ''         # users_exported.csv'
  )

# rekisteröidään oma PowerShell Even Logiin
New-EventLog -LogName Application -Source MyPowerShell # ohjelmassa pitäisi käsitellä onko tämä jo luotu
# testauksessa ajettava välissä Remove-EventLog -Source MyPowerShell ja Clear-EventLog -LogName Application

function Add-MyEven {
 Param($Type, $Message) 
    try
    {
        #itse ohjelmakoodi
    $local_users = Get-LocalUser | Select-Object Name, FullName, SID, LastLogon
    $local_users | Export-Csv -Path $filename -Delimiter ','

    Write-EventLog -LogName Application -Source “MyPowerShell” –EntryType $Type –EventID 2000 –Message $Message
    Write-Host ("users_exported.csv luonti onnistui")

    }
    catch
    {
        #jos jotain menee pieleen jatketaan täältä
        Write-Host ("users_exported.csv -luonti epäonnistui")
        Write-EventLog -LogName Application -Source “MyPowerShell” –EntryType Error –EventID 2000 –Message “CSV-file users_exported.csv ERROR”
    }
} # function
  
Add-MyEven Information “CSV-file users_exported.csv created succesfully.”



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