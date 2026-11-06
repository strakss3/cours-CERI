# Sujet du TP InSpamWeTrust

Exécutez le script de création de table pour InSpamWeTrust (`script-tables-InSpamWeTrust.sql`) puis celui d’insertion des exemples dans les tables (`script-insert-InSpamWeTrust.sql`)

## 1. Modification et ajout de tables

Nous souhaitons légèrement modifier notre base de données. Donnez les commandes SQL permettant de faire les modifications suivantes :

1.1 - La table ADRMAIL ne contient pas encore le champ ADR (de type chaine de caractères, longueur 100).
Ajoutez ce champ à la table, puis exécutez le script SQL suivant pour insérer des valeurs d’exemple :
`script-insert-part1-2-InSpamWeTrust.sql`.

1.2 – Nous souhaitons également proposer des adresses FROM diversifiées.

Pour cela, créez une nouvelle table ADRFROM comportant les champs suivants :

- IdFROM : entier, clé primaire de la table
- TXT : champ texte
- CAT : champ de type chaîne de caractères (longueur  maximum 100)

Créez également une table CO_FROM qui permettra de faire la jointure entre les contrats et les adresses FROM. 

Cette table contiendra uniquement deux champs :

- IdCO : entier
- IdFROM : entier

Ces deux champs forment à eux 2 la clé primaire de la table CO_FROM et sont également des clés externes (étrangères) pour les tables CONTRAT et ADRFROM

Une fois ces tables créées, exécutez le script suivant afin de les remplir avec des données d’exemple :
`script-insert-part2-InSpamWeTrust.sql`

## 2 – Insertion d’un nouveau contrat.

Nous devons ajouter un nouveau contrat dans la base de données.

C'est avec notre client Bernard Corp,

- Client : Bernard Corp
- Objet : Remboursement en attente (déjà existant dans la base)
- Texte du spam : « Recevez immédiatement votre remboursement de 750 euros. Cliquez ici pour valider. »
- Type de contrat : 2M-valide
- Catégorie FROM : banque

2.1 - Donnez la commandes SQL qui permet d’insérer ce contrat dans la table CONTRAT

2.2 – Donnez les commandes qui insères les lignes correspondantes dans les tables suivantes :

- CO_FROM : insérez 3 adresses appartenant à la catégorie banque
- CO_DISTRA : insérez 3 enregistrements distincts
- CO_ADR : insérez 5 adresses, dont au moins 3 ayant le statut validée

## 3 – Requêtes SELECT

Donnez les Requêtes SELECT permettant de répondre aux questions suivantes :

3.1 – Donner tous les champs FROM utilisés pour le contrat du client Bernard Corp ?

3.2 – Quels sont le (ou les) distracteurs les plus utilisés ?

3.3 - Quels sont les champs FROM inutilisés pour chaque client ?

3.4 – Pour quel client avons nous envoyé le plus de mails et combien ?

*Last modified: Friday, 6 November 2026, 1:07 PM*