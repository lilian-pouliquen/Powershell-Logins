#On introduit les fonctions du script Functions.ps1
. ".\Functions.ps1"

#on construit le chemin du fichier o� l'on stockera les informations.
[string]$pcUser = [Environment]::UserName
[string]$path = "C:\Users\$pcUser\Desktop\Scripts\Logins\Logins.dat"
$key = ConversionPwd("-1")

#si le fichier n'existe pas, on cr�e ce fichier.
if ( ! (Test-Path $path)) 
{
    $path = "C:\Users\$pcUser\Desktop\Scripts"
    New-Item -Name Logins -ItemType Directory -Path $path
    $path = "C:\Users\$pcUser\Desktop\Scripts\Logins"
    New-Item -Name Logins.dat -ItemType File -Path $path -Value "---Logins---`r`n`r`n"
}
 

#on d�finit le chemin du fichier Logs et on stocke son contenu dan $ log_Content.
$log_Content = get-content $path
    
#on demande � l'utilisateur son nom.
$user = Read-Host "Quel est votre nom d'utilisateur ? "
    
#on v�rifie si le nom d'utiliateur est pr�sent dans le fichier.
$res = research($user)
if ($res -ne $False)
{
    $pwd = $log_Content[$res+1]

    #si oui, on demande le mot de passe et on v�rifie s'il correspond.
    $password = Read-Host "Entrez votre mot de passe (entrez -1 pour sortir)" -assecurestring
    while (($password -ne $pwd) -and ($password -ne $key))
    {
        $password = Read-Host "Oups ! Ce n'est pas le bon mot de passe !`nVeuillez r�essayer " -assecurestring
        $password = ConversionPwd($password)
    }
            
    #clef d'echappement, qui fait sortir du programme.
    if ($password -eq $key)
    {
        echo "Revenez vite ! ^.^"
    }
    #si tout s'est bien pass�, on informe � l'utilisateur qu'il est bien conn�ct�.
    else
    {
        echo "Vous vous �tes connect�(e) avec succ�s."
    }
}
else
{
    echo "Vous n'�tes pas enregistr�(e), veuillez faire register."
}

read-host

clear