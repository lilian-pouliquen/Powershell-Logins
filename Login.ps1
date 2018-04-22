#On introduit les fonctions du script Functions.ps1
. ".\Functions.ps1"

#on construit le chemin du fichier où l'on stockera les informations.
[string]$pcUser = [Environment]::UserName
[string]$path = "C:\Users\$pcUser\Desktop\Scripts\Logins\Logins.dat"
$key = ConversionPwd("-1")

#si le fichier n'existe pas, on crée ce fichier.
if ( ! (Test-Path $path)) 
{
    $path = "C:\Users\$pcUser\Desktop\Scripts"
    New-Item -Name Logins -ItemType Directory -Path $path
    $path = "C:\Users\$pcUser\Desktop\Scripts\Logins"
    New-Item -Name Logins.dat -ItemType File -Path $path -Value "---Logins---`r`n`r`n"
}
 

#on définit le chemin du fichier Logs et on stocke son contenu dan $ log_Content.
$log_Content = get-content $path
    
#on demande à l'utilisateur son nom.
$user = Read-Host "Quel est votre nom d'utilisateur ? "
    
#on vérifie si le nom d'utiliateur est présent dans le fichier.
$res = research($user)
if ($res -ne $False)
{
    $pwd = $log_Content[$res+1]

    #si oui, on demande le mot de passe et on vérifie s'il correspond.
    $password = Read-Host "Entrez votre mot de passe (entrez -1 pour sortir)" -assecurestring
    while (($password -ne $pwd) -and ($password -ne $key))
    {
        $password = Read-Host "Oups ! Ce n'est pas le bon mot de passe !`nVeuillez réessayer " -assecurestring
        $password = ConversionPwd($password)
    }
            
    #clef d'echappement, qui fait sortir du programme.
    if ($password -eq $key)
    {
        echo "Revenez vite ! ^.^"
    }
    #si tout s'est bien passé, on informe à l'utilisateur qu'il est bien connécté.
    else
    {
        echo "Vous vous êtes connecté(e) avec succès."
    }
}
else
{
    echo "Vous n'êtes pas enregistré(e), veuillez faire register."
}

read-host

clear