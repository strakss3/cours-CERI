/* Exo 1.1 :
    ALTER TABLE ADRMAIL
    ADD ADR VARCHAR(100)
    */

/* Exo 1.2 :
    CREATE TABLE ADRFROM (
        idFROM int PRIMARY KEY,
        TXT VARCHAR(255),
        CAT VARCHAR(100)
    );

    CREATE TABLE CO_FROM (
        idCO int,
        idFROM int,
        PRIMARY KEY(idCO, idFROM),
        CONSTRAINT fk_idCO FOREIGN KEY(idCo) REFERENCES CONTRAT(idCO),
        CONSTRAINT fk_idFROM FOREIGN KEY(idFROM) REFERENCES ADRFROM(idFROM)
    )
    */

/* Exo 2.1 :
    INSERT INTO CONTRAT (IdCO, IdCLI, IdOBJ, TXT, TYP, CATFROM) VALUES
    (21, 3, 7, 'Recevez immédiatement votre remboursement de 750 euros. Cliquez ici pour valider.', '2M-valide', 'banque')
    */

/* Exo 2.2 :
    INSERT INTO CO_FROM (IdCO, IdFROM) VALUES
    (21, 3), (21, 7), (21, 11);

    INSERT INTO CO_DISTRA (IdCO, IdDISTRA) VALUES
    (21, 1), (21, 2), (21, 3);

    INSERT INTO CO_ADR (IdCO, IdADR) VALUES
    (21, 11), (21, 12), (21, 13), (21, 14), (21, 15);
    */

/* Exo 3.1 : 
    SELECT ADRFROM.idFROM, ADRFROM.TXT, ADRFROM.CAT
    FROM contrat
    JOIN client USING(idCli)
    JOIN CO_FROM USING(idco)
    JOIN ADRFROM USING(idFROM)
    WHERE client.nom = 'Bernard Corp' AND contrat.idco = 21;
    */

/* Exo 3.2 :
    SELECT IdDISTRA, TXT, SOURCE, COUNT(idco)
    FROM CO_DISTRA
    JOIN DISTRA USING(IdDISTRA)
    GROUP BY IdDISTRA, TXT, SOURCE
    HAVING COUNT(idco) >= ALL(
        SELECT COUNT(idco)
        FROM CO_DISTRA
        GROUP BY IdDISTRA
    )
    */

/* Exo 3.3 :
    SELECT client.nom, ADRFROM.idFROM, ADRFROM.TXT, ADRFROM.CAT
    FROM client
    JOIN CONTRAT USING(idcli)
    JOIN CO_FROM USING(idco)
    JOIN ADRFROM USING(IdFROM)
    GROUP BY client.nom, ADRFROM.idFROM
    ORDER BY client.nom, ADRFROM.idFROM
    */

/* Exo 3.4 :
    SELECT nom, COUNT(idco)
    FROM contrat
    JOIN client USING(idcli)
    GROUP BY idcli, nom
    HAVING COUNT(idco) >= ALL(
        SELECT COUNT(idco)
        FROM contrat
        GROUP BY idcli
    )
    */