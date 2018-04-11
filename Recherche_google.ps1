$recherche = Read-Host("Que souhaitez-vous rechercher ? ")

function search($recherche)
{
    $searchgl = "google.com/search?q="

    $recherche = $recherche.Replace(" ", "%20")

    start chrome $searchgl+$recherche
}

search($recherche)