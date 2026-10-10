

### correction part2 TP techStor


-- =================================================================
-- PARTIE 1 : JOINTURES EXTERNES ET NATURELLES
-- =================================================================

-- Q2.1 : Produits et retours SAV (incluant les produits sans retours)
SELECT p.id_produit, p.nom, COUNT(s.id_retour) AS nb_retours_sav
FROM TechStor_Produits p
LEFT JOIN TechStor_SAV s ON p.id_produit = s.id_produit
GROUP BY p.id_produit, p.nom;

-- Q2.2 : Produits et leurs fournisseurs (Jointure naturelle)
SELECT id_produit, nom, nom_fournisseur, pays
FROM TechStor_Produits
NATURAL JOIN TechStor_Fournisseurs;

-- Q2.3 : Clients n'ayant jamais passé de commande
SELECT c.id_client, c.nom, c.prenom, c.ville
FROM TechStor_Clients c
LEFT JOIN TechStor_Commandes com ON c.id_client = com.id_client
WHERE com.id_commande IS NULL;

-- =================================================================
-- PARTIE 2 : SOUS-REQUÊTES DANS LA CLAUSE WHERE
-- =================================================================

-- Q2.4 : Produits avec prix d'achat supérieur à la moyenne de leur catégorie
SELECT p1.nom, p1.categorie, p1.prix_achat
FROM TechStor_Produits p1
WHERE p1.prix_achat > (
    SELECT AVG(p2.prix_achat)
    FROM TechStor_Produits p2
    WHERE p2.categorie = p1.categorie
);

-- Q2.5 : Clients ayant acheté un produit de 'TechImport Asia'
SELECT DISTINCT c.nom, c.prenom, c.ville
FROM TechStor_Clients c
JOIN TechStor_Commandes com ON c.id_client = com.id_client
JOIN TechStor_LignesCommande lc ON com.id_commande = lc.id_commande
WHERE lc.id_produit IN (
    SELECT p.id_produit
    FROM TechStor_Produits p
    JOIN TechStor_Fournisseurs f ON p.id_fournisseur = f.id_fournisseur
    WHERE f.nom_fournisseur = 'TechImport Asia'
);

-- Q2.6 : Détection des remises abusives hors grille de fidélité
SELECT com.id_commande, c.nom AS nom_client, c.statut_fidelite, p.nom AS produit, lc.remise_pct, g.remise_max_pct
FROM TechStor_LignesCommande lc
JOIN TechStor_Commandes com ON lc.id_commande = com.id_commande
JOIN TechStor_Clients c ON com.id_client = c.id_client
JOIN TechStor_Produits p ON lc.id_produit = p.id_produit
JOIN TechStor_GrilleFidelite g ON c.statut_fidelite = g.statut_fidelite AND p.categorie = g.categorie
WHERE lc.remise_pct > g.remise_max_pct;

-- =================================================================
-- PARTIE 3 : GROUP BY ET HAVING
-- =================================================================

-- Q2.7 : Catégories générant une marge brute totale > 1000€
SELECT p.categorie, 
       SUM(lc.quantite * (lc.prix_unitaire * (1 - lc.remise_pct/100) - p.prix_achat)) AS marge_brute_totale
FROM TechStor_LignesCommande lc
JOIN TechStor_Produits p ON lc.id_produit = p.id_produit
GROUP BY p.categorie
HAVING SUM(lc.quantite * (lc.prix_unitaire * (1 - lc.remise_pct/100) - p.prix_achat)) > 1000;

-- Q2.8 : Fournisseurs avec au moins 2 produits retournés en SAV
SELECT f.nom_fournisseur, COUNT(DISTINCT s.id_produit) AS nb_produits_defectueux
FROM TechStor_Fournisseurs f
JOIN TechStor_Produits p ON f.id_fournisseur = p.id_fournisseur
JOIN TechStor_SAV s ON p.id_produit = s.id_produit
GROUP BY f.id_fournisseur, f.nom_fournisseur
HAVING COUNT(DISTINCT s.id_produit) >= 2;

-- Q2.9 : Catégorie(s) ayant le plus grand nombre de retours SAV (Squelette 5.2)
SELECT p.categorie, COUNT(s.id_retour) AS total_retours
FROM TechStor_Produits p
JOIN TechStor_SAV s ON p.id_produit = s.id_produit
GROUP BY p.categorie
HAVING COUNT(s.id_retour) >= ALL (
    SELECT COUNT(s2.id_retour)
    FROM TechStor_Produits p2
    JOIN TechStor_SAV s2 ON p2.id_produit = s2.id_produit
    GROUP BY p2.categorie
);