# Cahier des charges fonctionnel détaillé (CCFD)

Bonjour, voici le cahier des charges concernant la modélisation et la mise en place de la base de donnée pour votre entreprise `L'Elan & Spa`. J'espère que mes propositions seront répondre à vos demandes et je reste à votre disposition pour effectuer des modifications sur ce cahier des charges.

## 1. Règles de gestion

### 1.1 Adhérents et inscription

- **RG01** : tout adhérent possède un numéro d'adhérent unique, attribué par le système.
- **RG02** : le dossier d'un adhérent comprend obligatoirement : nom, prénom, date de naissance, adresse postale (adresse, code postal, ville), téléphone, email, formule initiale, coordonnées bancaires (titulaire du compte, IBAN, BIC).
- **RG03** : le titulaire du compte bancaire peut être différent de l'adhérent.
- **RG04** : l'historique des activités de l'adhérent (réservations, achats, prêts, factures) est conservé et consultable.
- **RG05** : l'inscription peut se faire à l'accueil ou en ligne.

### 1.2 Formules et abonnements

- **RG06** : une formule est définie par un nom, un tarif mensuel, un quota hebdomadaire de cours collectifs et un quota hebdomadaire de cours particuliers.
- **RG07** : *Autonome* : accès illimité aux activités en autonomie (musculation, piscine, spa), quotas 0 collectif / 0 particulier.
- **RG08** : *Collectif* : accès autonome illimité + 2 cours collectifs par semaine, quotas 2 / 0.
- **RG09** : *Particulier* : accès autonome illimité + 2 cours collectifs + 2 cours particuliers par semaine, quotas 2 / 2.
- **RG10** : un adhérent a exactement une formule applicable par mois.
- **RG11** : l'adhérent peut demander un changement de formule au plus une fois par mois.
- **RG12** : le changement de formule prend effet le 1er du mois suivant la demande. Jusqu'à cette date, la formule en cours reste applicable et la facturation de même.
- **RG13** : un cours réservé et annulé dans le délai autorisé (RG23) ne consomme pas de quota.
- **RG14** : une réservation au-delà du quota est possible en hors-forfait : le système affiche le tarif supplémentaire du cours et demande une confirmation explicite avant d'enregistrer. Le cours est ensuite facturé en supplément.

### 1.3 Planning et réservations

- **RG15** : la journée est découpée en 12 créneaux d'une heure, de 8h00 à 20h00.
- **RG16** : un cours collectif est défini par un créneau (jour, heure), un intitulé, un coach, une salle et une capacité maximale. Le planning prévisionnel est établi par l'administrateur pour le semestre.
- **RG17** : le nombre de réservations d'un cours collectif ne peut pas dépasser sa capacité maximale.
- **RG18** : un cours particulier dure un créneau d'une heure, a un coach dédié et une salle, et sa capacité est strictement de 1 adhérent.
- **RG19** : un coach ne peut pas être affecté à deux cours qui se chevauchent et une salle ne peut pas accueillir deux cours qui se chevauchent.
- **RG20** : un coach ne peut être affecté qu'à un type de cours pour lequel il est habilité. Les habilitations sont gérées par l'administrateur.
- **RG21** : un cours particulier ne peut être réservé que dans les disponibilités hebdomadaires du coach, et la réservation se fait par coach.
- **RG22** : un adhérent ne peut pas avoir deux réservations (collectif ou particulier) dont les horaires se chevauchent.
- **RG23** : l'adhérent peut modifier ou annuler une réservation jusqu'à un délai limite avant le cours (ex. 2 heures). Passé ce délai, le cours est décompté.
- **RG24** : un type de cours est associé aux salles ou espaces compatibles (ex. aquagym en piscine).

### 1.4 Boutique et matériel

- **RG25** : le catalogue contient des articles (serviettes, chaussures, claquettes, maillots, lunettes, etc.) avec une catégorie, une désignation, une taille éventuelle, un tarif d'achat, un tarif de prêt journalier et un stock.
- **RG26** : un achat est enregistré à l'accueil, rattaché à un adhérent, daté, avec quantité, prix unitaire et il décrémente le stock.
- **RG27** : un prêt est enregistré à l'accueil, rattaché à un adhérent, daté, au tarif de prêt (distinct du tarif d'achat). L'article est restitué le jour même et le retour est enregistré.
- **RG28** : un article ne peut être ni acheté ni prêté si son stock disponible est nul.
- **RG29** : la boutique est réservée aux adhérents.

### 1.5 Facturation

- **RG30** : le dernier jour de chaque mois, le système édite automatiquement une facture pour chaque adhérent.
- **RG31** : une facture détaille : le montant de l'abonnement du mois, chaque cours hors-forfait consommé en supplément, chaque achat et chaque prêt du mois, et le total.

## 2. Cas d'utilisation

