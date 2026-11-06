-- ============================================
-- INSERTION DES DONNÉES DE BASE
-- ============================================

-- Table CLIENT (10 clients)
INSERT INTO CLIENT (IdCLI, NOM, ADR) VALUES
(1, 'Dubois SA', '12 rue de la Paix, Paris'),
(2, 'Martin SARL', '45 avenue Victor Hugo, Lyon'),
(3, 'Bernard Corp', '78 boulevard Haussmann, Marseille'),
(4, 'Petit Industries', '23 rue Gambetta, Toulouse'),
(5, 'Robert & Fils', '56 place Bellecour, Nice'),
(6, 'Richard Trading', '89 cours Lafayette, Bordeaux'),
(7, 'Durand Solutions', '34 rue Nationale, Lille'),
(8, 'Moreau Consulting', '67 avenue Foch, Nantes'),
(9, 'Simon Enterprises', '91 boulevard Saint-Michel, Strasbourg'),
(10, 'Laurent Commerce', '15 rue de Rivoli, Montpellier');

-- Table OBJ (15 objets)
INSERT INTO OBJ (IdOBJ, TXT, CAT) VALUES
(1, 'Félicitations, vous avez gagné!', 'loterie'),
(2, 'Urgent: Vérifiez votre compte', 'banque'),
(3, 'Nouvelles de la famille', 'famille'),
(4, 'Invitation à notre événement', 'perso'),
(5, 'Offre exclusive pour vous', 'commerce'),
(6, 'Votre colis est arrivé', 'logistique'),
(7, 'Remboursement en attente', 'banque'),
(8, 'Photos de vacances', 'famille'),
(9, 'Réunion de famille ce weekend', 'famille'),
(10, 'Alerte sécurité', 'banque'),
(11, 'Promotion exceptionnelle', 'commerce'),
(12, 'Message important', 'perso'),
(13, 'Votre avis nous intéresse', 'perso'),
(14, 'Tirage au sort gagnant', 'loterie'),
(15, 'Mise à jour requise', 'banque');


-- Table DISTRA (30 distracteurs)
INSERT INTO DISTRA (IdDISTRA, TXT, SOURCE) VALUES
(1, 'Le temps est magnifique aujourd''hui, les oiseaux chantent dans les arbres du jardin.', 'blog-meteo'),
(2, 'La recette de grand-mère pour les cookies au chocolat reste inégalée depuis des générations.', 'livre-cuisine'),
(3, 'Les montagnes enneigées offrent un spectacle époustouflant en cette saison hivernale.', 'guide-tourisme'),
(4, 'Le match de football d''hier soir s''est terminé sur un score de 3 à 2.', 'journal-sport'),
(5, 'Les fleurs du printemps commencent à éclore dans tous les jardins de la ville.', 'magazine-jardinage'),
(6, 'La nouvelle exposition au musée présente des œuvres d''art contemporain fascinantes.', 'guide-culturel'),
(7, 'Le chat dort paisiblement sur le canapé pendant que la pluie tombe dehors.', 'forum-animaux'),
(8, 'Les étoiles brillent particulièrement fort ce soir dans le ciel dégagé.', 'blog-astronomie'),
(9, 'Le café du matin a un goût particulièrement savoureux aujourd''hui.', 'blog-lifestyle'),
(10, 'Les enfants jouent joyeusement dans le parc sous le soleil de midi.', 'magazine-famille'),
(11, 'La bibliothèque municipale vient d''acquérir de nouveaux livres passionnants.', 'newsletter-ville'),
(12, 'Le bruit des vagues sur la plage procure une sensation de calme absolu.', 'guide-voyage'),
(13, 'Les feuilles d''automne créent un tapis coloré sur les chemins forestiers.', 'magazine-nature'),
(14, 'Le boulanger prépare son pain frais dès cinq heures du matin.', 'blog-gastronomie'),
(15, 'Les nuages dessinent des formes amusantes dans le ciel d''été.', 'blog-photographie'),
(16, 'Le marché du dimanche regorge de fruits et légumes frais de saison.', 'guide-local'),
(17, 'Les papillons virevoltent gracieusement au-dessus des fleurs du jardin.', 'magazine-nature'),
(18, 'La neige recouvre doucement les toits des maisons du village.', 'journal-regional'),
(19, 'Le chant du coq annonce le lever du soleil à la ferme.', 'blog-campagne'),
(20, 'Les livres anciens de la collection ont une odeur caractéristique.', 'magazine-litterature'),
(21, 'Le vent souffle légèrement dans les branches des grands chênes.', 'blog-nature'),
(22, 'La fontaine de la place centrale coule en produisant un son apaisant.', 'guide-touristique'),
(23, 'Les vélos sont alignés devant l''école en attendant les enfants.', 'journal-local'),
(24, 'Le feu crépite agréablement dans la cheminée du salon.', 'magazine-maison'),
(25, 'Les abeilles butinent activement les fleurs du jardin potager.', 'magazine-jardinage'),
(26, 'Le train arrive à quai avec quelques minutes de retard ce matin.', 'info-transport'),
(27, 'Les volets bleus de la maison contrastent avec les murs blancs.', 'magazine-decoration'),
(28, 'Le phare guide les navires dans la nuit étoilée du port.', 'guide-maritime'),
(29, 'Les champignons poussent abondamment dans la forêt après la pluie.', 'guide-mycologie'),
(30, 'Le clocher de l''église sonne les heures avec régularité.', 'patrimoine-local');

