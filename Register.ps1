#On introduit les fonctions du script Functions.ps1
. ".\Functions.ps1"

#on construit le chemin du fichier o� l'on stockera les informations.
[string]$pcUser = [Environment]::UserName
[string]$path = "C:\Users\$pcUser\Desktop\Scripts\Logins\Logins.dat"

#si le fichier n'existe pas, on cr�e ce fichier.
if (!(Test-Path $path)) 
{
    $path = "C:\Users\$pcUser\Desktop\Scripts"
    New-Item -Name Logins -ItemType Directory -Path $path
    $path = "C:\Users\$pcUser\Desktop\Scripts\Logins"
    New-Item -Name Logins.dat -ItemType File -Path $path -Value "---Logins---`r`n`r`n"
}


#on demande � l'utilisateur de saisir son nom d'utilisateur.
[string]$user = Read-Host "Quel est votre nom d'utilisateur ? (entrez -1 pour quitter) "
    
sl $path.replace("\Logins.dat", "")
    
#on teste si le nom d'utilisateur n'est pas d�j� enregistr�.
$log_Content = get-content Logins.dat

while ((research($user) -ne $False) -and ($user -ne "-1"))
{
    $user = Read-Host "Oups ! Ce nom est d�j� utilis� !`nVeuillez r�essayer "
}
        
#clef d'echappement, qui fait sortir du programme.    
if ($user -eq "-1")
{
    echo "Revenez vite ! ^.^"
}
    
else
{
    #si le nom d'utilisateur n'est pas pris, on demande d'entrer un mot de passe et de le confirmer.
    [string]$password = Read-Host "Veuillez entrer un mot de passe "
    [string]$confirm = Read-Host "Confirmez le mot de passe "
    
    #tant que la confirmation ne correspondra pas au mot de passe saisi,
    #on demande de re-saisir le mot de passe et de le confirmer
    while ($confirm -ne $password)
    {
        $password = Read-Host "Vous avez mal confirm� votre mot de passe, veuillez le re-saisir "
        $confirm = Read-Host "Confirmez le mot de passe "
    }

    #enfin on �crit les donn�es dans le fichier Logins
    #et on informe l'utilisateur qu'il a bien �t� enregistr�.
    Add-content Logins.dat $user
    Add-content Logins.dat $password
    Add-Content Logins.dat ""
    
    echo "Vous avez bien �t� enregistr�(e) !"
}

read-host

clear