# Scrapping des Mairies du Val d'Oise

Ce projet permet de scrapper les informations des mairies du Val-d'Oise à partir de l'annuaire des services publics. Il récupère les noms des mairies et leurs emails, puis les affiche sous forme de Hash.

## Fonctionnalités

- Récupération des noms des mairies.
- Extraction des URLs des pages des mairies.
- Scrapping des adresses e-mail associées à chaque mairie.
- Gestion des erreurs en cas de page indisponible ou d'e-mail manquant.

## Prérequis

Avant de lancer le projet, assurez-vous d'avoir installé les dépendances suivantes :

- **Ruby** : Version 2.5 ou plus récente.
- **Bundler** : Pour installer les gems nécessaires au projet.

## Installation

1. Clonez ce dépôt sur votre machine locale :

   ```bash git clone https://github.com/votre-utilisateur/scrapping-mairies.git```

2. Accédez au répertoire du projet :
    `cd scrapping-mairies`

3. Installez les dépendances avec Bundler :
    `bundle install`

## Utilisation

Pour exécuter le script de scrapping, suivez ces étapes :

1. Ouvrez le fichier menu_scrap.rb dans le répertoire lib/. Ce fichier propose un menu interactif qui permet de lancer les différents scripts de scrapping, y compris celui pour les mairies.

2. Lancez le menu :

    `ruby lib/menu_scrap.rb`

3. Choisissez l'option correspondant au scrapping des mairies. Le script récupérera les informations des mairies du Val-d'Oise et affichera les résultats dans la console.

    ```Exemple de sortie :

    Nom de la mairie : Paris, URL : https://lannuaire.service-public.fr/mairie/paris
    Nom de la mairie : Lyon, URL : https://lannuaire.service-public.fr/mairie/lyon```


## Détails techniques

## Fichier `scrap_town.rb`

```
Fonction get_townhall_email : Cette fonction prend en paramètre l'URL d'une mairie et retourne l'adresse e-mail associée.
Fonction get_townhall_urls : Cette fonction récupère la liste des mairies et leurs e-mails sur une page spécifique de l'annuaire.
```

## Scrapping avec Nokogiri

Le projet utilise Nokogiri pour analyser le HTML de la page web. Voici un exemple de son utilisation dans le fichier `scrap_town.rb` :

```ruby
require 'nokogiri'
require 'open-uri'

def get_townhall_email(townhall_url)
  doc = Nokogiri::HTML(URI.open(townhall_url))
    mail = doc.css('.send-mail').text
  mail
end
```
## Fichier `menu_scrap.rb`
Le fichier menu_scrap.rb contient un menu interactif qui permet de choisir différents scripts à exécuter, y compris le scrapping des mairies.

## Tests

Le projet inclut des tests avec RSpec. Vous pouvez exécuter les tests avec la commande suivante :

`bundle exec rspec`

Les fichiers de test sont situés dans le répertoire `spec/`, par exemple :

- `spec/scrap_town_spec.rb` pour tester le scrapping des mairies.
- `spec/scrap_cmc_spec.rb` pour tester d'autres scripts de scrapping.

## Améliorations futures

* Ajouter la possibilité d'enregistrer les résultats dans un fichier CSV.
* Étendre le scrapping à d'autres départements et services publics.
* Optimiser le script pour gérer un grand nombre de pages plus rapidement.

## Contributeurs

* Aka'

## License
Ce projet est sous licence MIT. Consultez le fichier LICENSE pour plus de détails.