-- Table ADRMAIL (30 adresses mail)
INSERT INTO ADRMAIL (IdADR, SOURCE, VALID) VALUES
(1, 'scraping-facebook', TRUE),
(2, 'achat-base-2020', TRUE),
(3, 'scraping-linkedin', TRUE),
(4, 'partenaire-commercial', FALSE),
(5, 'scraping-twitter', TRUE),
(6, 'achat-base-2021', TRUE),
(7, 'scraping-instagram', FALSE),
(8, 'formulaire-web', TRUE),
(9, 'scraping-facebook', TRUE),
(10, 'achat-base-2022', TRUE),
(11, 'partenaire-commercial', TRUE),
(12, 'scraping-linkedin', FALSE),
(13, 'formulaire-web', TRUE),
(14, 'scraping-twitter', TRUE),
(15, 'achat-base-2020', FALSE),
(16, 'scraping-facebook', TRUE),
(17, 'partenaire-commercial', TRUE),
(18, 'achat-base-2021', TRUE),
(19, 'scraping-instagram', TRUE),
(20, 'formulaire-web', FALSE),
(21, 'scraping-linkedin', TRUE),
(22, 'achat-base-2022', TRUE),
(23, 'scraping-twitter', FALSE),
(24, 'partenaire-commercial', TRUE),
(25, 'scraping-facebook', TRUE),
(26, 'formulaire-web', TRUE),
(27, 'achat-base-2020', TRUE),
(28, 'scraping-instagram', FALSE),
(29, 'scraping-linkedin', TRUE),
(30, 'achat-base-2021', TRUE);

