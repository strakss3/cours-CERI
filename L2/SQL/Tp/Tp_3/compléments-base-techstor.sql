### Requetes `INSERT INTO` de régularisation



-- =================================================================
-- 1. RAJOUT DE PRODUITS EN RUPTURE DE STOCK (stock = 0)
-- Permet de répondre à la Question 1 de la Partie 1 du TD1
-- =================================================================

INSERT INTO TechStor_Produits (id_produit, nom, prix_unitaire, categorie, stock) VALUES
(121, 'Webcam 4K UltraHD', 129.99, 'Périphérique', 0),
(122, 'Écran OLED 32 pouces', 699.00, 'Moniteur', 0);

-- =================================================================
-- 2. DÉTAILS DE COMMANDES POUR JEAN DUPONT (id_client = 501)
-- Permet de répondre à la Question 2 de la Partie 2 du TD1
-- =================================================================

INSERT INTO TechStor_LignesCommande (id_ligne, id_commande, id_produit, quantite, prix_unitaire) VALUES
-- Commande 3107 (10/02/2024)
(337, 3107, 103, 1, 199.99), -- Écran 24 pouces
(338, 3107, 118, 1, 49.99),  -- Batterie externe

-- Commande 3109 (22/06/2024)
(339, 3109, 109, 1, 89.90),  -- Routeur Wi-Fi
(340, 3109, 111, 1, 24.90),  -- Clé USB 64Go

-- Commande 3211 (10/02/2025)
(341, 3211, 114, 1, 279.99), -- Écran 27 pouces

-- Commande 3213 (15/08/2025)
(342, 3213, 103, 1, 199.99), -- Écran 24 pouces
(343, 3213, 101, 1, 89.99),  -- Clavier mécanique
(344, 3213, 111, 2, 24.90),  -- Clé USB 64Go x2

-- Commande 3307 (15/01/2026)
(345, 3307, 103, 1, 199.99); -- Écran 24 pouces

-- =================================================================
-- 3. DÉTAILS DES COMMANDES DE LYON T2 2026 (Mai/Juin 2026 et > 500€)
-- Permet de répondre à la Q3 Partie 1 et au BONUS du TD1 (Enquête Lyon Mai 2026)
-- =================================================================

INSERT INTO TechStor_LignesCommande (id_ligne, id_commande, id_produit, quantite, prix_unitaire) VALUES
-- Commande 3305 (Lyon - 12/05/2026 - 600.00€)
(346, 3305, 114, 1, 279.99), -- Écran 27 pouces
(347, 3305, 103, 1, 199.99), -- Écran 24 pouces
(348, 3305, 105, 1, 119.99), -- SSD 500Go

-- Commande 3306 (Lyon - 25/06/2026 - 550.00€)
(349, 3306, 114, 1, 279.99), -- Écran 27 pouces
(350, 3306, 112, 2, 79.99),  -- Enceinte Bluetooth x2
(351, 3306, 101, 1, 89.99);  -- Clavier mécanique

-- =================================================================
-- 4. DÉTAILS DES AUTRES COMMANDES HORS-LYON (2024 - 2026)
-- Permet d'assurer la cohérence globale pour la Partie 3 (Agrégations & CA par catégorie)
-- =================================================================

INSERT INTO TechStor_LignesCommande (id_ligne, id_commande, id_produit, quantite, prix_unitaire) VALUES
-- Commandes 2024 (3108, 3110, 3111, 3112, 3113)
(352, 3108, 114, 1, 279.99),
(353, 3108, 119, 1, 39.99),
(354, 3110, 103, 1, 199.99),
(355, 3111, 104, 1, 79.90),
(356, 3112, 117, 2, 14.99),
(357, 3113, 108, 1, 189.00),

-- Commandes 2025 (3212, 3214, 3215, 3216, 3217, 3218, 3219)
(358, 3212, 108, 1, 189.00),
(359, 3214, 103, 1, 199.99),
(360, 3215, 104, 2, 79.90),
(361, 3216, 107, 2, 69.90),
(362, 3217, 105, 2, 119.99),
(363, 3218, 114, 1, 279.99),
(364, 3219, 103, 1, 199.99),

