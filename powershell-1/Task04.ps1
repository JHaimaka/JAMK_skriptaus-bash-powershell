$names = "Juhani","Tuomas","Aapo","Simeoni","Timo","Lauri","Eero"

$veljesten_maara = $names.Length
Write-Host "There are $veljesten_maara brothers:"
$names
Write-Host "The oldest is", $names[0], "and the youngest is", $names[$veljesten_maara-1]