-- ============================================
-- INSERTION DES CONTRATS (20 contrats)
-- ============================================
INSERT INTO CONTRAT (IdCO, IdCLI, IdOBJ, TXT, TYP, CATFROM) VALUES
(1, 1, 1, 'Gagnez un voyage exceptionnel aux Bahamas! Cliquez maintenant!', '1M-valide', 'loterie'),
(2, 2, 2, 'Votre compte nécessite une vérification immédiate. Suivez le lien.', '2M-valide', 'banque'),
(3, 3, 5, 'Profitez de -70% sur tous nos produits cette semaine uniquement!', '5M-non-valide', 'commerce'),
(4, 4, 11, 'Liquidation totale! Prix cassés sur tout le magasin!', '10M-non-valide', 'commerce'),
(5, 5, 3, 'Retrouvailles familiales ce dimanche, venez nombreux!', '1M-valide', 'famille'),
(6, 1, 7, 'Remboursement de 500 euros en attente sur votre compte.', '2M-valide', 'banque'),
(7, 6, 14, 'Vous êtes le 1000ème visiteur! Réclamez votre prix maintenant!', '5M-non-valide', 'loterie'),
(8, 7, 4, 'Invitation exclusive à notre soirée VIP de lancement.', '1M-valide', 'perso'),
(9, 2, 10, 'Activité suspecte détectée. Sécurisez votre compte immédiatement.', '2M-valide', 'banque'),
(10, 8, 6, 'Votre colis attend à l''entrepôt. Confirmez la livraison.', '10M-non-valide', 'logistique'),
(11, 3, 1, 'Jackpot de 10 millions d''euros! Tentez votre chance gratuitement.', '5M-valide', 'loterie'),
(12, 9, 8, 'Regardez les photos de nos dernières vacances en famille!', '1M-valide', 'famille'),
(13, 4, 15, 'Mise à jour de sécurité obligatoire pour votre compte bancaire.', '2M-valide', 'banque'),
(14, 10, 11, 'Vente flash! Les 100 premiers clients reçoivent un cadeau.', '10M-non-valide', 'commerce'),
(15, 5, 9, 'Grande réunion de famille organisée pour les 80 ans de grand-mère.', '1M-valide', 'famille'),
(16, 6, 14, 'Tirage exceptionnel: 5000 euros à gagner chaque jour!', '5M-valide', 'loterie'),
(17, 7, 12, 'Message personnel important concernant votre situation.', '2M-valide', 'perso'),
(18, 8, 2, 'Votre carte bancaire expire bientôt. Renouvelez-la en ligne.', '1M-valide', 'banque'),
(19, 9, 5, 'Offre spéciale réservée: -80% pendant 24h seulement!', '10M-non-valide', 'commerce'),
(20, 10, 13, 'Votre opinion compte! Répondez à notre sondage et gagnez.', '5M-valide', 'perso');


-- ============================================
-- ASSOCIATIONS CO_DISTRA (chaque contrat utilise au moins 5 distracteurs)
-- ============================================
-- Contrats 1-20 avec 5 à 8 distracteurs chacun
INSERT INTO CO_DISTRA (IdCO, IdDISTRA) VALUES
-- Contrat 1: 6 distracteurs
(1, 1), (1, 5), (1, 9), (1, 13), (1, 17), (1, 21),
-- Contrat 2: 7 distracteurs
(2, 2), (2, 6), (2, 10), (2, 14), (2, 18), (2, 22), (2, 26),
-- Contrat 3: 5 distracteurs
(3, 3), (3, 7), (3, 11), (3, 15), (3, 19),
-- Contrat 4: 8 distracteurs
(4, 4), (4, 8), (4, 12), (4, 16), (4, 20), (4, 24), (4, 28), (4, 30),
-- Contrat 5: 6 distracteurs
(5, 1), (5, 6), (5, 11), (5, 16), (5, 21), (5, 26),
-- Contrat 6: 5 distracteurs
(6, 2), (6, 7), (6, 12), (6, 17), (6, 22),
-- Contrat 7: 7 distracteurs
(7, 3), (7, 8), (7, 13), (7, 18), (7, 23), (7, 27), (7, 29),
-- Contrat 8: 6 distracteurs
(8, 4), (8, 9), (8, 14), (8, 19), (8, 24), (8, 28),
-- Contrat 9: 5 distracteurs
(9, 5), (9, 10), (9, 15), (9, 20), (9, 25),
-- Contrat 10: 8 distracteurs
(10, 1), (10, 2), (10, 3), (10, 4), (10, 5), (10, 6), (10, 7), (10, 8),
-- Contrat 11: 6 distracteurs
(11, 9), (11, 10), (11, 11), (11, 12), (11, 13), (11, 14),
-- Contrat 12: 7 distracteurs
(12, 15), (12, 16), (12, 17), (12, 18), (12, 19), (12, 20), (12, 21),
-- Contrat 13: 5 distracteurs
(13, 22), (13, 23), (13, 24), (13, 25), (13, 26),
-- Contrat 14: 6 distracteurs
(14, 1), (14, 7), (14, 13), (14, 19), (14, 25), (14, 30),
-- Contrat 15: 8 distracteurs
(15, 2), (15, 4), (15, 6), (15, 8), (15, 10), (15, 12), (15, 14), (15, 16),
-- Contrat 16: 7 distracteurs
(16, 3), (16, 9), (16, 15), (16, 21), (16, 27), (16, 28), (16, 29),
-- Contrat 17: 5 distracteurs
(17, 5), (17, 11), (17, 17), (17, 23), (17, 30),
-- Contrat 18: 6 distracteurs
(18, 1), (18, 8), (18, 15), (18, 22), (18, 29), (18, 30),
-- Contrat 19: 7 distracteurs
(19, 2), (19, 5), (19, 10), (19, 15), (19, 20), (19, 25), (19, 30),
-- Contrat 20: 5 distracteurs
(20, 3), (20, 12), (20, 18), (20, 24), (20, 27);

