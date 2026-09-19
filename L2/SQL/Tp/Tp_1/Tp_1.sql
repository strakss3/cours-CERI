-- Table Clients
CREATE TABLE TechStor_Clients (
    id_client SERIAL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    ville VARCHAR(50) NOT NULL,
    date_inscription DATE NOT NULL
);

-- Table Produits
CREATE TABLE TechStor_Produits (
    id_produit SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prix_unitaire DECIMAL(10, 2) NOT NULL,
    categorie VARCHAR(50) NOT NULL,
    stock INTEGER NOT NULL
);

-- Table Vendeurs
CREATE TABLE TechStor_Vendeur (
    id_vendeur SERIAL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    date_embauche DATE NOT NULL
);

-- Table Commandes (avec clé étrangère vers Clients et Vendeur)
CREATE TABLE TechStor_Commandes (
    id_commande SERIAL PRIMARY KEY,
    id_client INTEGER NOT NULL,
    id_vendeur INTEGER NOT NULL,
    date_commande DATE NOT NULL,
    montant_total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_client) REFERENCES TechStor_Clients(id_client) ON DELETE CASCADE,
    FOREIGN KEY (id_vendeur) REFERENCES TechStor_Vendeur(id_vendeur) ON DELETE CASCADE
);

-- Table LignesCommande (avec clés étrangères vers Commandes et Produits)
CREATE TABLE TechStor_LignesCommande (
    id_ligne SERIAL PRIMARY KEY,
    id_commande INTEGER NOT NULL,
    id_produit INTEGER NOT NULL,
    quantite INTEGER NOT NULL,
    prix_unitaire DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_commande) REFERENCES TechStor_Commandes(id_commande) ON DELETE CASCADE,
    FOREIGN KEY (id_produit) REFERENCES TechStor_Produits(id_produit) ON DELETE CASCADE
);


-----------

INSERT INTO TechStor_Clients (id_client, nom, prenom, ville, date_inscription) VALUES
(501, 'Dupont', 'Jean', 'Paris', '2023-05-15'),
(502, 'Martin', 'Sophie', 'Lyon', '2024-01-20'),  -- Client lyonnais 1
(503, 'Bernard', 'Luc', 'Marseille', '2025-02-10'),
(504, 'Durand', 'Élodie', 'Paris', '2025-07-05'),
(505, 'Moreau', 'Pierre', 'Lyon', '2026-03-18'),  -- Client lyonnais 2
(506, 'Lefèvre', 'Camille', 'Bordeaux', '2024-11-30'),
(507, 'Girard', 'Thomas', 'Toulouse', '2025-09-12'),
(508, 'Roux', 'Anaïs', 'Lille', '2026-01-25'),
(509, 'Blanc', 'Julien', 'Nantes', '2023-12-03'),
(510, 'Fontaine', 'Clara', 'Strasbourg', '2025-05-14');


-----------

INSERT INTO TechStor_Produits (id_produit, nom, prix_unitaire, categorie, stock) VALUES
(101, 'Clavier mécanique', 89.99, 'Périphérique', 50),
(102, 'Souris sans fil', 45.50, 'Périphérique', 120),
(103, 'Écran 24 pouces', 199.99, 'Moniteur', 30),
(104, 'Disque dur 1To', 79.90, 'Stockage', 80),
(105, 'SSD 500Go', 119.99, 'Stockage', 45),
(106, 'Casque audio', 59.99, 'Audio', 60),
(107, 'Webcam HD', 69.90, 'Périphérique', 25),
(108, 'Imprimante laser', 189.00, 'Impression', 15),
(109, 'Routeur Wi-Fi', 89.90, 'Réseau', 35),
(110, 'Câble HDMI 2m', 12.99, 'Accessoire', 200),
(111, 'Clé USB 64Go', 24.90, 'Stockage', 150),
(112, 'Enceinte Bluetooth', 79.99, 'Audio', 40),
(113, 'Souris gamer', 59.99, 'Périphérique', 20),
(114, 'Écran 27 pouces', 279.99, 'Moniteur', 10),
(115, 'Carnet de notes', 9.99, 'Bureautique', 300),
(116, 'Stylo ergonomique', 5.99, 'Bureautique', 500),
(117, 'Tapis de souris', 14.99, 'Accessoire', 75),
(118, 'Batterie externe', 49.99, 'Accessoire', 50),
(119, 'Haut-parleur PC', 39.99, 'Audio', 30),
(120, 'Sacoche ordinateur', 35.99, 'Accessoire', 25);

