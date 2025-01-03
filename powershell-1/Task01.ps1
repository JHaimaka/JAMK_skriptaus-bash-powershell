# $current_date = Get-Date -Format d  - palauttaa 30 Sep 2024
# mielummin en-FI Windowsissa
$current_date = Get-Date -Format "dd.MM.yyyy"
Write-Host "logged username is $env:USERNAME and today is $current_date"