-- ============================================
-- ASSOCIATIONS CO_ADR (chaque contrat utilise au moins 20 adresses mail)
-- ============================================
-- Contrat 1: utilise les adresses 1 à 22
INSERT INTO CO_ADR (IdCO, IdADR) VALUES
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 6), (1, 7), (1, 8), (1, 9), (1, 10),
(1, 11), (1, 12), (1, 13), (1, 14), (1, 15), (1, 16), (1, 17), (1, 18), (1, 19), (1, 20),
(1, 21), (1, 22);

-- Contrat 2: utilise les adresses 2 à 23
INSERT INTO CO_ADR (IdCO, IdADR) VALUES
(2, 2), (2, 3), (2, 4), (2, 5), (2, 6), (2, 7), (2, 8), (2, 9), (2, 10), (2, 11),
(2, 12), (2, 13), (2, 14), (2, 15), (2, 16), (2, 17), (2, 18), (2, 19), (2, 20), (2, 21),
(2, 22), (2, 23);

-- Contrat 3: utilise les adresses 3 à 24
INSERT INTO CO_ADR (IdCO, IdADR) VALUES
(3, 3), (3, 4), (3, 5), (3, 6), (3, 7), (3, 8), (3, 9), (3, 10), (3, 11), (3, 12),
(3, 13), (3, 14), (3, 15), (3, 16), (3, 17), (3, 18), (3, 19), (3, 20), (3, 21), (3, 22),
(3, 23), (3, 24);

-- Contrat 4: utilise les adresses 4 à 25
INSERT INTO CO_ADR (IdCO, IdADR) VALUES
(4, 4), (4, 5), (4, 6), (4, 7), (4, 8), (4, 9), (4, 10), (4, 11), (4, 12), (4, 13),
(4, 14), (4, 15), (4, 16), (4, 17), (4, 18), (4, 19), (4, 20), (4, 21), (4, 22), (4, 23),
(4, 24), (4, 25);

-- Contrat 5: utilise les adresses 5 à 26
INSERT INTO CO_ADR (IdCO, IdADR) VALUES
(5, 5), (5, 6), (5, 7), (5, 8), (5, 9), (5, 10), (5, 11), (5, 12), (5, 13), (5, 14),
(5, 15), (5, 16), (5, 17), (5, 18), (5, 19), (5, 20), (5, 21), (5, 22), (5, 23), (5, 24),
(5, 25), (5, 26);

-- Contrat 6: utilise les adresses 6 à 27
INSERT INTO CO_ADR (IdCO, IdADR) VALUES
(6, 6), (6, 7), (6, 8), (6, 9), (6, 10), (6, 11), (6, 12), (6, 13), (6, 14), (6, 15),
(6, 16), (6, 17), (6, 18), (6, 19), (6, 20), (6, 21), (6, 22), (6, 23), (6, 24), (6, 25),
(6, 26), (6, 27);