------------

INSERT INTO TechStor_Vendeur (id_vendeur, nom, prenom, date_embauche) VALUES
(1, 'Leroy', 'Marc', '2022-05-10'),      -- Vendeur ancien
(2, 'Dubois', 'Céline', '2023-01-15'),    -- Vendeur ancien
(3, 'Petit', 'Antoine', '2023-07-22'),   -- Vendeur ancien
(4, 'Moreau', 'Émilie', '2024-03-10'),    -- Vendeur ancien
(5, 'Bernard', 'Sophie', '2025-09-05');   -- NOUVEAU VENDEUR (lié à la hausse Lyon)


-----------

INSERT INTO TechStor_Commandes (id_commande, id_client, id_vendeur, date_commande, montant_total) VALUES
-- Lyon 2024 (vendeurs 1, 2, 3)
(3101, 502, 1, '2024-01-15', 120.00),
(3102, 502, 2, '2024-03-20', 89.99),
(3103, 505, 3, '2024-05-10', 210.50),
(3104, 502, 1, '2024-07-05', 150.00),
(3105, 505, 2, '2024-09-12', 99.99),
(3106, 502, 3, '2024-11-30', 180.75),
-- Autres villes 2024
(3107, 501, 1, '2024-02-10', 250.00),
(3108, 504, 2, '2024-04-18', 320.00),
(3109, 501, 3, '2024-06-22', 110.50),
(3110, 503, 1, '2024-03-05', 199.99),
(3111, 503, 2, '2024-08-15', 79.90),
(3112, 506, 3, '2024-05-20', 140.00),
(3113, 506, 1, '2024-10-10', 220.00);

---------

INSERT INTO TechStor_Commandes (id_commande, id_client, id_vendeur, date_commande, montant_total) VALUES
-- Lyon 2025 (avant novembre : vendeurs 2, 3)
(3201, 502, 2, '2025-01-20', 145.50),
(3202, 505, 3, '2025-03-15', 200.00),
(3203, 502, 2, '2025-05-10', 99.99),
(3204, 505, 3, '2025-07-05', 310.00),
(3205, 502, 2, '2025-09-18', 160.75),
-- Lyon 2025 (à partir de novembre : Sophie Bernard - id_vendeur=5)
(3206, 505, 5, '2025-11-05', 450.00),  -- Première commande après son embauche
(3207, 502, 5, '2025-11-12', 620.50),
(3208, 505, 5, '2025-11-20', 380.00),
(3209, 502, 5, '2025-12-01', 510.75),
(3210, 505, 5, '2025-12-15', 720.00),
-- Autres villes 2025
(3211, 501, 1, '2025-02-10', 280.00),
(3212, 504, 4, '2025-06-20', 190.50),
(3213, 501, 3, '2025-08-15', 350.00),
(3214, 503, 2, '2025-04-05', 220.00),
(3215, 503, 4, '2025-09-10', 180.75),
(3216, 506, 1, '2025-05-20', 170.00),
(3217, 506, 3, '2025-10-10', 240.50),
(3218, 507, 4, '2025-07-15', 300.00),
(3219, 507, 2, '2025-11-05', 210.00);

---------

