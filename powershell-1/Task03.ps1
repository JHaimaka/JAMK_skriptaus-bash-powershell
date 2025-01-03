$eka = Read-Host "Give the first integer "   # string
$eka = [int]$eka                             # kokonaisluvuksi
$toka = Read-Host "Give the second integer " # string
$toka = [int]$toka                           # kokonaisluvuksi
Write-Host("Sum is", ($eka + $toka))
Write-Host("Substraction is", ($eka - $toka))
Write-Host("Multiplication is", ($eka * $toka))
Write-Host("Division is", ($eka / $toka))