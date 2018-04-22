#On introduit les fonctions du script Functions.ps1
. ".\Functions.ps1"

#on appelle la fonction d'initialisation
Initialisation

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
    $password = Read-Host "Entrez votre mot de passe (entrez -1 pour sortir)"
    while (($password -ne $pwd) -and ($password -ne "-1"))
    {
        $password = Read-Host "Oups ! Ce n'est pas le bon mot de passe !`nVeuillez réessayer "
    }
            
    #clef d'echappement, qui fait sortir du programme.
    if ($password -eq "-1")
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