INSERT INTO TechStor_Commandes (id_commande, id_client, id_vendeur, date_commande, montant_total) VALUES
-- Lyon 2026 (toujours Sophie Bernard)
(3301, 505, 5, '2026-01-10', 580.00),
(3302, 502, 5, '2026-02-15', 420.50),
(3303, 505, 5, '2026-03-20', 650.00),
(3304, 502, 5, '2026-04-05', 390.75),
(3305, 505, 5, '2026-05-12', 600.00),
(3306, 505, 5, '2026-06-25', 550.00),
-- Autres villes 2026
(3307, 501, 1, '2026-01-15', 200.00),
(3308, 504, 4, '2026-03-10', 310.50),
(3309, 503, 2, '2026-02-20', 190.00),
(3310, 503, 3, '2026-04-15', 250.75),
(3311, 506, 1, '2026-03-05', 180.00),
(3312, 506, 4, '2026-05-10', 220.50);

---------

-- Lignes pour commandes Lyon 2024 (vendeurs 1, 2, 3)
INSERT INTO TechStor_LignesCommande (id_ligne, id_commande, id_produit, quantite, prix_unitaire) VALUES
(300, 3101, 102, 1, 45.50),
(301, 3101, 110, 2, 12.99),
(302, 3101, 116, 5, 5.99),
(303, 3102, 101, 1, 89.99),
(304, 3103, 103, 1, 199.99),
(305, 3103, 111, 1, 24.90),
(306, 3104, 106, 1, 59.99),
(307, 3104, 117, 2, 14.99),
(308, 3105, 104, 1, 79.90),
(309, 3106, 105, 1, 119.99),
(310, 3106, 118, 1, 49.99);

-- Lignes pour commandes Lyon 2025 (avant novembre : vendeurs 2, 3)
INSERT INTO TechStor_LignesCommande (id_ligne, id_commande, id_produit, quantite, prix_unitaire) VALUES
(311, 3201, 102, 2, 45.50),
(312, 3201, 115, 3, 9.99),
(313, 3202, 103, 1, 199.99),
(314, 3203, 106, 1, 59.99),
(315, 3204, 105, 1, 119.99),
(316, 3204, 112, 1, 79.99),
(317, 3205, 109, 1, 89.90),
(318, 3205, 113, 1, 59.99);

-- Lignes pour commandes Lyon 2025 (après novembre : Sophie Bernard - id_vendeur=5)
-- Commandes avec montants élevés et produits haut de gamme
INSERT INTO TechStor_LignesCommande (id_ligne, id_commande, id_produit, quantite, prix_unitaire) VALUES
(319, 3206, 103, 2, 199.99),  -- Écran 24 pouces x2
(320, 3206, 114, 1, 279.99),   -- Écran 27 pouces
(321, 3207, 107, 3, 69.90),    -- Webcam HD x3
(322, 3207, 112, 2, 79.99),    -- Enceinte Bluetooth x2
(323, 3207, 118, 1, 49.99),    -- Batterie externe
(324, 3208, 105, 2, 119.99),   -- SSD 500Go x2
(325, 3208, 109, 1, 89.90),    -- Routeur Wi-Fi
(326, 3209, 114, 1, 279.99),   -- Écran 27 pouces
(327, 3209, 101, 2, 89.99),    -- Clavier mécanique x2
(328, 3210, 103, 2, 199.99),   -- Écran 24 pouces x2
(329, 3210, 112, 2, 79.99),    -- Enceinte Bluetooth x2
(330, 3210, 105, 1, 119.99);   -- SSD 500Go

-- Lignes pour commandes Lyon 2026 (Sophie Bernard)
INSERT INTO TechStor_LignesCommande (id_ligne, id_commande, id_produit, quantite, prix_unitaire) VALUES
(331, 3301, 114, 2, 279.99),   -- Écran 27 pouces x2
(332, 3301, 105, 1, 119.99),   -- SSD 500Go
(333, 3302, 103, 1, 199.99),   -- Écran 24 pouces
(334, 3302, 112, 2, 79.99),    -- Enceinte Bluetooth x2
(335, 3303, 107, 3, 69.90),    -- Webcam HD x3
(336, 3303, 118, 2, 49.99);    -- Batterie externe x2

---------

