CREATE TABLE Acces (
    type_acces                      VARCHAR(256) PRIMARY KEY,
    fiche_adherant                  INT NOT NULL,
    coordonnees_bancaires           INT NOT NULL,
    logins_coachs_acceuils          INT NOT NULL,
    historique_cours                INT NOT NULL,
    changement_formule              INT NOT NULL,
    desinscription_adherant         INT NOT NULL,
    coordonnees_adherant_desinscrit INT NOT NULL,
    formules_tarifs                 INT NOT NULL,
    planning_cours_coll             INT NOT NULL,
    reservation_perso               INT NOT NULL,
    liste_inscrits_cours            INT NOT NULL,
    fiches_coachs                   INT NOT NULL,
    habilitations_coachs            INT NOT NULL,
    disponibilites_coachs           INT NOT NULL,
    salles_espaces                  INT NOT NULL,
    catalogue_articles              INT NOT NULL,
    stock_articles                  INT NOT NULL,
    historique_achats_prets         INT NOT NULL,
    retours_articles                INT NOT NULL,
    factures                        INT NOT NULL
);

CREATE TABLE Login (
    identifiant VARCHAR(256) PRIMARY KEY,
    password    VARCHAR(256) NOT NULL,
    type_acces  VARCHAR(256)  NOT NULL,
    CONSTRAINT fk_login_acces
        FOREIGN KEY (type_acces) REFERENCES Acces (type_acces)
);

CREATE TABLE Formule (
    id_formule     INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom            VARCHAR(256)  NOT NULL,
    acces          VARCHAR(256) NOT NULL,
    nbr_cours_coll INT NOT NULL,
    nbr_cours_part INT NOT NULL,
    CONSTRAINT uq_formule_nom UNIQUE (nom),
    CONSTRAINT ck_formule_quota_coll CHECK (nbr_cours_coll >= 0),
    CONSTRAINT ck_formule_quota_part CHECK (nbr_cours_part >= 0)
);

CREATE TABLE Adherant (
    id_adherant         INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom                 VARCHAR(256),
    prenom              VARCHAR(256),
    adresse             VARCHAR(256),
    email               VARCHAR(256),
    RIB                 VARCHAR(256),
    id_formule          INT  NOT NULL,
    date_insciptn       DATE NOT NULL,
    date_desinscription DATE,
    date_modif_formule  DATE,
    CONSTRAINT fk_adherant_formule
        FOREIGN KEY (id_formule) REFERENCES Formule (id_formule),
    CONSTRAINT uq_adherant_email UNIQUE (email),
    CONSTRAINT fk_adherant_login
        FOREIGN KEY (email) REFERENCES Login (identifiant),
    CONSTRAINT ck_adherant_dates
        CHECK (date_desinscription IS NULL
               OR date_desinscription >= date_insciptn)
);

CREATE TABLE Coach (
    id_coach VARCHAR(256) PRIMARY KEY,
    nom      VARCHAR(256) NOT NULL,
    prenom   VARCHAR(256) NOT NULL,
    CONSTRAINT fk_coach_login
        FOREIGN KEY (id_coach) REFERENCES Login (identifiant)
);

CREATE TABLE Habilitation_coach (
    id_coach     VARCHAR(256) NOT NULL,
    habilitation VARCHAR(256)  NOT NULL,
    PRIMARY KEY (id_coach, habilitation),
    CONSTRAINT fk_habilitation_coach
        FOREIGN KEY (id_coach) REFERENCES Coach (id_coach)
);

CREATE TABLE Salle (
    id_salle INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom      VARCHAR(256) NOT NULL,
    type     VARCHAR(256)  NOT NULL,
    capacite INT NOT NULL,
    CONSTRAINT ck_salle_capacite CHECK (capacite > 0)
);

CREATE TABLE Cours (
    id_cours   INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    type_cours VARCHAR(50) NOT NULL,
    date       DATE NOT NULL,
    creneau    INT  NOT NULL,
    id_coach   VARCHAR(256) NOT NULL,
    id_salle   INT  NOT NULL,
    capacite   INT  NOT NULL,
    prix       NUMERIC(8,2) NOT NULL,
    CONSTRAINT fk_cours_coach
        FOREIGN KEY (id_coach) REFERENCES Coach (id_coach),
    CONSTRAINT fk_cours_salle
        FOREIGN KEY (id_salle) REFERENCES Salle (id_salle),
    CONSTRAINT ck_cours_creneau  CHECK (creneau BETWEEN 8 AND 19),
    CONSTRAINT ck_cours_capacite CHECK (capacite > 0),
    CONSTRAINT ck_cours_prix     CHECK (prix >= 0),
    CONSTRAINT uq_cours_coach_creneau UNIQUE (id_coach, date, creneau)
);

