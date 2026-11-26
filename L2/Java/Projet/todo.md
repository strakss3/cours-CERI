- javaDoc en fr
- https://mermaid.js.org/syntax/classDiagram.html
- on fait des threads pour le serveur
- le code sert à chiffrer le nom de l'objet pour pas qu'il soit en clair dans les transcriptions
- si on doit transmettre un string, il faut créer un objet contenant un string et implémenter les méthodes

```mermaid
classDiagram
direction RL

%% + Public
%% - Private
%%  # Protected
%%  ~ Package/Internal

DNO --* DN : compostion
DNO --* objetDuMessage : compostion
interfacePourObjet <|-- objetDuMessage: implémente
ArrayList --|> DNOL
ArrayList --|> DNL
DNOL --* DNO : composition
DNL --* DN : composition
Serializable <|-- DNL : implémente
Serializable <|-- DNO : implémente
DNOF --* DNOL : composition

namespace Package DNO {
    class interfacePourObjet {
        <<interface>>
        +display() void
        +getObject() Object
        +setObject() void
        +getFrom() String
        +setFrom() void
        +getDest() String
        +setDest() void
    }

    class DNO {
        DN
        objetDuMessage
    }

    class DN {
        nom
        code
    }

    class DNL {
        indexOf(String) int 
    }

    class objetDuMessage {
        -object
        -from
        -dets
        +display() void
        +getObject() Object
        +setObject() void
        +getFrom() String
        +setFrom() void
        +getDets() String
        +setDets() void
    }

    class DNOF {
        <<singleton>>
        Instance
        DNOL
        getInstace()
        createDNO(type, object, objectName) DNO
        createDNOString(object, objectName) DNO
        createDNOFile(object, objectName) DNO
        getDNO(String code) DNO
    }

    class DNOL {
        generateDNL() ArrayList < DN >
        remove(String objectName) void
    }
    
    class ArrayList

    class Serializable {
        <<Interface>>
    }
}
```

```mermaid
classDiagram
direction RL

InterfaceEncodage <|-- cesar : implémente
InterfaceEncodage <|-- vigenere : implémente

namespace Package Encodage {
    class InterfaceEncodage {
        <<Interface>>
        getCodeFromName()
        getNameFromCode()
    }

    class cesar {
        nombre
        getNameFromCode()
        getCodeFromName()
    }

    class vigenere {
        mot
        getNameFromCode()
        getCodeFromName()
    }
}
```

```mermaid
classDiagram

class MainClient {
    DNOF
    clientName
    +connect() void
    +add() void
    +file() void
    +del() void
    +list() void
    +display() void
    +get() void
    +private() void
    +main() void
}
class MainServer {
    HashMap < hashedName, Pair< socket, DNL >>
    +main() void
}
```

```mermaid
classDiagram
direction RL

ClientError --|> LoginError
ClientError --|> SyntaxError
ClientError --|> DataError
Exception --|> ClientError
Exception --|> ServerError

namespace Package Exception {
    
    class Exception
    
    class ClientError
    class LoginError
    %% N'arrive pas a se connecter au serveur
    %% Nom de client existe déjà
    class SyntaxError
    %% Mauvaise syntaxe de commande (client)
    class DataError
    %% Creation d'objet avec un nom déjà existant
    %% Ajouter un fichier qui n'existe pas
    %% Supprimer un objet que l'on a pas créé
    %% Cloner un DNOF

    class ServerError
    %% Faire un GET sur une personne qui n'existe pas
    %% Faire un GET sur un code qui n'existe pas
}
```