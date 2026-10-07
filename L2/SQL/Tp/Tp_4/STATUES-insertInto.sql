
-- Les données exemples de cette base ont été générées par une IAG. Ce ne sont pas de vraies informations. 
-- Insertion des Villes 
INSERT INTO Ville (CODVIL, ANOM, NNOM) VALUES
(1, 'Rome', 'Italie'),
(2, 'Athènes', 'Grèce'),
(3, 'Paris', 'France'),
(4, 'Londres', 'Royaume-Uni'),
(5, 'Le Caire', 'Egypte'),
(6, 'New York', 'États-Unis'),
(7, 'Tokyo', 'Japon'),
(8, 'Berlin', 'Allemagne'),
(9, 'Madrid', 'Espagne'),
(10, 'Moscou', 'Russie');

-- Insertion des Musées 
INSERT INTO Musee (CODVIL, CODMUS, NOMMUS, CONSER) VALUES
(1, 20, 'Musées du Vatican', 'Collection d''art religieux'),
(1, 21, 'Galleria Borghese', 'Sculptures et peintures'),
(2, 30, 'Musée de l''Acropole', 'Trésors de l''Antiquité grecque'),
(3, 40, 'Musée du Louvre', 'Collection encyclopédique'),
(4, 10, 'British Museum', 'Art et histoire du monde entier'),
(5, 25, 'Musée Egyptien', 'Trésors de l''Egypte ancienne'),
(6, 35, 'Metropolitan Museum of Art', 'Art de toutes les époques'),
(7, 15, 'Tokyo National Museum', 'Art japonais traditionnel'),
(8, 22, 'Pergamon Museum', 'Architecture et art de l''Antiquité'),
(9, 12, 'Museo del Prado', 'Peinture espagnole');

INSERT INTO Musee (CODVIL, CODMUS, NOMMUS, CONSER) VALUES
(5, 10, 'Musée du côté', 'Profils'),
(3, 10, 'Baguettes et bérets', 'culture populaire'),
(10, 20, 'Musée du petit poids', 'Art et nature');

-- Insertion des Sites 
INSERT INTO Site (CODVIL, CODSIT, DESSIT) VALUES
(1, 50, 'Colisée'),
(2, 60, 'Acropole'),
(3, 70, 'Tour Eiffel'),
(4, 80, 'Palais de Westminster'),
(5, 90, 'Pyramides de Gizeh'),
(6, 100, 'Statue de la Liberté'),
(7, 99, 'Temple Senso-ji'),
(8, 98, 'Porte de Brandebourg'),
(9, 1, 'Palais Royal de Madrid'),
(10, 2, 'Place Rouge'),
(1, 51, 'Forum Romain'),
(2, 61, 'Agora Antique'),
(3, 71, 'Montmartre'),
(4, 81, 'Tower Bridge'),
(5, 91, 'Vallée des Rois'),
(6, 3, 'Central Park'),
(7, 4, 'Imperial Palace East Garden'),
(8, 5, 'Museum Island'),
(9, 6, 'Retiro Park'),
(10, 7, 'Saint Basil s Cathedral');

-- Insertion des Bâtiments 
INSERT INTO Batiment (CODVIL, CODSIT, CODBAT, DESBAT, TYPBAT, DATBAT) VALUES
(1, 50, 1, 'Arène elliptique', 'Amphithéâtre', '80 ap. J.-C.'),
(2, 60, 2, 'Temple de Thésée', 'Temple', 'V siècle av. J.-C.'),
(3, 70, 3, 'Tour de 324 mètres', 'Tour', '1889'),
(4, 80, 4, 'Siège du Parlement', 'Palais', '1870'),
(5, 90, 5, 'Tombeaux de pharaons', 'Pyramide', '-2584'),
(6, 100, 6, 'Symbole de la liberté', 'Statue', '1886'),
(7, 4, 7, 'Temple bouddhiste', 'Temple', '645'),
(8, 98, 8, 'Musées et monuments', 'Île', 'XIIe siècle'),
(9, 1, 9, 'Résidence royale', 'Palais', '1734'),
(10, 2, 10, 'Place emblématique', 'Place', 'XIVe siècle'),
(1, 51, 11, 'Centre de la vie politique', 'Forum', '-476'),
(2, 61, 12, 'Centre de la vie sociale', 'Agora', '-508'),
(3, 71, 13, 'Quartier des artistes', 'Village', 'XIXe siècle'),
(4, 81, 14, 'Pont à bascule', 'Pont', '1894'),
(5, 91, 15, 'Nécropole royale', 'Vallée', '-1324'),
(6, 3, 16, 'Espace vert urbain', 'Parc', '1857'),
(7, 4, 17, 'Résidence impériale', 'Palais', '1888'),
(8, 5, 18, 'Complexe muséal', 'Île', 'XIXe siècle'),
(9, 1, 19, 'Espace de loisirs', 'Parc', '1830'),
(10, 2, 20, 'Cathédrale orthodoxe', 'Basilique', '1561');