-- Contrat 7: utilise les adresses 7 à 28
INSERT INTO CO_ADR (IdCO, IdADR) VALUES
(7, 7), (7, 8), (7, 9), (7, 10), (7, 11), (7, 12), (7, 13), (7, 14), (7, 15), (7, 16),
(7, 17), (7, 18), (7, 19), (7, 20), (7, 21), (7, 22), (7, 23), (7, 24), (7, 25), (7, 26),
(7, 27), (7, 28);

-- Contrat 8: utilise les adresses 8 à 29
INSERT INTO CO_ADR (IdCO, IdADR) VALUES
(8, 8), (8, 9), (8, 10), (8, 11), (8, 12), (8, 13), (8, 14), (8, 15), (8, 16), (8, 17),
(8, 18), (8, 19), (8, 20), (8, 21), (8, 22), (8, 23), (8, 24), (8, 25), (8, 26), (8, 27),
(8, 28), (8, 29);

-- Contrat 9: utilise les adresses 9 à 30
INSERT INTO CO_ADR (IdCO, IdADR) VALUES
(9, 9), (9, 10), (9, 11), (9, 12), (9, 13), (9, 14), (9, 15), (9, 16), (9, 17), (9, 18),
(9, 19), (9, 20), (9, 21), (9, 22), (9, 23), (9, 24), (9, 25), (9, 26), (9, 27), (9, 28),
(9, 29), (9, 30);

-- Contrat 10: utilise les adresses 1 à 22
INSERT INTO CO_ADR (IdCO, IdADR) VALUES
(10, 1), (10, 2), (10, 3), (10, 4), (10, 5), (10, 6), (10, 7), (10, 8), (10, 9), (10, 10),
(10, 11), (10, 12), (10, 13), (10, 14), (10, 15), (10, 16), (10, 17), (10, 18), (10, 19), (10, 20),
(10, 21), (10, 22);

-- Contrat 11: utilise les adresses 3 à 24
INSERT INTO CO_ADR (IdCO, IdADR) VALUES
(11, 3), (11, 4), (11, 5), (11, 6), (11, 7), (11, 8), (11, 9), (11, 10), (11, 11), (11, 12),
(11, 13), (11, 14), (11, 15), (11, 16), (11, 17), (11, 18), (11, 19), (11, 20), (11, 21), (11, 22),
(11, 23), (11, 24);

-- Contrat 12: utilise les adresses 5 à 26
INSERT INTO CO_ADR (IdCO, IdADR) VALUES
(12, 5), (12, 6), (12, 7), (12, 8), (12, 9), (12, 10), (12, 11), (12, 12), (12, 13), (12, 14),
(12, 15), (12, 16), (12, 17), (12, 18), (12, 19), (12, 20), (12, 21), (12, 22), (12, 23), (12, 24),
(12, 25), (12, 26);

-- Contrat 13: utilise les adresses 7 à 28
INSERT INTO CO_ADR (IdCO, IdADR) VALUES
(13, 7), (13, 8), (13, 9), (13, 10), (13, 11), (13, 12), (13, 13), (13, 14), (13, 15), (13, 16),
(13, 17), (13, 18), (13, 19), (13, 20), (13, 21), (13, 22), (13, 23), (13, 24), (13, 25), (13, 26),
(13, 27), (13, 28);

-- Contrat 14: utilise les adresses 2 à 23
INSERT INTO CO_ADR (IdCO, IdADR) VALUES
(14, 2), (14, 3), (14, 4), (14, 5), (14, 6), (14, 7), (14, 8), (14, 9), (14, 10), (14, 11),
(14, 12), (14, 13), (14, 14), (14, 15), (14, 16), (14, 17), (14, 18), (14, 19), (14, 20), (14, 21),
(14, 22), (14, 23);

-- Contrat 15: utilise les adresses 4 à 25
INSERT INTO CO_ADR (IdCO, IdADR) VALUES
(15, 4), (15, 5), (15, 6), (15, 7), (15, 8), (15, 9), (15, 10), (15, 11), (15, 12), (15, 13),
(15, 14), (15, 15), (15, 16), (15, 17), (15, 18), (15, 19), (15, 20), (15, 21), (15, 22), (15, 23),
(15, 24), (15, 25);

