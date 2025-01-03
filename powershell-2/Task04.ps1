<#
Create a script that takes two named parameters. The first parameter is the name of a user, 
second how many times the script greets the user. 
Give default values for the parameters, so if the script is run without arguments, 
it will say **Hello unknown** only once.

**Testing**
*.\Task04.ps1*
*.\Task04.ps1 -name 'Jackie Russell' -hellos 4*

#>

param (
[string]$name = 'Unknown',
[int]$hellos=1
)

for ($i=0; $i -lt $hellos; $i++)
{
  Write-Host("Hello $name")
}