function Initialisation
{
    ### Initialise le traitement ###

    #on construit le chemin du fichier où l'on stockera les informations.
    [string]$pcUser = [Environment]::UserName
    [string]$path = "C:\Users\$pcUser\Desktop\Scripts\Logins\Logins.dat"

    #puis on teste l'existence du fichier Logins.dat
    FileExistence($path)
}

function FileExistence($path)
{
    ### Teste l'existence du fichier Logins.dat 

    #si le fichier n'existe pas, on crée ce fichier.
    if ( ! (Test-Path $path)) 
    {
        $path = "C:\Users\$pcUser\Desktop\Scripts"
        New-Item -Name Logins -ItemType Directory -Path $path
        $path = "C:\Users\$pcUser\Desktop\Scripts\Logins"
        New-Item -Name Logins.dat -ItemType File -Path $path -Value "---Logins---`r`n`r`n"
    }
}

function research($user)
{
    ### Fonnction permettant de rechercher un nom d'utilisateur dans le fichier Logs. ###

    $i = 0
    while (($user -ne $log_Content[$i]) -and ($i -lt ($log_content.Length)))
    {
        $i++
    }

    if ($user -eq $log_Content[$i])
    {
        return $i
    }
    else
    {
        return $False
    }
}

function PwdEntry
{
    #si le nom d'utilisateur n'est pas pris, on demande d'entrer un mot de passe et de le confirmer.
    [string]$password = Read-Host "Veuillez entrer un mot de passe "
    [string]$confirm = Read-Host "Confirmez le mot de passe "
    
    #tant que la confirmation ne correspondra pas au mot de passe saisi,
    #on demande de re-saisir le mot de passe et de le confirmer
    while ($confirm -ne $password)
    {
        $password = Read-Host "Vous avez mal confirmé votre mot de passe, veuillez le re-saisir "
        $confirm = Read-Host "Confirmez le mot de passe "
    }
    
    return $confirm
}

function clearlogs($path)
{
    ### Efface le contenu du fichier Logs. ###

    clear-content $path"\Logins.dat"
    Add-Content -Path $path"\Logins.dat" -Value "---Logins---`r`n`r`n"
}