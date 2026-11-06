# Cahier des charges fonctionnel détaillé (CCFD)

Bonjour, voici le cahier des charges concernant la modélisation et la mise en place de la base de donnée pour votre entreprise **L'Elan & Spa**. J'espère que mes propositions seront répondre à vos demandes et je reste à votre disposition pour effectuer des modifications sur ce cahier des charges.

## 1. Règles de gestion

### 1.1 Adhérents et inscription

- **RG01** : tout adhérent possède un numéro d'adhérent unique, attribué par le système lors de son inscription.
- **RG02** : le dossier d'un adhérent comprend obligatoirement : nom, prénom, date de naissance, adresse postale (adresse, code postal, ville), téléphone, email, formule initiale, coordonnées bancaires (titulaire du compte, IBAN, BIC).
- **RG03** : le titulaire du compte bancaire peut être différent de l'adhérent.
- **RG04** : l'inscription peut se faire à l'accueil ou en ligne.
- **RG05** : l'historique des activités de l'adhérent (réservations, achats, prêts, factures) est conservé et consultable.

### 1.2 Comptes et accès

- **RG06** : chaque adhérent, membre du personnel d'accueil, coach et responsable dispose d'un espace personnel pour se connecter et effectuer les actions auxquelles son rôle lui donne accès (section 4).
- **RG07** : l'identifient unique de connection de l'adhérent est son adresse mail renseigné dans s afiche d'inscription et il choisit lui-même son mot de passe.
- **RG08** : les identifiants et mots de passe du personnel d'accueil et des coachs sont imposés par le responsable.
- **RG09** : tout changement de mot de passe, quel que soit l'utilisateur (adhérent, accueil, coach), s'effectue par l'intermédiaire du responsable.

### 1.3 Désinscription et anonymisation

- **RG10** : un adhérent peut se désinscrire auprès de l'accueil.
- **RG11** : les coordonnées personnelles d'un adhérent désinscrit (identité, date de naissance, adresse postale, téléphone, email, coordonnées bancaires) sont conservées pendant 2 mois à compter de la désinscription, puis supprimées.
- **RG12** : à l'issue de ces 2 mois, seul le numéro d'adhérent est conservé : l'adhérent est alors anonymisé et ses cours passés, achats, prêts et factures restent rattachés à ce numéro.

### 1.4 Formules et abonnements

- **RG13** : une formule est définie par un nom, un tarif mensuel, un quota hebdomadaire de cours collectifs et un quota hebdomadaire de cours particuliers.
- **RG14** : *Autonome* : accès illimité aux activités en autonomie (musculation, piscine, spa), quotas 0 collectif / 0 particulier.
- **RG15** : *Collectif* : accès autonome illimité + 2 cours collectifs par semaine, quotas 2 / 0.
- **RG16** : *Particulier* : accès autonome illimité + 2 cours collectifs + 2 cours particuliers par semaine, quotas 2 / 2.
- **RG17** : un adhérent a exactement une formule applicable par mois.
- **RG18** : l'adhérent peut demander un changement de formule au plus une fois par mois.
- **RG19** : le changement de formule prend effet le 1er du mois suivant la demande. Jusqu'à cette date, la formule en cours reste applicable et la facturation de même.
- **RG20** : un cours réservé et annulé avant l'heure de ce dernier (RG30) ne consomme pas de quota.
- **RG21** : une réservation au-delà du quota est possible en hors-forfait : le système affiche le tarif supplémentaire du cours et demande une confirmation explicite avant d'enregistrer. Le cours est ensuite facturé en supplément.

### 1.5 Planning et réservations

- **RG22** : la journée est découpée en 12 créneaux d'une heure, de 8h00 à 20h00.
- **RG23** : un cours collectif est défini par un créneau (jour, heure), un intitulé, un coach, une salle et une capacité maximale. Le planning prévisionnel est établi par le responsable pour le semestre.
- **RG24** : le nombre de réservations d'un cours collectif ne peut pas dépasser sa capacité maximale.
- **RG25** : un cours particulier dure un créneau d'une heure, a un coach dédié et une salle, et sa capacité est strictement de 1 adhérent.
- **RG26** : un coach ne peut pas être affecté à deux cours qui se chevauchent et une salle ne peut pas accueillir deux cours qui se chevauchent.
- **RG27** : un coach ne peut être affecté qu'à un type de cours pour lequel il est habilité. Les habilitations sont gérées par le responsable.
- **RG28** : un cours particulier ne peut être réservé que dans les disponibilités hebdomadaires du coach, et la réservation se fait par coach.
- **RG29** : un adhérent ne peut pas avoir deux réservations (collectif ou particulier) dont les horaires se chevauchent.
- **RG30** : l'adhérent peut modifier ou annuler une réservation jusqu'au dernier moment avant le cours (ex. 2 heures). Passé ce délai, le cours est décompté.
- **RG31** : un type de cours est associé aux salles ou espaces compatibles (ex. aquagym en piscine).

