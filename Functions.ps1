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