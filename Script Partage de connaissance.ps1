Clear-Host
Set-Location C:\Users\admin\Desktop\

Remove-Item Test_script -recurse

New-Item -ItemType directory -Name Test_Script

Set-Location Test_Script
New-Item -Name Test.txt
Add-Content Test.txt -Value “Bonjour Monde !”

Get-Content Test.txt

$newContent = "Ceci est un contenu additionel que je rajoute à l'intérieur du document texte."
Add-Content Test.txt $newContent

Get-Content Test.txt