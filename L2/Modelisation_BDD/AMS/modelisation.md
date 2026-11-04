# Modélisation :

Bonjour, voici la modélisation de la base de donnée pour votre entreprise `Elan&Spa`. J'espère que mes propositions seront répondre à vos demandes et je reste à votre disposition pour effectuer des modifications sur ce cahier des charges.

## Entitées :
- Achat
- Article
- Client
- Coach
- Cours_collectif
- Cours_particulier
- Formule
- Historique
- Pret
- Salle

## Squelette :

    Cours_collectif | Coach |
                    | Salle |

    Cours_particulier | Coach  |
                      | Salle  |
                      | Client | Formule |

    Historique |

    Achat |

    Pret |

    Article |

## Dépendances Fonctionnelles:
    
    df1: ...
    

## Dépendances Multivaluées:
    
    dm1: ...

## Arbre de décomposition :

*L'arbre ci dessous est là en tant que placeholder et n'est pas fini*

```mermaid
flowchart TD
    R("R(id_blabla(...),id_blabla(...), id_cours_parto(...), id_cours_parto(...)) {df1, df2}")
    R1["<b>R1</b>(A, B)<br/>✅ 4NF"]
    R2["<b>R2</b>(A, C, D)<br/>❌ Pas en 4NF"]
    R3["<b>R3</b>(C, D)<br/>✅ 4NF"]
    R4["<b>R4</b>(C, A)<br/>✅ 4NF"]

    R -->|"dm1"| R1
    R --> R2
    R2 -->|"C →→ D"| R3
    R2 -->|"C →→ A"| R4
```

## Schéma des tables :

*Le schéma ci dessous est là en tant que placeholder et n'est pas fini*

```mermaid

erDiagram
    USER ||--o{ SUBSCRIPTION : has
    PLAN ||--o{ SUBSCRIPTION : "subscribed via"
    USER ||--o{ WATCH_HISTORY : logs
    EPISODE ||--o{ WATCH_HISTORY : "appears in"
    SHOW ||--|{ EPISODE : contains
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