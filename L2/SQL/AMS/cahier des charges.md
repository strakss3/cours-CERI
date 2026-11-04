# Cahier des charges :

Bonjour, voici le cahier des charges concernant la modélisation et la mise en place de la base de donnée pour votre entreprise `Elan&Spa`. J'espère que mes propositions seront répondre à vos demandes et je reste à votre disposition pour effectuer des modifications sur ce cahier des charges.

## Règles de gestion :

*to do*

## Cas d'utilisation :

*to do*

## Parcours utilisateur :

*to do*

## Matrice des droits d'accès :

*to do*

- `L` : Lire
- `M` : Modifier
- `C` : Créer 
- `S` : Supprimer

| Donnée / Action       | Client | Acceuil | Administrateur |
| :-------------------- |:------:| :-----: | :------------: |
| Sa propre fiche       | L M    | L M     | L M S          |
| Toute les fiches      |        | L M     | L M S          |
| Factures personnelles | L      | C       | L M C S        |
| Toutes les factures   |        | C       | L M C S        |
| Tarifs                | L      | L       | L M C S        |