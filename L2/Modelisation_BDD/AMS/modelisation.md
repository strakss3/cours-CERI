# Modélisation :

Bonjour, voici la modélisation de la base de donnée pour votre entreprise **Elan&Spa**. J'espère que mes propositions seront répondre à vos demandes et je reste à votre disposition pour effectuer des modifications sur ce cahier des charges.

## Entitées / attributs isolés:
- Adhérant |
- Article_achat |
- Article_location |
- Coach |
- Cours_collectif |
- Cours_particulier |
- Formule |
- Historique_achat |
- Historique_location |
- habilitation
- quantite_achat
- quantite_locat
- Salle |

*penser à rajouter quelque chose pour le login*

## Squelette :
```
    Historique_achat | Adhérant | Formule |

    Historique_location | Adhérant | Formule |

    Cours_collectif | Salle |
                    | Coach |
    
    Cours_particulier | Salle |
                     | Coach |
                     | Adhérant | Formule |
    
    Article_achat |

    Article_location |

    habilitation
```

## Dépendances Fonctionnelles:

- **df01:** id_adherant -> nom, prenom, adresse, email, RIB, id_formule, date_inscipt, date_modif_formule

- **df02:** id_article_achat -> nom, prix, stock

- **df03:** id_article_locat -> nom, prix, etat, statut

- **df04:** id_coach -> nom, prenom

- **df05:** id_cours_coll -> type_cours, date, creneau, id_coach, id_salle, capacite

- **df06:** id_cours_part -> type_cours, date, creneau, id_coach, id_salle, id_adherant

- **df07:** id_formule -> nom, acces, nbr_cours_coll, nbr_cours_part

- **df08:** id_hist_achat -> id_adherant, date

- **df09:** id_hist_locat -> id_adherant, date_location

- **df10:** id_salle -> nom, type, capacite

## Dépendances Multivaluées:
    
- **dm01:** id_coach ->-> habilitation

- **dm02** id_cours_coll ->-> id_adherant(...)

- **dm03** id_hist_achat ->-> id_article_achat(...), quantite_achat

- **dm04** id_hist_locat ->-> id_article_locat(...), quantite_locat

<div style="page-break-after: always;"></div>

## Arbre de décomposition :

*L'arbre ci dessous n'est pas encore fini... et surtout doit être refait...*

```mermaid
flowchart TD
    R("R(id_hist_achat(...), id_hist_locat(...), id_cours_coll(...), id_cours_part(...), id_article_achat(...), id_article_locat(...), habilitation, quantite_achat, quantite_locat) {df01-df10, dm01-dm04}")
    R1["R1(id_coach, habilitation) { }"]
    R2("R2(id_hist_achat(...), id_hist_locat(...), id_cours_coll(...), id_cours_part(...), id_article_achat(...), id_article_locat(...), quantite_achat, quantite_locat) {df01-df10, dm02-dm04}")
    R3("R3(id_cours_coll, id_adherant(...)) {df01, df07}")
    R4["R4(id_hist_achat(...), id_hist_locat(...), id_cours_coll(...), id_cours_part(...), id_article_achat(...), id_article_locat(...), quantite_achat, quantite_locat) {df01-df10, dm03-dm04}"]
    R5["R5(id_formule, nom, acces, nbr_cours_coll, nbr_cours_part) {df07}"]
    R6("R6(id_cours_coll, id_adherant(...id_formule(-))) {df01}")
    R7["R7(id_adherant, nom, prenom, adresse, email, RIB, id_formule(-), date_inscipt, date_modif_formule) {df01}"]
    R8["R8(id_cours_coll, id_adherant(-)) { }"]
    R9("R9(id_hist_achat, id_article_achat(...), quantite_achat) {df02}")
    R10("R10(id_hist_achat(...), id_hist_locat(...), id_cours_coll(...), id_cours_part(...), id_article_locat(...), quantite_locat) {df01-df10, dm04}")
    R11["R11(id_article_achat, nom, prix, stock) {df02}"]
    R12["R12(id_hist_achat, id_article_achat(-), quantite_achat) { }"]
    R13("R13(id_hist_locat, id_article_locat(...), quantite_locat) {df03}")
    R14("R14(id_hist_achat(...), id_hist_locat(...), id_cours_coll(...), id_cours_part(...)) {df01-df10}")
    R15["R15(id_article_locat, nom, prix, etat, statut) {df03}"]
    R16["R16(id_hist_locat, id_article_locat(-), quantite_locat) { }"]

    R   --> |"dm01"| R1
    R   --> R2
    R2  --> |"dm02"| R3
    R2  --> R4
    R3  --> |"df07"| R5
    R3  --> R6
    R6  --> |"df01"| R7
    R6  --> R8
    R4  --> |"dm03"| R9
    R4  --> R10
    R9  --> |"df02"| R11
    R9  --> R12
    R10 --> |"dm04"| R13
    R10 --> R14
    R13 --> |"df03"| R15
    R13 --> R16
```

<div style="page-break-after: always;"></div>

## Schéma des tables :

*Le schéma ci dessous est là en tant que placeholder*

```mermaid

erDiagram
    USER    ||--o{ SUBSCRIPTION     : has
    PLAN    ||--o{ SUBSCRIPTION     : "subscribed via"
    USER    ||--o{ WATCH_HISTORY    : logs
    EPISODE ||--o{ WATCH_HISTORY    : "appears in"
    SHOW    ||--|{ EPISODE          : contains
    USER {
        string id PK
        string email UK "Used for login"
        string country
    }
    SUBSCRIPTION {
        string id PK
        string userId FK
        string planId FK
        date startedAt
        bool autoRenew
    }
    PLAN {
        string id PK
        string name "Basic, Standard or Premium"
        float monthlyPrice
    }
    SHOW {
        string id PK
        string title
        string genre
    }
    EPISODE {
        string id PK
        string showId FK
        int seasonNumber
        int episodeNumber
    }
    WATCH_HISTORY {
        string userId FK
        string episodeId FK
        date watchedAt
        int secondsWatched
    }
```