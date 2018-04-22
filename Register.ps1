#On introduit les fonctions du script Functions.ps1
. ".\Functions.ps1"

#on appelle la fonction d'initialisation
Initialisation

#on construit le chemin du fichier o� l'on stockera les informations.
[string]$pcUser = [Environment]::UserName
[string]$path = "C:\Users\$pcUser\Desktop\Scripts\Logins\Logins.dat"

FileExistence($path)

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
    #saisie du mot de passe
    $pwd = PwdEntry

    #enfin on �crit les donn�es dans le fichier Logins
    #et on informe l'utilisateur qu'il a bien �t� enregistr�.
    Add-content Logins.dat $user
    Add-content Logins.dat $password
    Add-Content Logins.dat ""
    
    echo "Vous avez bien �t� enregistr�(e) !"
}

read-host

clear