-- Insertion des Éditeurs 
INSERT INTO Editeur (NUMEDI, NOMEDI) VALUES
(1, 'Gallimard'),
(2, 'Flammarion');
INSERT INTO Editeur (NUMEDI, NOMEDI) VALUES
(101, 'Editions d''Art Historique'),
(102, 'Librairie des Beaux-Arts'),
(103, 'Galerie Internationale'),
(104, 'Maison d''Etudes Artistiques'),
(105, 'Impression et Diffusion Culturelle');


-- Insertion des Auteurs 
INSERT INTO Auteur (AUT, NOMAUT, NATION, TITAUT) VALUES
(1, 'Albert Camus', 'France', 'Écrivain'),
(2, 'Marcel Proust', 'France', 'Écrivain'),
(3, 'William Shakespeare', 'Royaume-Uni', 'Dramaturge'),
(4, 'Jane Austen', 'Royaume-Uni', 'Romancière'),
(5, 'Homer', 'Grèce', 'Poète'),
(6, 'Virgil', 'Rome', 'Poète'),
(7, 'Machiavelli', 'Italie', 'Philosophe'),
(8, 'Dostoïevski', 'Russie', 'Écrivain'),
(9, 'Tolstoï', 'Russie', 'Écrivain'),
(10, 'Kafka', 'Tchéquie', 'Écrivain'),
(11, 'Joyce', 'Irlande', 'Écrivain'),
(12, 'Hemingway', 'États-Unis', 'Écrivain'),
(13, 'Fitzgerald', 'États-Unis', 'Écrivain'),
(14, 'Poe', 'États-Unis', 'Écrivain'),
(15, 'Dickens', 'Royaume-Uni', 'Écrivain'),
(16, 'Brontë', 'Royaume-Uni', 'Romancière'),
(17, 'Orwell', 'Royaume-Uni', 'Écrivain'),
(18, 'Woolf', 'Royaume-Uni', 'Romancière'),
(19, 'Mann', 'Allemagne', 'Écrivain'),
(20, 'Brecht', 'Allemagne', 'Dramaturge');
INSERT INTO Auteur (AUT, NOMAUT, NATION, TITAUT) VALUES
(201, 'Jean Dubois', 'France', 'Expert en sculpture'),
(202, 'Maria Rodriguez', 'Espagne', 'Historienne de l''art'),
(203, 'Kenji Tanaka', 'Japon', 'Maître sculpteur'),
(204, 'Eleanor Vance', 'Angleterre', 'Conservatrice de musée'),
(205, 'Hans Schmidt', 'Allemagne', 'Artiste contemporain');

