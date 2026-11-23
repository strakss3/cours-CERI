- javaDoc en fr
- génération du code à partir de quoi ?
- https://mermaid.js.org/syntax/classDiagram.html
- on fait des threads pour le serveur
- le code sert à chiffrer le nom de l'objet pour pas qu'il soit en clair dans les transcriptions
- si on doit transmettre un string, il faut créer un objet contenant un string et implémenter les méthodes

```mermaid
classDiagram

%% + Public
%% - Private
%%  # Protected
%%  ~ Package/Internal

DNO --* DN : compostion
DNO --* objetDuMessage : compostion
interfacePourObjet <|-- objetDuMessage: implémente
ArrayList ()-- DNOL
DNOL --* DNO : composition

namespace Package DNO {
    class interfacePourObjet {
        <<interface>>
        +display() void
        +getObject() Object
        +setObject() void
        +getFrom() String
        +setFrom() void
        +getDets() String
        +setDets() void
    }

    class DNO {
        DN
        objetDuMessage
    }

    class DN {
        nom
        code
    }

    class objetDuMessage {
        +display() void
        +getObject() Object
        +setObject() void
        +getFrom() String
        +setFrom() void
        +getDets() String
        +setDets() void
    }

    class DNOF {
        <<singleton, abstract>>
    }

    class DNOL
}


ClientError <|-- ConnectError
Exception ()-- ClientError
Exception ()-- ServeurError

namespace Package Exception {
    
    class ClientError
    class ConnectError
    class ServeurError
    %% Supprimer un objet que l'on a pas créé
    %% Ajouter un fichier qui n'existe pas
    %% 
}

namespace Package Encodage {
    class cesar
}

class MainClient
class MainServeur

```
