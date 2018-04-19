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

function clearlogs
{
    ### Efface le contenu du fichier Logs. ###

    clear-content $path"\Logins.dat"
    Add-Content -Path $path"\Logins.dat" -Value "---Logins---`r`n`r`n"
}

function Password
{
    ### Crypte le mot de passe passé en paramètre ###
    
    [string]$password = Read-Host "Veuillez entrer un mot de passe " -assecurestring
    [string]$confirm = Read-Host "Confirmez le mot de passe " -assecurestring
    
    #tant que la confirmation ne correspondra pas au mot de passe saisi,
    #on demande de re-saisir le mot de passe et de le confirmer
    while ($confirm -ne $password)
    {
        $password = Read-Host "Vous avez mal confirmé votre mot de passe, veuillez le re-saisir "
        $confirm = Read-Host "Confirmez le mot de passe " -assecurestring
    }    
    
    $pwdcrypt = convertfrom-securestring $confirm -asplaintext
    return $pwdcrypt
}