-- Insertion des Ouvrages 
INSERT INTO Ouvrage (NUMOUV, TITOUV, DATEDI, NUMEDI) VALUES
(301, 'L''Art de la Sculpture Antique', '2023-05-10', 101),
(302, 'Les Grands Sculpteurs de la Renaissance', '2022-11-15', 102),
(303, 'Sculpture Moderne : Tendances et Innovations', '2024-01-20', 103),
(304, 'Le Marbre et le Bronze : Techniques et Traditions', '2023-08-01', 104),
(305, 'Sculpture Japonaise : L''Art de la Transformation', '2024-03-15', 105),
(306, 'Les Statues de la Place Publique : Histoire et Symbolique', '2023-06-25', 101),
(307, 'La Sculpture en Bois : Un Art Millénaire', '2022-12-05', 102),
(308, 'L''Art Abstrait en Sculpture : Exploration et Expérimentation', '2024-02-10', 103),
(309, 'Le Calcaire et la Pierre : Matières Premières de la Sculpture', '2023-09-18', 104),
(310, 'Sculpture Contemporaine en Asie : Dialogues et Influences', '2024-04-05', 105),
(311, 'La Sculpture Romane : Expression et Spiritualité', '2023-07-22', 101),
(312, 'Les Statues Équestres : Pouvoir et Représentation', '2022-10-30', 102),
(313, 'Sculpture en Fer : Métal et Créativité', '2024-01-08', 103),
(314, 'Le Bronze et ses Techniques de Patine', '2023-08-14', 104),
(315, 'Sculpture en Chine : Histoire et Esthétique', '2024-03-21', 105),
(316, 'La Sculpture Précolombienne : Art et Rituels', '2023-06-12', 101),
(317, 'Les Statues Funéraires : Symboles et Croyances', '2022-12-18', 102),
(318, 'Sculpture en Argile : Simplicité et Expression', '2024-01-27', 103),
(319, 'Le Caravage et la Sculpture : Lumière et Ombre', '2023-08-21', 104),
(320, 'Sculpture en Corée : Tradition et Modernité', '2024-03-28', 105),
(321, 'Les Statues de Cire : Un Art Éphémère', '2023-07-04', 101),
(322, 'Les Statues en Pierre Tombale : Mémoire et Deuil', '2022-11-07', 102),
(323, 'Sculpture en Verre : Fragilité et Transparence', '2024-02-05', 103),
(324, 'Le Sculpteurs et le Commanditaire : Relations et Influences', '2023-09-15', 104),
(325, 'Sculpture en Thaïlande : Bouddha et Art Royal', '2024-04-12', 105),
(326, 'Les Statues de Jardin : Beauté et Nature', '2023-06-28', 101),
(327, 'Les Statues de Ciment : Un Art Populaire', '2022-12-26', 102),
(328, 'Sculpture en Plastique : Nouveaux Matériaux et Formes', '2024-01-15', 103),
(329, 'Le Sculpteurs et la Couleur : Pigments et Techniques', '2023-08-29', 104),
(330, 'Sculpture en Indonésie : Diversité Culturelle et Artistique', '2024-03-19', 105),
(331, 'Les Statues de la Renaissance Italienne', '2023-07-11', 101),
(332, 'Les Statues de la Grèce Antique', '2022-11-28', 102),
(333, 'Les Statues de l''Égypte Ancienne', '2024-01-29', 103),
(334, 'Les Statues de la Rome Antique', '2023-09-05', 104),
(335, 'Les Statues de l''Empire Mongol', '2024-04-08', 105),
(336, 'L''Art de la Sculpture en Chine', '2023-07-18', 101),
(337, 'L''Art de la Sculpture en Inde', '2022-12-04', 102),
(338, 'L''Art de la Sculpture en Russie', '2024-01-31', 103),
(339, 'L''Art de la Sculpture en Afrique', '2023-08-16', 104),
(340, 'L''Art de la Sculpture en Amérique', '2024-03-26', 105);