-- Contrat 16: utilise les adresses 6 à 27
INSERT INTO CO_ADR (IdCO, IdADR) VALUES
(16, 6), (16, 7), (16, 8), (16, 9), (16, 10), (16, 11), (16, 12), (16, 13), (16, 14), (16, 15),
(16, 16), (16, 17), (16, 18), (16, 19), (16, 20), (16, 21), (16, 22), (16, 23), (16, 24), (16, 25),
(16, 26), (16, 27);

-- Contrat 17: utilise les adresses 8 à 29
INSERT INTO CO_ADR (IdCO, IdADR) VALUES
(17, 8), (17, 9), (17, 10), (17, 11), (17, 12), (17, 13), (17, 14), (17, 15), (17, 16), (17, 17),
(17, 18), (17, 19), (17, 20), (17, 21), (17, 22), (17, 23), (17, 24), (17, 25), (17, 26), (17, 27),
(17, 28), (17, 29);

-- Contrat 18: utilise les adresses 1 à 22
INSERT INTO CO_ADR (IdCO, IdADR) VALUES
(18, 1), (18, 2), (18, 3), (18, 4), (18, 5), (18, 6), (18, 7), (18, 8), (18, 9), (18, 10),
(18, 11), (18, 12), (18, 13), (18, 14), (18, 15), (18, 16), (18, 17), (18, 18), (18, 19), (18, 20),
(18, 21), (18, 22);

-- Contrat 19: utilise les adresses 9 à 30
INSERT INTO CO_ADR (IdCO, IdADR) VALUES
(19, 9), (19, 10), (19, 11), (19, 12), (19, 13), (19, 14), (19, 15), (19, 16), (19, 17), (19, 18),
(19, 19), (19, 20), (19, 21), (19, 22), (19, 23), (19, 24), (19, 25), (19, 26), (19, 27), (19, 28),
(19, 29), (19, 30);

-- Contrat 20: utilise les adresses 3 à 25 (23 adresses)
INSERT INTO CO_ADR (IdCO, IdADR) VALUES
(20, 3), (20, 4), (20, 5), (20, 6), (20, 7), (20, 8), (20, 9), (20, 10), (20, 11), (20, 12),
(20, 13), (20, 14), (20, 15), (20, 16), (20, 17), (20, 18), (20, 19), (20, 20), (20, 21), (20, 22),
(20, 23), (20, 24), (20, 25);

-- ============================================
-- REQUÊTES DE VÉRIFICATION
-- ============================================
-- Vérifier le nombre d'enregistrements dans chaque table
SELECT 'CLIENT' as table_name, COUNT(*) as count FROM CLIENT
UNION ALL
SELECT 'OBJ', COUNT(*) FROM OBJ
UNION ALL
SELECT 'ADRFROM', COUNT(*) FROM ADRFROM
UNION ALL
SELECT 'DISTRA', COUNT(*) FROM DISTRA
UNION ALL
SELECT 'ADRMAIL', COUNT(*) FROM ADRMAIL
UNION ALL
SELECT 'CONTRAT', COUNT(*) FROM CONTRAT
UNION ALL
SELECT 'CO_FROM', COUNT(*) FROM CO_FROM
UNION ALL
SELECT 'CO_DISTRA', COUNT(*) FROM CO_DISTRA
UNION ALL
SELECT 'CO_ADR', COUNT(*) FROM CO_ADR;

-- Vérifier le nombre de FROM par contrat (doit être >= 20)
SELECT IdCO, COUNT(*) as nb_from
FROM CO_FROM
GROUP BY IdCO
ORDER BY IdCO;

-- Vérifier le nombre de DISTRACTEURS par contrat (doit être >= 5)
SELECT IdCO, COUNT(*) as nb_distra
FROM CO_DISTRA
GROUP BY IdCO
ORDER BY IdCO;

-- Vérifier le nombre d'ADRESSES MAIL par contrat (doit être >= 20)
SELECT IdCO, COUNT(*) as nb_adrmail
FROM CO_ADR
GROUP BY IdCO
ORDER BY IdCO;