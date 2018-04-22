#On introduit les fonctions du script Functions.ps1
. ".\Functions.ps1"

#on appelle la fonction d'initialisation
Initialisation

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
    $password = Read-Host "Entrez votre mot de passe (entrez -1 pour sortir)"
    while (($password -ne $pwd) -and ($password -ne "-1"))
    {
        $password = Read-Host "Oups ! Ce n'est pas le bon mot de passe !`nVeuillez r�essayer "
    }
            
    #clef d'echappement, qui fait sortir du programme.
    if ($password -eq "-1")
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