-- Insertion de 100 statues d'exemple
INSERT INTO Statue (NUMSTA, TYPSTA, DATSTA, DESSTA, SCUSTA, CODVIL_O, CODVIL_M, CODMUS, CODVIL_S, CODSIT, CODBAT) VALUES
(1, 'Statue', '100 av. J.-C.', 'Vénus de Milo', 'Alexandros d Antioche', 2, 3, 40, 2, 60, 2),
(2, 'Statue', '1501-1504', 'David', 'Michel-Ange', 1, 1, 20, 1, 51, 11),
(3, 'Bas-relief', '447-438 av. J.-C.', 'Frise du Parthénon', 'Phidias', 2, 4, 10, 2, 60, 2),
(4, 'Statue', '1880-1886', 'La Liberté éclairant le monde', 'Frédéric Auguste Bartholdi', 3, 6, 35, 6, 100, 6),
(5, 'Colonne', '113 ap. J.-C.', 'Colonne Trajane', 'Apollodore de Damas', 1, 1, 21, 1, 50, 1),
(6, 'Statue', '1903', 'Le Penseur', 'Auguste Rodin', 3, 3, 40, 3, 70, 3),
(7, 'Statue', '-2500', 'Grand Sphinx de Gizeh', 'Sculpteur inconnu', 5, 5, 25, 5, 90, 5),
(8, 'Statue', '150 av. J.-C.', 'Victoire de Samothrace', 'Sculpteur de Rhodes', 2, 3, 40, 2, 61, 12),
(9, 'Statue', '1619', 'Apollon et Daphné', 'Gian Lorenzo Bernini', 1, 1, 21, 1, 51, 11),
(10, 'Bas-relief', '180 ap. J.-C.', 'Autel de Pergame', 'École de Pergame', 2, 8, 22, 8, 5, 18),
(11, 'Statue', '1498-1499', 'Pietà', 'Michel-Ange', 1, 1, 20, 1, 50, 1),
(12, 'Statue', '440 av. J.-C.', 'Discobole', 'Myron', 2, 4, 10, 2, 60, 2),
(13, 'Statue', '1875', 'Les Bourgeois de Calais', 'Auguste Rodin', 3, 4, 10, 4, 80, 4),
(14, 'Frise', '432 av. J.-C.', 'Métopes du Parthénon', 'Phidias', 2, 2, 30, 2, 60, 2),
(15, 'Statue', '1886', 'Statue de la République', 'Léopold Morice', 3, 3, 40, 3, 71, 13),
(16, 'Statue', '460 av. J.-C.', 'Aurige de Delphes', 'Sculpteur de Delphes', 2, 2, 30, 2, 61, 12),
(17, 'Statue', '1937', 'Ouvrier et Kolkhozienne', 'Vera Moukhina', 10, 8, 22, 10, 2, 10),
(18, 'Statue', '1889', 'Burghers of Calais', 'Auguste Rodin', 3, 4, 10, 4, 81, 14),
(19, 'Bas-relief', '-1350', 'Relief de Néfertiti', 'Thoutmôsis', 5, 5, 25, 5, 91, 15),
(20, 'Statue', '1504', 'Moïse', 'Michel-Ange', 1, 1, 20, 1, 51, 11),
(21, 'Statue', '330 av. J.-C.', 'Vénus de Cnide', 'Praxitèle', 2, 3, 40, 2, 60, 2),
(22, 'Colonne', '1806-1810', 'Colonne Vendôme', 'Jean-Baptiste Lepère', 3, 3, 40, 3, 70, 3),
(23, 'Statue', '1970', 'Homme qui marche', 'Alberto Giacometti', 3, 6, 35, 6, 3, 16),
(24, 'Statue', '1260', 'Bouddha de Kamakura', 'Ono Goroemon', 7, 7, 15, 7, 4, 7),
(25, 'Statue', '1867', 'Ugolino', 'Jean-Baptiste Carpeaux', 3, 3, 40, 3, 71, 13),
(26, 'Frise', '160 av. J.-C.', 'Grande Frise de Pergame', 'École hellénistique', 2, 8, 22, 8, 5, 18),
(27, 'Statue', '1888', 'Christ Rédempteur', 'Paul Landowski', 1, 1, 21, 1, 50, 1),
(28, 'Statue', '450 av. J.-C.', 'Doryphore', 'Polyclète', 2, 6, 35, 2, 61, 12),
(29, 'Statue', '1893', 'Monument à Balzac', 'Auguste Rodin', 3, 3, 40, 3, 71, 13),
(30, 'Bas-relief', '-1323', 'Masque funéraire de Toutânkhamon', 'Artisan égyptien', 5, 5, 25, 5, 91, 15),
(31, 'Statue', '1920', 'L Oiseau dans l espace', 'Constantin Brâncuși', 1, 6, 35, 6, 3, 16),
(32, 'Statue', '1785', 'Psyché ranimée par le baiser de l Amour', 'Antonio Canova', 1, 3, 40, 1, 51, 11),
(33, 'Colonne', '1667-1671', 'Colonne de la Victoire', 'Christopher Wren', 4, 4, 10, 4, 80, 4),
(34, 'Statue', '1936', 'Lion de Belfort', 'Frédéric Auguste Bartholdi', 3, 3, 40, 3, 70, 3),
(35, 'Statue', '520 av. J.-C.', 'Korê de l Acropole', 'Sculpteur archaïque', 2, 2, 30, 2, 60, 2),
(36, 'Statue', '1889', 'Monument à Victor Hugo', 'Auguste Rodin', 3, 3, 40, 3, 71, 13),
(37, 'Frise', '106-113 ap. J.-C.', 'Colonne Trajane (reliefs)', 'Apollodore de Damas', 1, 1, 21, 1, 50, 1),
(38, 'Statue', '1886', 'Statue équestre de Jeanne d Arc', 'Emmanuel Frémiet', 3, 3, 40, 3, 70, 3),
(39, 'Statue', '350 av. J.-C.', 'Aphrodite de Cnide', 'Praxitèle', 2, 4, 10, 2, 61, 12),
(40, 'Statue', '1902', 'La Porte de l Enfer', 'Auguste Rodin', 3, 3, 40, 3, 71, 13),
(41, 'Bas-relief', '-1295', 'Relief d Abou Simbel', 'Artisans de Ramsès II', 5, 5, 25, 5, 91, 15),
(42, 'Statue', '1784', 'Les Trois Grâces', 'Antonio Canova', 1, 1, 21, 1, 51, 11),
(43, 'Statue', '1930', 'Femme au chapeau', 'Pablo Picasso', 9, 9, 12, 9, 1, 9),
(44, 'Colonne', '1833', 'Colonne de Juillet', 'Jean-Antoine Alavoine', 3, 3, 40, 3, 70, 3),
(45, 'Statue', '1860', 'Ugolin et ses fils', 'Jean-Baptiste Carpeaux', 3, 3, 40, 3, 71, 13),
(46, 'Statue', '130 av. J.-C.', 'Vénus de Médicis', 'Cléomène d Athènes', 2, 1, 21, 2, 60, 2),
(47, 'Frise', '1808', 'Arc de Triomphe du Carrousel', 'Charles Percier', 3, 3, 40, 3, 70, 3),
(48, 'Statue', '1965', 'Chicago Picasso', 'Pablo Picasso', 9, 6, 35, 6, 3, 16),
(49, 'Statue', '1200', 'Bouddha d Usuki', 'Sculpteur japonais', 7, 7, 15, 7, 4, 17),
(50, 'Statue', '1871', 'Monument aux morts de 1870', 'Antonin Mercié', 3, 3, 40, 3, 71, 13),
(51, 'Bas-relief', '-664', 'Lions de Délos', 'Sculpteurs des Cyclades', 2, 2, 30, 2, 61, 12),
(52, 'Statue', '1937', 'Guernica (sculpture)', 'Pablo Picasso', 9, 9, 12, 9, 1, 19),
(53, 'Statue', '1787', 'Pauline Borghèse en Vénus', 'Antonio Canova', 1, 1, 21, 1, 51, 11),
(54, 'Colonne', '1874', 'Colonne Morris', 'Gabriel Davioud', 3, 3, 40, 3, 70, 3),
(55, 'Statue', '1889', 'La Marseillaise', 'François Rude', 3, 3, 40, 3, 70, 3),
(56, 'Statue', '200 av. J.-C.', 'Laocoon et ses fils', 'Agésandros, Polydore et Athénodore', 2, 1, 20, 2, 60, 2),
(57, 'Frise', '1806', 'Arc de Triomphe de l Étoile', 'Jean Chalgrin', 3, 3, 40, 3, 70, 3),
(58, 'Statue', '1931', 'Persistence of Memory (sculpture)', 'Salvador Dalí', 9, 9, 12, 9, 1, 9),
(59, 'Statue', '1400', 'Bouddha de Todai-ji', 'Unkei', 7, 7, 15, 7, 4, 7),
(60, 'Statue', '1884', 'Monument à Claude Lorrain', 'Auguste Rodin', 3, 3, 40, 3, 71, 13),
(61, 'Bas-relief', '-1479', 'Temple de Deir el-Bahari', 'Architectes d Hatchepsout', 5, 5, 25, 5, 91, 15),
(62, 'Statue', '1793', 'Voltaire assis', 'Jean-Antoine Houdon', 3, 3, 40, 3, 70, 3),
(63, 'Statue', '1950', 'Femme debout', 'Alberto Giacometti', 3, 6, 35, 6, 3, 16),
(64, 'Colonne', '1840', 'Colonne de la Grande Armée', 'Jacques Gondouin', 3, 3, 40, 3, 70, 3),
(65, 'Statue', '1886', 'Les Ombres', 'Auguste Rodin', 3, 3, 40, 3, 71, 13),
(66, 'Statue', '120 av. J.-C.', 'Aphrodite de Milo', 'École de Rhodes', 2, 3, 40, 2, 61, 12),
(67, 'Frise', '1836', 'Arc de Triomphe de l Étoile (La Résistance)', 'Antoine Étex', 3, 3, 40, 3, 70, 3),
(68, 'Statue', '1960', 'Mujer', 'Joan Miró', 9, 9, 12, 9, 1, 19),
(69, 'Statue', '1300', 'Daibutsu de Nara', 'Kōkei', 7, 7, 15, 7, 4, 17),
(70, 'Statue', '1889', 'Monument à Gambetta', 'Jean-Paul Aubé', 3, 3, 40, 3, 71, 13),
(71, 'Bas-relief', '-1323', 'Sarcophage de Toutânkhamon', 'Artisan égyptien', 5, 5, 25, 5, 91, 15),
(72, 'Statue', '1741', 'L Amour menaçant', 'Étienne Maurice Falconet', 10, 8, 22, 10, 2, 10),
(73, 'Statue', '1967', 'Chicago Bean', 'Anish Kapoor', 6, 6, 35, 6, 3, 16),
(74, 'Colonne', '1882', 'Colonne de l Indépendance', 'Antonio Rivas Mercado', 9, 9, 12, 9, 1, 9),
(75, 'Statue', '1895', 'Monument à Honoré de Balzac', 'Auguste Rodin', 3, 3, 40, 3, 71, 13),
(76, 'Statue', '50 av. J.-C.', 'Auguste de Prima Porta', 'Sculpteur romain', 1, 1, 21, 1, 51, 11),
(77, 'Frise', '1863', 'Opéra de Paris (façade)', 'Charles Garnier', 3, 3, 40, 3, 70, 3),
(78, 'Statue', '1973', 'Dona i Ocell', 'Joan Miró', 9, 9, 12, 9, 1, 19),
(79, 'Statue', '1252', 'Grand Bouddha de Kamakura', 'Tanji Hisatomo', 7, 7, 15, 7, 4, 7),
(80, 'Statue', '1900', 'Monument à Victor Hugo (Guernesey)', 'Auguste Rodin', 4, 4, 10, 4, 81, 14),
(81, 'Bas-relief', '-1353', 'Buste de Néfertiti', 'Thoutmôsis', 5, 8, 22, 8, 5, 18),
(82, 'Statue', '1782', 'Le Cavalier de Bronze', 'Étienne Maurice Falconet', 10, 6, 35, 10, 2, 20),
(83, 'Statue', '1981', 'Spoonbridge and Cherry', 'Claes Oldenburg', 6, 6, 35, 6, 3, 16),
(84, 'Colonne', '1901', 'Colonne de la Paix', 'Charles-Louis Cordonnier', 3, 3, 40, 3, 70, 3),
(85, 'Statue', '1898', 'Monument aux Bourgeois de Calais', 'Auguste Rodin', 4, 4, 10, 4, 80, 4),
(86, 'Statue', '380 av. J.-C.', 'Hermès de Praxitèle', 'Praxitèle', 2, 2, 30, 2, 60, 2),
(87, 'Frise', '1875', 'Opéra Garnier (Grand Escalier)', 'Charles Garnier', 3, 3, 40, 3, 70, 3),
(88, 'Statue', '1983', 'Personnage et Oiseaux', 'Joan Miró', 9, 9, 12, 9, 1, 9),
(89, 'Statue', '1195', 'Bouddha de Tōdai-ji (réparation)', 'Kaikei', 7, 7, 15, 7, 4, 17),
(90, 'Statue', '1906', 'Monument à Alexandre Dumas père', 'Gustave Doré', 3, 3, 40, 3, 71, 13),
(91, 'Bas-relief', '-1290', 'Bataille de Qadesh', 'Artisans de Ramsès II', 5, 5, 25, 5, 91, 15),
(92, 'Statue', '1766', 'Pierre le Grand à cheval', 'Étienne Maurice Falconet', 10, 6, 35, 10, 2, 10),
(93, 'Statue', '1985', 'Tilted Arc', 'Richard Serra', 6, 6, 35, 6, 3, 16),
(94, 'Colonne', '1931', 'Colonne de l Indépendance (Mexico)', 'Antonio Rivas Mercado', 9, 9, 12, 9, 1, 19),
(95, 'Statue', '1917', 'Les Six Bourgeois de Calais', 'Auguste Rodin', 4, 4, 10, 4, 81, 14),
(96, 'Statue', '320 av. J.-C.', 'Apollon du Belvédère', 'Léocharès', 2, 1, 20, 2, 61, 12),
(97, 'Frise', '1889', 'Tour Eiffel (décorations)', 'Gustave Eiffel', 3, 3, 40, 3, 70, 3),
(98, 'Statue', '1992', 'Puppy', 'Jeff Koons', 9, 9, 12, 9, 1, 9),
(99, 'Statue', '1180', 'Niō de Tōdai-ji', 'Unkei et Kaikei', 7, 7, 15, 7, 4, 7),
(100, 'Statue', '1911', 'Monument à Chopin', 'Antoine Bourdelle', 3, 3, 40, 3, 71, 13);