| Cas d'utilisation | Acteur principal | Règles liées |
| --- | --- | --- |
| Inscrire un adhérent (accueil) | Accueil | RG01–RG03, RG05 |
| S'inscrire en ligne | Adhérent | RG01–RG03, RG05 |
| Modifier ses informations personnelles | Adhérent / Accueil | RG02, RG03 |
| Changer de formule | Adhérent / Accueil | RG10–RG12 |
| Réserver un cours collectif | Adhérent / Accueil | RG13, RG14, RG16, RG17, RG19, RG22, RG24 |
| Réserver un cours particulier | Adhérent / Accueil | RG13, RG14, RG18–RG22, RG24 |
| Modifier ou annuler une réservation | Adhérent / Accueil | RG13, RG23 |
| Enregistrer un achat | Accueil | RG25, RG26, RG28, RG29 |
| Enregistrer un prêt et son retour | Accueil | RG25, RG27–RG29 |
| Générer les factures mensuelles | Système | RG30, RG31 |
| Consulter ses factures, achats et prêts | Adhérent | RG04, RG31 |
| Gérer le planning des cours collectifs | Administrateur | RG15–RG17, RG19, RG20, RG24 |
| Gérer coachs, habilitations et disponibilités | Administrateur | RG19–RG21 |
| Gérer formules, tarifs et catalogue | Administrateur | RG06, RG25 |
| Consulter ses cours et inscrits | Coach | RG16, RG18 |

## 3. Parcours utilisateurs

### 3.1 Parcours de l'adhérent (en ligne)

Toute action décrite ci-dessous peut aussi être réalisée à l'accueil (section 3.2).

1. **Inscription** : l'utilisateur renseigne ses informations personnelles et ses coordonnées bancaires, et choisit sa formule. Il reçoit son numéro d'adhérent.
2. **Correction** : il peut modifier ses informations personnelles ; son changement de formule est limité à une fois par mois et prend effet le 1er du mois suivant.
3. **Réservation d'un cours collectif** : il consulte le planning (créneau, intitulé, coach, salle, places restantes) et choisit un cours. Le système contrôle la capacité, le chevauchement et le quota.
4. **Réservation d'un cours particulier** : il choisit un coach habilité, voit ses créneaux libres et réserve un créneau d'une heure.
5. **Quota atteint** : le système affiche le surcoût du cours et demande une confirmation avant d'enregistrer la réservation (hors-forfait).
6. **Suivi** : il consulte ses réservations et peut les modifier ou les annuler jusqu'au délai limite.
7. **Boutique** : il consulte le catalogue (articles à l'achat ou au prêt, tarifs). L'achat ou le prêt se fait à l'accueil.
8. **Facturation** : il consulte ses achats, ses prêts et sa facture mensuelle détaillée (abonnement, cours hors-forfait, achats, prêts).

**Points de friction identifiés** : quota atteint (cours facturé hors-forfait après confirmation), cours complet, chevauchement, limite d'un changement de formule par mois, délai d'annulation dépassé.

### 3.2 Parcours du personnel d'accueil

1. **Inscription d'un nouvel adhérent** : saisie de la fiche et des coordonnées bancaires, choix de la formule, attribution du numéro d'adhérent.
2. **Accueil d'un adhérent existant** : recherche par nom ou par numéro d'adhérent.
3. **Réservation pour un adhérent** : consultation du planning, réservation de cours collectifs ou particuliers, avertissement du surcoût en cas de hors-forfait.
4. **Modification ou annulation** d'une réservation à la demande de l'adhérent.
5. **Boutique** : enregistrement d'un achat ou d'un prêt, puis du retour de matériel.
6. **Changement de formule** à la demande de l'adhérent.
7. **Consultation** des factures d'un adhérent pour répondre à une question (lecture seule).

## 4. Matrice des droits d'accès

Légende :
- **L** : lire 
- **C** : créer 
- **M** : modifier 
- **X** : annuler 

| Donnée / Action                    | Adhérent                 | Coach                           | Accueil                    | Administrateur | Système                        |
| :--------------------------------- | :----------------------- | :------------------------------ | :------------------------- | :------------- | :----------------------------- |
| Fiche adhérent (identité, contact) | L M (sa fiche)           | L (nom, prénom de ses inscrits) | L C M                      | L C M          |                                |
| Coordonnées bancaires              | L M (les siennes)        |                                 | L (masquées) C M           | L (masquées) M |                                |
| Historique des activités           | L (le sien)              |                                 | L                          | L              | C                              |
| Changement de formule              | L C (1 par mois)         |                                 | L C                        | L C M          | M (application au 1er du mois) |
| Formules et tarifs                 | L                        |                                 | L                          | L C M X        | L                              |
| Planning des cours collectifs      | L                        | L                               | L                          | L C M X        | L                              |
| Réservations (les siennes)         | L C M X                  | L (ses cours)                   | L C M X (pour un adhérent) | L C M X        | M (décompte du quota)          |
| Liste des inscrits à un cours      |                          | L (ses cours)                   | L                          | L              |                                |
| Fiches coachs et spécialités       | L                        | L (sa fiche)                    | L                          | L C M X        |                                |
| Habilitations des coachs           |                          | L (siennes)                     | L                          | L C M X        |                                |
| Disponibilités des coachs          | L                        | L C M (siennes)                 | L                          | L C M X        |                                |
| Salles et espaces                  | L                        | L                               | L                          | L C M X        |                                |
| Catalogue des articles             | L                        |                                 | L                          | L C M X        |                                |
| Stock des articles                 |                          |                                 | L M                        | L C M          | M (mouvements)                 |
| Achats et prêts (les siens)        | L                        |                                 | L C X                      | L X            |                                |
| Retours de matériel                |                          |                                 | L C M                      | L              |                                |
| Factures (les siennes)             | L                        |                                 | L                          | L              | C                              |

**Notes** : « les siens » désigne les données rattachées à l'utilisateur connecté ; l'accueil et l'administrateur accèdent à celles de tous les adhérents et le coach n'accède qu'à ses propres cours. Les factures sont créées uniquement par le système (RG30). Le système a tous les droits mais ici on précise les actions effectués.