-- Commandes 2026 (3304, 3308, 3309, 3310, 3311, 3312)
(365, 3304, 114, 1, 279.99),
(366, 3304, 105, 1, 119.99),
(367, 3308, 114, 1, 279.99),
(368, 3309, 108, 1, 189.00),
(369, 3310, 103, 1, 199.99),
(370, 3311, 104, 2, 79.90),
(371, 3312, 105, 1, 119.99);


-- 1. Ajout des fournisseurs
CREATE TABLE TechStor_Fournisseurs (
    id_fournisseur SERIAL PRIMARY KEY,
    nom_fournisseur VARCHAR(100) NOT NULL,
    pays VARCHAR(50) NOT NULL,
    contact_email VARCHAR(100)
);

-- 2. Modification de la table Produits (prix d'achat & fournisseur)
ALTER TABLE TechStor_Produits 
    ADD COLUMN prix_achat DECIMAL(10, 2),
    ADD COLUMN id_fournisseur INTEGER REFERENCES TechStor_Fournisseurs(id_fournisseur);

-- 3. Modification de la table Clients (catégorie de fidélité)
ALTER TABLE TechStor_Clients 
    ADD COLUMN statut_fidelite VARCHAR(20) DEFAULT 'Standard'; -- 'Standard', 'Silver', 'Gold', 'VIP'

-- 4. Grille de réduction théorique par statut et catégorie de produit
CREATE TABLE TechStor_GrilleFidelite (
    statut_fidelite VARCHAR(20) NOT NULL,
    categorie VARCHAR(50) NOT NULL,
    remise_max_pct DECIMAL(5, 2) NOT NULL,
    PRIMARY KEY (statut_fidelite, categorie)
);

-- 5. Modification de LignesCommande pour enregistrer la remise réellement accordée
ALTER TABLE TechStor_LignesCommande 
    ADD COLUMN remise_pct DECIMAL(5, 2) DEFAULT 0.00;

-- 6. Table du Service Après-Vente (SAV / Retours)
CREATE TABLE TechStor_SAV (
    id_retour SERIAL PRIMARY KEY,
    id_commande INTEGER NOT NULL REFERENCES TechStor_Commandes(id_commande),
    id_produit INTEGER NOT NULL REFERENCES TechStor_Produits(id_produit),
    date_retour DATE NOT NULL,
    motif_retour TEXT NOT NULL,
    statut_traitement VARCHAR(30) NOT NULL -- 'Remboursé', 'Échangé', 'En cours'
);




--    


-- ============================================================
-- DONNÉES POUR LE TP2
-- ============================================================


-- ============================================================
-- 1. FOURNISSEURS
-- ============================================================

INSERT INTO TechStor_Fournisseurs
    (id_fournisseur, nom_fournisseur, pays, contact_email)
VALUES
    (1, 'TechImport Asia', 'Chine', 'contact@techimport-asia.com'),
    (2, 'EuroComp', 'Allemagne', 'contact@eurocomp.de'),
    (3, 'FranceTech', 'France', 'contact@francetech.fr'),
    (4, 'OfficePlus', 'France', 'contact@officeplus.fr'),
    (5, 'NetSystems', 'Pays-Bas', 'contact@netsystems.nl');


-- ============================================================
-- 2. PRIX D'ACHAT ET FOURNISSEURS DES PRODUITS
-- ============================================================

UPDATE TechStor_Produits
SET prix_achat = 55.00, id_fournisseur = 2
WHERE id_produit = 101;

UPDATE TechStor_Produits
SET prix_achat = 27.00, id_fournisseur = 3
WHERE id_produit = 102;

UPDATE TechStor_Produits
SET prix_achat = 125.00, id_fournisseur = 1
WHERE id_produit = 103;

UPDATE TechStor_Produits
SET prix_achat = 48.00, id_fournisseur = 2
WHERE id_produit = 104;

UPDATE TechStor_Produits
SET prix_achat = 72.00, id_fournisseur = 1
WHERE id_produit = 105;

UPDATE TechStor_Produits
SET prix_achat = 32.00, id_fournisseur = 3
WHERE id_produit = 106;

UPDATE TechStor_Produits
SET prix_achat = 42.00, id_fournisseur = 1
WHERE id_produit = 107;

UPDATE TechStor_Produits
SET prix_achat = 125.00, id_fournisseur = 4
WHERE id_produit = 108;

UPDATE TechStor_Produits
SET prix_achat = 52.00, id_fournisseur = 2
WHERE id_produit = 109;

UPDATE TechStor_Produits
SET prix_achat = 5.50, id_fournisseur = 5
WHERE id_produit = 110;

UPDATE TechStor_Produits
SET prix_achat = 12.00, id_fournisseur = 3
WHERE id_produit = 111;

UPDATE TechStor_Produits
SET prix_achat = 45.00, id_fournisseur = 2
WHERE id_produit = 112;

UPDATE TechStor_Produits
SET prix_achat = 35.00, id_fournisseur = 5
WHERE id_produit = 113;

UPDATE TechStor_Produits
SET prix_achat = 185.00, id_fournisseur = 1
WHERE id_produit = 114;

UPDATE TechStor_Produits
SET prix_achat = 3.50, id_fournisseur = 4
WHERE id_produit = 115;

UPDATE TechStor_Produits
SET prix_achat = 1.80, id_fournisseur = 4
WHERE id_produit = 116;

UPDATE TechStor_Produits
SET prix_achat = 7.00, id_fournisseur = 5
WHERE id_produit = 117;

UPDATE TechStor_Produits
SET prix_achat = 25.00, id_fournisseur = 3
WHERE id_produit = 118;

UPDATE TechStor_Produits
SET prix_achat = 22.00, id_fournisseur = 5
WHERE id_produit = 119;

UPDATE TechStor_Produits
SET prix_achat = 20.00, id_fournisseur = 4
WHERE id_produit = 120;

UPDATE TechStor_Produits
SET prix_achat = 78.00, id_fournisseur = 1
WHERE id_produit = 121;

UPDATE TechStor_Produits
SET prix_achat = 490.00, id_fournisseur = 1
WHERE id_produit = 122;


-- ============================================================
-- 3. STATUT DE FIDÉLITÉ DES CLIENTS
-- ============================================================

UPDATE TechStor_Clients
SET statut_fidelite = 'Gold'
WHERE id_client IN (501, 505, 509);

UPDATE TechStor_Clients
SET statut_fidelite = 'Silver'
WHERE id_client IN (502, 506);

UPDATE TechStor_Clients
SET statut_fidelite = 'VIP'
WHERE id_client IN (504, 510);

UPDATE TechStor_Clients
SET statut_fidelite = 'Standard'
WHERE id_client IN (503, 507, 508);


-- ============================================================
-- 4. GRILLE DES REMISES AUTORISÉES
-- ============================================================

INSERT INTO TechStor_GrilleFidelite
    (statut_fidelite, categorie, remise_max_pct)
VALUES
    ('Standard', 'Périphérique', 5.00),
    ('Standard', 'Moniteur', 5.00),
    ('Standard', 'Stockage', 5.00),
    ('Standard', 'Audio', 5.00),
    ('Standard', 'Impression', 5.00),
    ('Standard', 'Réseau', 5.00),
    ('Standard', 'Accessoire', 5.00),
    ('Standard', 'Bureautique', 5.00),

    ('Silver', 'Périphérique', 8.00),
    ('Silver', 'Moniteur', 8.00),
    ('Silver', 'Stockage', 8.00),
    ('Silver', 'Audio', 8.00),
    ('Silver', 'Impression', 8.00),
    ('Silver', 'Réseau', 8.00),
    ('Silver', 'Accessoire', 8.00),
    ('Silver', 'Bureautique', 8.00),

    ('Gold', 'Périphérique', 12.00),
    ('Gold', 'Moniteur', 12.00),
    ('Gold', 'Stockage', 12.00),
    ('Gold', 'Audio', 12.00),
    ('Gold', 'Impression', 12.00),
    ('Gold', 'Réseau', 12.00),
    ('Gold', 'Accessoire', 12.00),
    ('Gold', 'Bureautique', 12.00),

    ('VIP', 'Périphérique', 18.00),
    ('VIP', 'Moniteur', 18.00),
    ('VIP', 'Stockage', 18.00),
    ('VIP', 'Audio', 18.00),
    ('VIP', 'Impression', 18.00),
    ('VIP', 'Réseau', 18.00),
    ('VIP', 'Accessoire', 18.00),
    ('VIP', 'Bureautique', 18.00);


-- ============================================================
-- 5. REMISES APPLIQUÉES
-- ============================================================

-- Par défaut, aucune remise
UPDATE TechStor_LignesCommande
SET remise_pct = 0.00;


-- Quelques remises normales
UPDATE TechStor_LignesCommande
SET remise_pct = 5.00
WHERE id_ligne IN (303, 306, 311, 314, 319, 324, 328);

UPDATE TechStor_LignesCommande
SET remise_pct = 8.00
WHERE id_ligne IN (320, 325, 329, 332, 335);

UPDATE TechStor_LignesCommande
SET remise_pct = 10.00
WHERE id_ligne IN (321, 322, 326, 327, 330, 331, 333, 336);


-- Quelques remises anormalement élevées
-- Elles serviront à l'enquête.

UPDATE TechStor_LignesCommande
SET remise_pct = 15.00
WHERE id_ligne = 359;

UPDATE TechStor_LignesCommande
SET remise_pct = 20.00
WHERE id_ligne = 361;

UPDATE TechStor_LignesCommande
SET remise_pct = 18.00
WHERE id_ligne = 327;

UPDATE TechStor_LignesCommande
SET remise_pct = 25.00
WHERE id_ligne = 326;

UPDATE TechStor_LignesCommande
SET remise_pct = 20.00
WHERE id_ligne = 331;

UPDATE TechStor_LignesCommande
SET remise_pct = 16.00
WHERE id_ligne = 334;


-- ============================================================
-- 6. RETOURS SAV
-- ============================================================

INSERT INTO TechStor_SAV
    (id_retour, id_commande, id_produit, date_retour,
     motif_retour, statut_traitement)
VALUES

    -- Moniteurs
    (1, 3103, 103, '2024-06-02',
     'Pixels défectueux', 'Échangé'),

    (2, 3108, 114, '2024-05-02',
     'Problème d’affichage', 'Remboursé'),

    (3, 3214, 103, '2025-04-20',
     'Extinction de l’écran', 'Échangé'),

    (4, 3218, 114, '2025-07-28',
     'Bandes verticales', 'En cours'),

    (5, 3304, 114, '2026-04-18',
     'Problème de rétroéclairage', 'Échangé'),

    (6, 3305, 103, '2026-05-25',
     'Pixels morts', 'Remboursé'),


    -- Stockage
    (7, 3106, 105, '2024-12-10',
     'SSD non reconnu', 'Échangé'),

    (8, 3217, 105, '2025-10-25',
     'Débit anormalement faible', 'En cours'),

    (9, 3301, 105, '2026-01-25',
     'SSD défaillant', 'Échangé'),


    -- Périphériques
    (10, 3102, 101, '2024-04-03',
     'Touches du clavier défectueuses', 'Remboursé'),

    (11, 3207, 107, '2025-11-25',
     'Webcam non détectée', 'Échangé'),

    (12, 3216, 107, '2025-06-01',
     'Coupures d’image', 'Échangé'),


    -- Audio
    (13, 3207, 112, '2025-12-05',
     'Coupures audio', 'En cours'),


    -- Réseau
    (14, 3205, 109, '2025-10-01',
     'Déconnexions répétées', 'Échangé'),


    -- Stockage supplémentaire
    (15, 3111, 104, '2024-09-01',
     'Disque dur instable', 'Remboursé');
