<#
Create a script that takes three parameters, the type of the parameters is string. 
The script order the given strings by string length. 
Test your script at least with four different test runs, like in the picture.

Testing
Yellow Blue Red -> Red Blue Yellow 
One Three Four  -> O-F-T
Cat Mouse Elephant -> C-M-E
Mouse Elephant Cat -> C-M-E
#>

<#  --- Read-Host helpistä
the `-split` operator to convert the input string into an array of strings. 
However, the split strings include extra spaces. The `Trim()` method removes 
the leading and trailing spaces from each string.
#>

$mjonot = @(3)
$mjonot = (Read-Host "Parameters are ") -split ' '  # erotetaan taulukon alkiot tyhjillä
    # $mjonot | Sort -Property Length

Write-Host("Your ordered words are: ", ($mjonot | Sort -Property Length) )