-- Insertion des Info_statue (relation entre Statue et Ouvrage)


INSERT INTO Info_statue (NUMSTA, NUMOUV, NUMPAG) VALUES
-- Vénus de Milo dans plusieurs ouvrages
(1, 301, 45),
(1, 332, 123),
(1, 331, 67),

-- David de Michel-Ange
(2, 331, 89),
(2, 302, 156),
(2, 301, 78),

-- Frise du Parthénon
(3, 332, 234),
(3, 301, 145),
(3, 311, 67),

-- Statue de la Liberté
(4, 306, 23),
(4, 340, 145),
(4, 301, 189),

-- Le Penseur de Rodin
(6, 302, 234),
(6, 306, 89),
(6, 301, 167),

-- Grand Sphinx de Gizeh
(7, 333, 12),
(7, 301, 203),
(7, 334, 56),

-- Victoire de Samothrace
(8, 332, 178),
(8, 301, 134),
(8, 311, 89),

-- Apollon et Daphné de Bernini
(9, 331, 145),
(9, 302, 78),
(9, 301, 123),

-- Pietà de Michel-Ange
(11, 331, 67),
(11, 302, 189),
(11, 311, 145),

-- Discobole de Myron
(12, 332, 89),
(12, 301, 156),
(12, 334, 67),

