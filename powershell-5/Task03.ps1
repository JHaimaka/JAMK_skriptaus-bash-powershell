<#
Create a script that creates new localusers by a given csv-file. 
The script has one parameter filename. Check first that the given file exist, 
then read all lines and create a new local user account for every user in file. 
The account name is created same way as in the task 01. 
You can use in this script the parameter NoPassword 
Please remember: you have to run this script with Administrator privileges 
that you can use the New-LocalUser cmdlet. If the given file does not exist, 
the script gives a proper error message.
Please note: and you can delete creted local users after you have tested that 
your script is working. Please remember take a screenshot from your test run.

$newuser = 'PowerUser'
New-LocalUser -Name $newuser -FullName $fullname -NoPassword
...tai...
$params = @{
    Name        = 'User03'
    Password    = $Password
    FullName    = 'Third User'
    Description = 'Description of this account.'
}
New-LocalUser @params

#>

param (
  [string]$filename = ''     # users.csv
  )

$accoun_maara=0
$vastaus=''
$tyohakemisto = Get-Location
$luettava_CSV = Join-Path -Path $tyohakemisto -ChildPath $filename 
    # Write-Host ("Luettava_CSV : $luettava_CSV")
if (Test-Path -Path $luettava_CSV) # jos on olemassa
    {
        Import-Csv users.csv | ForEach-Object {
                #write-host ("CSV sisältö :", $_.User, $_.Firstname ,$_.Lastname)
        $vastaus = Read-Host ("A new local", $_.User, "will be created for", $_.Firstname ,$_.Lastname, "[Yes/No]")
        if ($vastaus -eq "Yes") # vain Yes -vastaus hyväksytään
            {
            #write-host ("Luotava account :", $_.User)      # $_.Firstname ,$_.Lastname
            New-LocalUser -Name $_.User -NoPassword | Out-Null
            $accoun_maara += 1
            } # if
        }  # foreach
     } # if
else
    {
    Write-Host ("The given file $filename does not exist.")
    Exit
    }
 
 Get-LocalUser | Where-Object -Property Enabled
 Write-Host ("$accoun_maara new local accounts were created succesfully") 