
---  TP1 TechStor : correction

-- Partie 1 : Requêtes simples (Squelette 1)**

-- --1. Liste des produits en rupture de stock (`stock = 0`)**

SELECT *
FROM TechStor_Produits
WHERE stock = 0;


-- --2. Clients inscrits en 2026, triés du plus récent au plus ancien**

SELECT *
FROM TechStor_Clients
WHERE date_inscription BETWEEN '2026-01-01' AND '2026-12-31'
ORDER BY date_inscription DESC;


-- --3. Commandes de plus de 500 € au 2ᵉ trimestre (avril à juin 2026)**

SELECT *
FROM TechStor_Commandes
WHERE date_commande BETWEEN '2026-04-01' AND '2026-06-30'
  AND montant_total > 500;


---

-- Partie 2 : Jointures basiques (Squelette 2)**

-- --1. Chaque commande avec son client associé (nom, prénom, ville, date et montant)**

SELECT c.nom, c.prenom, c.ville, com.date_commande, com.montant_total
FROM TechStor_Commandes com
JOIN TechStor_Clients c ON com.id_client = c.id_client;


-- --2. Produits commandés par Jean Dupont (`id_client = 501`)**

SELECT DISTINCT p.id_produit, p.nom, p.categorie, p.prix_unitaire
FROM TechStor_Commandes com
JOIN TechStor_LignesCommande lc ON com.id_commande = lc.id_commande
JOIN TechStor_Produits p ON lc.id_produit = p.id_produit
WHERE com.id_client = 501;


-- --3. Villes des clients ayant commandé pour plus de 300 € (sans doublons)**

SELECT DISTINCT c.ville
FROM TechStor_Clients c
JOIN TechStor_Commandes com ON c.id_client = com.id_client
WHERE com.montant_total > 300;


---

-- Partie 3 : Agrégations simples (Squelette 3)**

-- --1. Nombre de commandes par client**

SELECT c.id_client, c.nom, c.prenom, COUNT(com.id_commande) AS nombre_commandes
FROM TechStor_Clients c
LEFT JOIN TechStor_Commandes com ON c.id_client = com.id_client
GROUP BY c.id_client, c.nom, c.prenom;


-- --2. Chiffre d'affaires par catégorie de produit**

SELECT p.categorie, SUM(lc.quantite * lc.prix_unitaire) AS chiffre_affaires
FROM TechStor_LignesCommande lc
JOIN TechStor_Produits p ON lc.id_produit = p.id_produit
GROUP BY p.categorie;


-- --3. Moyenne des montants de commande par ville**

SELECT c.ville, AVG(com.montant_total) AS moyenne_commande
FROM TechStor_Clients c
JOIN TechStor_Commandes com ON c.id_client = com.id_client
GROUP BY c.ville;


---

-- Bonus : Enquête sur les commandes de Lyon (mai 2026)**


SELECT com.id_commande, c.nom, c.prenom, com.date_commande, p.nom AS produit, lc.quantite, lc.prix_unitaire
FROM TechStor_Commandes com
JOIN TechStor_Clients c ON com.id_client = c.id_client
JOIN TechStor_LignesCommande lc ON com.id_commande = lc.id_commande
JOIN TechStor_Produits p ON lc.id_produit = p.id_produit
WHERE c.ville = 'Lyon'
  AND com.date_commande BETWEEN '2026-05-01' AND '2026-05-31';