-- Les Bourgeois de Calais
(13, 306, 167),
(13, 302, 234),
(13, 340, 78),

-- Statue de la République
(15, 306, 134),
(15, 340, 156),

-- Ouvrier et Kolkhozienne
(17, 338, 45),
(17, 306, 189),

-- Relief de Néfertiti
(19, 333, 78),
(19, 301, 145),

-- Moïse de Michel-Ange
(20, 331, 123),
(20, 302, 67),
(20, 311, 178),

-- Homme qui marche de Giacometti
(23, 308, 89),
(23, 340, 134),

-- Bouddha de Kamakura
(24, 305, 156),
(24, 325, 67),
(24, 330, 89),

-- Christ Rédempteur
(27, 340, 167),
(27, 306, 145),

-- Doryphore de Polyclète
(28, 332, 123),
(28, 301, 178),
(28, 334, 89),

-- Masque de Toutânkhamon
(30, 333, 234),
(30, 301, 67),

-- L'Oiseau dans l'espace de Brâncuși
(31, 308, 145),
(31, 340, 123),

-- Psyché de Canova
(32, 331, 189),
(32, 302, 156),

-- Korê de l'Acropole
(35, 332, 167),
(35, 301, 134),

-- Aphrodite de Cnide
(39, 332, 78),
(39, 301, 189),
(39, 334, 145),