### 1.6 Boutique et matériel

- **RG32** : le catalogue contient des articles (serviettes, chaussures, claquettes, maillots, lunettes, etc.), un tarif d'achat, un tarif de prêt journalier et un stock.
- **RG33** : un achat est enregistré à l'accueil, rattaché à un adhérent, daté, avec quantité, prix unitaire et il décrémente le stock.
- **RG34** : un prêt est enregistré à l'accueil, rattaché à un adhérent, daté, au tarif de prêt (distinct du tarif d'achat). L'article est restitué le jour même et le retour est enregistré.
- **RG35** : un article ne peut être ni acheté ni prêté si son stock disponible est nul.
- **RG36** : la boutique est réservée aux adhérents.

### 1.7 Facturation

- **RG37** : le dernier jour de chaque mois, le système édite automatiquement une facture pour chaque adhérent.
- **RG38** : une facture détaille : le montant de l'abonnement du mois, chaque cours hors-forfait consommé en supplément, chaque achat et chaque prêt du mois, et le total.

## 2. Cas d'utilisation

| Cas d'utilisation                             | Acteur principal   | Règles liées                             |
| :-------------------------------------------- | :----------------- | :--------------------------------------- |
| Inscrire un adhérent (accueil)                | Accueil            | RG01–RG04, RG07                          |
| S'inscrire en ligne                           | Adhérent           | RG01–RG04, RG07                          |
| Se connecter à son espace personnel           | Tous les acteurs   | RG01, RG06–RG08                          |
| Modifier ses informations personnelles        | Adhérent / Accueil | RG02, RG03                               |
| Changer de formule                            | Adhérent / Accueil | RG17–RG19                                |
| Désinscrire un adhérent                       | Accueil            | RG10–RG12                                |
| Réserver un cours collectif                   | Adhérent / Accueil | RG20, RG21, RG23, RG24, RG26, RG29, RG31 |
| Réserver un cours particulier                 | Adhérent / Accueil | RG20, RG21, RG25–RG29, RG31              |
| Modifier ou annuler une réservation           | Adhérent / Accueil | RG20, RG30                               |
| Enregistrer un achat                          | Accueil            | RG32, RG33, RG35, RG36                   |
| Enregistrer un prêt et son retour             | Accueil            | RG32, RG34–RG36                          |
| Générer les factures mensuelles               | Système            | RG37, RG38                               |
| Consulter ses factures, achats et prêts       | Adhérent           | RG05, RG38                               |
| Gérer le planning des cours collectifs        | Responsable        | RG22–RG24, RG26, RG27, RG31              |
| Gérer coachs, habilitations et disponibilités | Responsable        | RG26–RG28                                |
| Gérer formules, tarifs et catalogue           | Responsable        | RG13, RG32                               |
| Gérer les comptes et mots de passe            | Responsable        | RG08, RG09                               |
| Consulter ses cours et inscrits               | Coach              | RG23, RG25                               |

## 3. Parcours utilisateurs

### 3.1 Parcours de l'adhérent (en ligne)

Toute action décrite ci-dessous peut aussi être réalisée à l'accueil (section 3.2).

