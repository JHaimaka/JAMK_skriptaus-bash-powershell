<# 5-2
Create a script that opens all the given urls to a browser. 
The script has one parameter **filename**. 
The parameter points to a text file where urls are. 
Check first that the given file exist, then read all lines and open the urls in a browser. 
If the given file does not exist, the script will show a error message.
Start-Process -FilePath Firefox -ArgumentList www.jamk.fi
#>

param (
  [string]$filename = ''   # URLs.txt
  )
  
$tyohakemisto = Get-Location
$luettavat_URL = Join-Path -Path $tyohakemisto -ChildPath $filename 
    # Write-Host ("Luettava_URL : $luettava_URL")
if (Test-Path -Path $luettavat_URL) # jos on olemassa
    {
    $URLs = Get-Content $luettavat_URL
        # write-host ("URLs count",$URLs.Count)
    for ($URLit=0; $URLit -lt $URLs.Count; $URLit++)
        {
            # write-host ("For URLs",$URLs[$URLit])
        # avataan web -sivut Windows Edgessä
        Start-Process -FilePath msedge.exe -ArgumentList $URLs[$URLit]
        }
    }
else
    {
    Write-Host ("The given file $filename does not exist.")
    }
 