-- La Porte de l'Enfer de Rodin
(40, 302, 123),
(40, 306, 167),

-- Relief d'Abou Simbel
(41, 333, 156),
(41, 301, 134),

-- Les Trois Grâces de Canova
(42, 331, 78),
(42, 302, 189),

-- Femme au chapeau de Picasso
(43, 308, 145),
(43, 340, 123),

-- Ugolin et ses fils de Carpeaux
(45, 302, 167),
(45, 306, 134),

-- Chicago Picasso
(48, 308, 189),
(48, 340, 156),

-- Bouddha d'Usuki
(49, 305, 78),
(49, 325, 145),
(49, 330, 123);

-- Insertion des Co_auteur (relation entre Ouvrage et Auteur)


INSERT INTO Co_auteur (NUMOUV, AUT) VALUES
-- Ouvrage 301: L'Art de la Sculpture Antique
(301, 201),  -- Jean Dubois (Expert en sculpture)
(301, 5),    -- Homer (spécialiste antiquité)

-- Ouvrage 302: Les Grands Sculpteurs de la Renaissance  
(302, 202),  -- Maria Rodriguez (Historienne de l'art)
(302, 7),    -- Machiavelli (Renaissance italienne)

-- Ouvrage 303: Sculpture Moderne : Tendances et Innovations
(303, 204),  -- Eleanor Vance (Conservatrice de musée)
(303, 17),   -- Orwell (modernité)

-- Ouvrage 304: Le Marbre et le Bronze : Techniques et Traditions
(304, 201),  -- Jean Dubois
(304, 205),  -- Hans Schmidt (Artiste contemporain)

-- Ouvrage 305: Sculpture Japonaise : L'Art de la Transformation
(305, 203),  -- Kenji Tanaka (Maître sculpteur)

-- Ouvrage 306: Les Statues de la Place Publique : Histoire et Symbolique
(306, 202),  -- Maria Rodriguez
(306, 1),    -- Albert Camus (philosophie de l'art)

-- Ouvrage 307: La Sculpture en Bois : Un Art Millénaire
(307, 203),  -- Kenji Tanaka
(307, 201),  -- Jean Dubois

-- Ouvrage 308: L'Art Abstrait en Sculpture : Exploration et Expérimentation
(308, 204),  -- Eleanor Vance
(308, 10),   -- Kafka (art moderne)

-- Ouvrage 309: Le Calcaire et la Pierre : Matières Premières de la Sculpture
(309, 201),  -- Jean Dubois
(309, 6),    -- Virgil (matériaux antiques)

-- Ouvrage 310: Sculpture Contemporaine en Asie : Dialogues et Influences
(310, 203),  -- Kenji Tanaka
(310, 202),  -- Maria Rodriguez

-- Ouvrage 311: La Sculpture Romane : Expression et Spiritualité
(311, 205),  -- Hans Schmidt
(311, 2),    -- Marcel Proust (spiritualité)

-- Ouvrage 312: Les Statues Équestres : Pouvoir et Représentation
(312, 202),  -- Maria Rodriguez
(312, 7),    -- Machiavelli (pouvoir politique)

-- Ouvrage 313: Sculpture en Fer : Métal et Créativité
(313, 205),  -- Hans Schmidt
(313, 19),   -- Mann (industrie allemande)

-- Ouvrage 314: Le Bronze et ses Techniques de Patine
(314, 201),  -- Jean Dubois
(314, 204),  -- Eleanor Vance

-- Ouvrage 315: Sculpture en Chine : Histoire et Esthétique
(315, 203),  -- Kenji Tanaka
(315, 8),    -- Dostoïevski (philosophie orientale)

-- Ouvrage 316: La Sculpture Précolombienne : Art et Rituels
(316, 202),  -- Maria Rodriguez
(316, 12),   -- Hemingway (Amérique)

-- Ouvrage 317: Les Statues Funéraires : Symboles et Croyances
(317, 204),  -- Eleanor Vance
(317, 14),   -- Poe (symbolisme de la mort)

-- Ouvrage 318: Sculpture en Argile : Simplicité et Expression
(318, 201),  -- Jean Dubois
(318, 16),   -- Brontë (simplicité expressive)

-- Ouvrage 319: Le Caravage et la Sculpture : Lumière et Ombre
(319, 202),  -- Maria Rodriguez
(319, 7),    -- Machiavelli (Renaissance)

-- Ouvrage 320: Sculpture en Corée : Tradition et Modernité
(320, 203),  -- Kenji Tanaka
(320, 205),  -- Hans Schmidt

-- Ouvrage 321: Les Statues de Cire : Un Art Éphémère
(321, 204),  -- Eleanor Vance
(321, 18),   -- Woolf (art éphémère)

-- Ouvrage 322: Les Statues en Pierre Tombale : Mémoire et Deuil
(322, 201),  -- Jean Dubois
(322, 1),    -- Albert Camus (absurdité de la mort)

-- Ouvrage 323: Sculpture en Verre : Fragilité et Transparence
(323, 205),  -- Hans Schmidt
(323, 10),   -- Kafka (fragilité moderne)

-- Ouvrage 324: Le Sculpteurs et le Commanditaire : Relations et Influences
(324, 202),  -- Maria Rodriguez

-- Ouvrage 325: Sculpture en Thaïlande : Bouddha et Art Royal
(325, 203),  -- Kenji Tanaka
(325, 5),    -- Homer (tradition épique)

-- Ouvrage 326: Les Statues de Jardin : Beauté et Nature
(326, 204),  -- Eleanor Vance
(326, 4),    -- Jane Austen (beauté domestique)

-- Ouvrage 327: Les Statues de Ciment : Un Art Populaire
(327, 201),  -- Jean Dubois
(327, 15),   -- Dickens (art populaire)

-- Ouvrage 328: Sculpture en Plastique : Nouveaux Matériaux et Formes
(328, 205),  -- Hans Schmidt
(328, 17),   -- Orwell (modernité industrielle)

-- Ouvrage 329: Le Sculpteurs et la Couleur : Pigments et Techniques
(329, 202),  -- Maria Rodriguez
(329, 11),   -- Joyce (couleurs littéraires)

-- Ouvrage 330: Sculpture en Indonésie : Diversité Culturelle et Artistique
(330, 203),  -- Kenji Tanaka
(330, 13),   -- Fitzgerald (diversité américaine)

-- Ouvrage 331: Les Statues de la Renaissance Italienne
(331, 202),  -- Maria Rodriguez
(331, 7),    -- Machiavelli
(331, 6),    -- Virgil (tradition classique)

-- Ouvrage 332: Les Statues de la Grèce Antique
(332, 201),  -- Jean Dubois
(332, 5),    -- Homer
(332, 204),  -- Eleanor Vance

-- Ouvrage 333: Les Statues de l'Égypte Ancienne
(333, 202),  -- Maria Rodriguez
(333, 8),    -- Dostoïevski (mystique orientale)

-- Ouvrage 334: Les Statues de la Rome Antique
(334, 201),  -- Jean Dubois
(334, 6),    -- Virgil
(334, 7),    -- Machiavelli

-- Ouvrage 335: Les Statues de l'Empire Mongol
(335, 203),  -- Kenji Tanaka
(335, 9),    -- Tolstoï (Empire russe)

-- Ouvrage 336: L'Art de la Sculpture en Chine
(336, 203),  -- Kenji Tanaka
(336, 205),  -- Hans Schmidt

-- Ouvrage 337: L'Art de la Sculpture en Inde
(337, 202),  -- Maria Rodriguez
(337, 5),    -- Homer (épopées indiennes)

-- Ouvrage 338: L'Art de la Sculpture en Russie
(338, 201),  -- Jean Dubois
(338, 8),    -- Dostoïevski
(338, 9),    -- Tolstoï

-- Ouvrage 339: L'Art de la Sculpture en Afrique
(339, 204),  -- Eleanor Vance
(339, 12),   -- Hemingway (Afrique)

-- Ouvrage 340: L'Art de la Sculpture en Amérique
(340, 202),  -- Maria Rodriguez
(340, 12),   -- Hemingway
(340, 13),   -- Fitzgerald
(340, 14);   -- Poe