1. **Inscription** : l'utilisateur renseigne ses informations personnelles et ses coordonnées bancaires, choisit sa formule et son mot de passe. Il reçoit son numéro d'adhérent, qui est son identifiant de connexion.
2. **Connexion** : il se connecte à son espace personnel avec son numéro d'adhérent et son mot de passe. Tout changement de mot de passe passe par le responsable.
3. **Correction** : il peut modifier ses informations personnelles ; son changement de formule est limité à une fois par mois et prend effet le 1er du mois suivant.
4. **Réservation d'un cours collectif** : il consulte le planning (créneau, intitulé, coach, salle, places restantes) et choisit un cours. Le système contrôle la capacité, le chevauchement et le quota.
5. **Réservation d'un cours particulier** : il choisit un coach habilité, voit ses créneaux libres et réserve un créneau d'une heure.
6. **Quota atteint** : le système affiche le surcoût du cours et demande une confirmation avant d'enregistrer la réservation (hors-forfait).
7. **Suivi** : il consulte ses réservations et peut les modifier ou les annuler jusqu'au délai limite.
8. **Boutique** : il consulte le catalogue (articles à l'achat ou au prêt, tarifs). L'achat ou le prêt se fait à l'accueil.
9. **Facturation** : il consulte ses achats, ses prêts et sa facture mensuelle détaillée (abonnement, cours hors-forfait, achats, prêts).
10. **Désinscription** : elle se fait auprès de l'accueil (section 3.2). Ses coordonnées personnelles sont supprimées 2 mois plus tard ; seul son numéro d'adhérent est conservé, de façon anonyme, pour l'historique.

### 3.2 Parcours du personnel d'accueil

1. **Connexion** : il se connecte à son espace personnel avec l'identifiant et le mot de passe imposés par le responsable.
2. **Inscription d'un nouvel adhérent** : saisie de la fiche et des coordonnées bancaires, choix de la formule, attribution du numéro d'adhérent (identifiant de connexion) ; l'adhérent choisit son mot de passe.
3. **Accueil d'un adhérent existant** : recherche par nom ou par numéro d'adhérent.
4. **Réservation pour un adhérent** : consultation du planning, réservation de cours collectifs ou particuliers, avertissement du surcoût en cas de hors-forfait.
5. **Modification ou annulation** d'une réservation à la demande de l'adhérent.
6. **Boutique** : enregistrement d'un achat ou d'un prêt, puis du retour de matériel.
7. **Changement de formule** à la demande de l'adhérent.
8. **Consultation** des factures d'un adhérent pour répondre à une question (lecture seule).
9. **Désinscription** d'un adhérent à sa demande ; ses coordonnées personnelles sont conservées 2 mois puis supprimées, seul son numéro d'adhérent reste, de façon anonyme, pour l'historique.

## 4. Matrice des droits d'accès

Légende :
- **L** : lire 
- **C** : créer 
- **M** : modifier 
- **X** : annuler ou désinscrire 
- **S** : supprimer 

| Donnée / Action | Adhérent | Coach | Accueil | Responsable | Système |
| --- | --- | --- | --- | --- | --- |
| Fiche adhérent (identité, contact) | L M (sa fiche) | L (nom, prénom de ses inscrits) | L C M | L C M | |
| Coordonnées bancaires | L M (les siennes) | | L (masquées) C M | L (masquées) M | | | Compte de l'adhérent (numéro d'adhérent, mot de passe) | C (choix de son mot de passe) | | C (inscription à l'accueil) | M (changement de mot de passe) | C (attribution du numéro d'adhérent) |
| Comptes du personnel d'accueil et des coachs (identifiant, mot de passe) | | | | C M | |
| Historique des activités | L (le sien) | | L | L | C |
| Changement de formule | L C (1 par mois) | | L C | L C M | M (application au 1er du mois) |
| Désinscription d'un adhérent | | | X | X | |
| Coordonnées personnelles d'un adhérent désinscrit | | | | | S (2 mois après la désinscription) |
| Formules et tarifs | L | | L | L C M X | L |
| Planning des cours collectifs | L | L | L | L C M X | L |
| Réservations (les siennes) | L C M X | L (ses cours) | L C M X (pour un adhérent)  | L C M X | M (décompte du quota) |
| Liste des inscrits à un cours | | L (ses cours) | L | L | |
| Fiches coachs et spécialités | L | L (sa fiche) | L | L C M X | |
| Habilitations des coachs | | L (siennes) | L | L C M X | |
| Disponibilités des coachs | L | L C M (siennes) | L | L C M X | |
| Salles et espaces | L | L | L | L C M X | |
| Catalogue des articles | L | | L | L C M X | |
| Stock des articles | | | L M | L C M | M (mouvements) |
| Achats et prêts (les siens) | L | | L C X | L X | |
| Retours de matériel | | | L C M | L | |
| Factures (les siennes) | L | | L | L | C |

**Notes** : « les siens » désigne les données rattachées à l'utilisateur connecté ; l'accueil et le responsable accèdent à celles de tous les adhérents et le coach n'accède qu'à ses propres cours. Les factures sont créées uniquement par le système (RG37). Tout changement de mot de passe passe par le responsable (RG09). Le système a tous les droits mais ici on précise les actions effectués.