CREATE TABLE Reservation_cours (
    id_cours    INT NOT NULL,
    id_adherant INT NOT NULL,
    PRIMARY KEY (id_cours, id_adherant),
    CONSTRAINT fk_reservation_cours
        FOREIGN KEY (id_cours) REFERENCES Cours (id_cours),
    CONSTRAINT fk_reservation_adherant
        FOREIGN KEY (id_adherant) REFERENCES Adherant (id_adherant)
);

CREATE TABLE Facture (
    id_facture  INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_adherant INT  NOT NULL,
    date        DATE NOT NULL,
    CONSTRAINT fk_facture_adherant
        FOREIGN KEY (id_adherant) REFERENCES Adherant (id_adherant),
    CONSTRAINT uq_facture_adherant_date UNIQUE (id_adherant, date)
);

CREATE TABLE Facture_cours (
    id_facture INT NOT NULL,
    id_cours   INT NOT NULL,
    PRIMARY KEY (id_facture, id_cours),
    CONSTRAINT fk_facture_cours_facture
        FOREIGN KEY (id_facture) REFERENCES Facture (id_facture),
    CONSTRAINT fk_facture_cours_cours
        FOREIGN KEY (id_cours) REFERENCES Cours (id_cours)
);

CREATE TABLE Article_achat (
    id_article_achat INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom              VARCHAR(256) NOT NULL,
    prix             NUMERIC(5,2) NOT NULL,
    stock            INT NOT NULL,
    CONSTRAINT ck_article_achat_prix  CHECK (prix >= 0),
    CONSTRAINT ck_article_achat_stock CHECK (stock >= 0)
);

CREATE TABLE Historique_achat (
    id_hist_achat INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_adherant   INT  NOT NULL,
    date          DATE NOT NULL,
    CONSTRAINT fk_hist_achat_adherant
        FOREIGN KEY (id_adherant) REFERENCES Adherant (id_adherant)
);

CREATE TABLE Facture_achat (
    id_facture    INT NOT NULL,
    id_hist_achat INT NOT NULL,
    PRIMARY KEY (id_facture, id_hist_achat),
    CONSTRAINT fk_facture_achat_facture
        FOREIGN KEY (id_facture) REFERENCES Facture (id_facture),
    CONSTRAINT fk_facture_achat_hist
        FOREIGN KEY (id_hist_achat) REFERENCES Historique_achat (id_hist_achat)
);

CREATE TABLE Historique_article_achat (
    id_hist_achat    INT NOT NULL,
    id_article_achat INT NOT NULL,
    quantite_achat   INT NOT NULL,
    PRIMARY KEY (id_hist_achat, id_article_achat),
    CONSTRAINT fk_hist_article_achat_hist
        FOREIGN KEY (id_hist_achat) REFERENCES Historique_achat (id_hist_achat),
    CONSTRAINT fk_hist_article_achat_article
        FOREIGN KEY (id_article_achat) REFERENCES Article_achat (id_article_achat),
    CONSTRAINT ck_hist_article_achat_quantite CHECK (quantite_achat > 0)
);

CREATE TABLE Article_location (
    id_article_locat INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom              VARCHAR(256) NOT NULL,
    prix             NUMERIC(5,2) NOT NULL,
    etat             VARCHAR(256)  NOT NULL,
    CONSTRAINT ck_article_location_prix CHECK (prix >= 0)
);

CREATE TABLE Historique_location (
    id_hist_locat INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_adherant   INT  NOT NULL,
    date_location DATE NOT NULL,
    date_rendu    DATE,
    CONSTRAINT fk_hist_location_adherant
        FOREIGN KEY (id_adherant) REFERENCES Adherant (id_adherant),
    CONSTRAINT ck_hist_location_dates
        CHECK (date_rendu IS NULL OR date_rendu >= date_location)
);

CREATE TABLE Facture_location (
    id_facture    INT NOT NULL,
    id_hist_locat INT NOT NULL,
    PRIMARY KEY (id_facture, id_hist_locat),
    CONSTRAINT fk_facture_location_facture
        FOREIGN KEY (id_facture) REFERENCES Facture (id_facture),
    CONSTRAINT fk_facture_location_hist
        FOREIGN KEY (id_hist_locat) REFERENCES Historique_location (id_hist_locat)
);

CREATE TABLE Historique_article_location (
    id_hist_locat    INT NOT NULL,
    id_article_locat INT NOT NULL,
    PRIMARY KEY (id_hist_locat, id_article_locat),
    CONSTRAINT fk_hist_article_location_hist
        FOREIGN KEY (id_hist_locat) REFERENCES Historique_location (id_hist_locat),
    CONSTRAINT fk_hist_article_location_article
        FOREIGN KEY (id_article_locat) REFERENCES Article_location (id_article_locat)
);