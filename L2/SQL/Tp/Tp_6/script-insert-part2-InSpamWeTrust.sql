-- Table ADRFROM (30 adresses from)
INSERT INTO ADRFROM (IdFROM, TXT, CAT) VALUES
(1, 'luc<luc@wanado.fr>', 'perso'),
(2, 'Marie Dupré<md@freee.fr>', 'perso'),
(3, 'contact<contact@BNPs.com>', 'banque'),
(4, 'service.client<sc@loteuro.com>', 'loterie'),
(5, 'famille.martin<fm@gmail.com>', 'famille'),
(6, 'pierre.durant<pd@yahoo.fr>', 'perso'),
(7, 'info<info@banque-france.fr>', 'banque'),
(8, 'gagnant<win@loterie-nationale.fr>', 'loterie'),
(9, 'maman<maman@familledurand.fr>', 'famille'),
(10, 'sophie<sophie.l@hotmail.fr>', 'perso'),
(11, 'service<service@credit-agricole.fr>', 'banque'),
(12, 'tirage<tirage@euro-millions.eu>', 'loterie'),
(13, 'papa<papa.robert@orange.fr>', 'famille'),
(14, 'jean.martin<jm@laposte.net>', 'perso'),
(15, 'alerte<alerte@sg.fr>', 'banque'),
(16, 'congratulations<congrats@prizes.com>', 'loterie'),
(17, 'tante.marie<tm@wanadoo.fr>', 'famille'),
(18, 'contact<contact@particulier.fr>', 'perso'),
(19, 'notification<notif@bnp-paribas.fr>', 'banque'),
(20, 'jackpot<jackpot@mega-loto.com>', 'loterie'),
(21, 'cousin.paul<cp@gmail.com>', 'famille'),
(22, 'nicolas<nicolas.b@free.fr>', 'perso'),
(23, 'securite<secu@lcl.fr>', 'banque'),
(24, 'winner<winner@super-loto.fr>', 'loterie'),
(25, 'grand-mere<gm@familleroy.fr>', 'famille'),
(26, 'amelie<amelie.k@sfr.fr>', 'perso'),
(27, 'support<support@caisse-epargne.fr>', 'banque'),
(28, 'prize<prize@lottery-world.com>', 'loterie'),
(29, 'oncle.jacques<oj@outlook.fr>', 'famille'),
(30, 'thomas<thomas.v@numericable.fr>', 'perso');


-- ============================================
-- ASSOCIATIONS CO_FROM (chaque contrat utilise au moins 20 from)
-- ============================================
-- Contrat 1: utilise les from 1 à 22
INSERT INTO CO_FROM (IdCO, IdFROM) VALUES
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 6), (1, 7), (1, 8), (1, 9), (1, 10),
(1, 11), (1, 12), (1, 13), (1, 14), (1, 15), (1, 16), (1, 17), (1, 18), (1, 19), (1, 20),
(1, 21), (1, 22);

-- Contrat 2: utilise les from 2 à 23
INSERT INTO CO_FROM (IdCO, IdFROM) VALUES
(2, 2), (2, 3), (2, 4), (2, 5), (2, 6), (2, 7), (2, 8), (2, 9), (2, 10), (2, 11),
(2, 12), (2, 13), (2, 14), (2, 15), (2, 16), (2, 17), (2, 18), (2, 19), (2, 20), (2, 21),
(2, 22), (2, 23);

-- Contrat 3: utilise les from 3 à 24
INSERT INTO CO_FROM (IdCO, IdFROM) VALUES
(3, 3), (3, 4), (3, 5), (3, 6), (3, 7), (3, 8), (3, 9), (3, 10), (3, 11), (3, 12),
(3, 13), (3, 14), (3, 15), (3, 16), (3, 17), (3, 18), (3, 19), (3, 20), (3, 21), (3, 22),
(3, 23), (3, 24);

-- Contrat 4: utilise les from 4 à 25
INSERT INTO CO_FROM (IdCO, IdFROM) VALUES
(4, 4), (4, 5), (4, 6), (4, 7), (4, 8), (4, 9), (4, 10), (4, 11), (4, 12), (4, 13),
(4, 14), (4, 15), (4, 16), (4, 17), (4, 18), (4, 19), (4, 20), (4, 21), (4, 22), (4, 23),
(4, 24), (4, 25);

-- Contrat 5: utilise les from 5 à 26
INSERT INTO CO_FROM (IdCO, IdFROM) VALUES
(5, 5), (5, 6), (5, 7), (5, 8), (5, 9), (5, 10), (5, 11), (5, 12), (5, 13), (5, 14),
(5, 15), (5, 16), (5, 17), (5, 18), (5, 19), (5, 20), (5, 21), (5, 22), (5, 23), (5, 24),
(5, 25), (5, 26);

-- Contrat 6: utilise les from 6 à 27
INSERT INTO CO_FROM (IdCO, IdFROM) VALUES
(6, 6), (6, 7), (6, 8), (6, 9), (6, 10), (6, 11), (6, 12), (6, 13), (6, 14), (6, 15),
(6, 16), (6, 17), (6, 18), (6, 19), (6, 20), (6, 21), (6, 22), (6, 23), (6, 24), (6, 25),
(6, 26), (6, 27);

-- Contrat 7: utilise les from 7 à 28
INSERT INTO CO_FROM (IdCO, IdFROM) VALUES
(7, 7), (7, 8), (7, 9), (7, 10), (7, 11), (7, 12), (7, 13), (7, 14), (7, 15), (7, 16),
(7, 17), (7, 18), (7, 19), (7, 20), (7, 21), (7, 22), (7, 23), (7, 24), (7, 25), (7, 26),
(7, 27), (7, 28);

-- Contrat 8: utilise les from 8 à 29
INSERT INTO CO_FROM (IdCO, IdFROM) VALUES
(8, 8), (8, 9), (8, 10), (8, 11), (8, 12), (8, 13), (8, 14), (8, 15), (8, 16), (8, 17),
(8, 18), (8, 19), (8, 20), (8, 21), (8, 22), (8, 23), (8, 24), (8, 25), (8, 26), (8, 27),
(8, 28), (8, 29);

-- Contrat 9: utilise les from 9 à 30
INSERT INTO CO_FROM (IdCO, IdFROM) VALUES
(9, 9), (9, 10), (9, 11), (9, 12), (9, 13), (9, 14), (9, 15), (9, 16), (9, 17), (9, 18),
(9, 19), (9, 20), (9, 21), (9, 22), (9, 23), (9, 24), (9, 25), (9, 26), (9, 27), (9, 28),
(9, 29), (9, 30);

-- Contrat 10: utilise les from 1 à 22
INSERT INTO CO_FROM (IdCO, IdFROM) VALUES
(10, 1), (10, 2), (10, 3), (10, 4), (10, 5), (10, 6), (10, 7), (10, 8), (10, 9), (10, 10),
(10, 11), (10, 12), (10, 13), (10, 14), (10, 15), (10, 16), (10, 17), (10, 18), (10, 19), (10, 20),
(10, 21), (10, 22);

-- Contrat 11: utilise les from 3 à 24
INSERT INTO CO_FROM (IdCO, IdFROM) VALUES
(11, 3), (11, 4), (11, 5), (11, 6), (11, 7), (11, 8), (11, 9), (11, 10), (11, 11), (11, 12),
(11, 13), (11, 14), (11, 15), (11, 16), (11, 17), (11, 18), (11, 19), (11, 20), (11, 21), (11, 22),
(11, 23), (11, 24);

-- Contrat 12: utilise les from 5 à 26
INSERT INTO CO_FROM (IdCO, IdFROM) VALUES
(12, 5), (12, 6), (12, 7), (12, 8), (12, 9), (12, 10), (12, 11), (12, 12), (12, 13), (12, 14),
(12, 15), (12, 16), (12, 17), (12, 18), (12, 19), (12, 20), (12, 21), (12, 22), (12, 23), (12, 24),
(12, 25), (12, 26);

-- Contrat 13: utilise les from 7 à 28
INSERT INTO CO_FROM (IdCO, IdFROM) VALUES
(13, 7), (13, 8), (13, 9), (13, 10), (13, 11), (13, 12), (13, 13), (13, 14), (13, 15), (13, 16),
(13, 17), (13, 18), (13, 19), (13, 20), (13, 21), (13, 22), (13, 23), (13, 24), (13, 25), (13, 26),
(13, 27), (13, 28);

-- Contrat 14: utilise les from 2 à 23
INSERT INTO CO_FROM (IdCO, IdFROM) VALUES
(14, 2), (14, 3), (14, 4), (14, 5), (14, 6), (14, 7), (14, 8), (14, 9), (14, 10), (14, 11),
(14, 12), (14, 13), (14, 14), (14, 15), (14, 16), (14, 17), (14, 18), (14, 19), (14, 20), (14, 21),
(14, 22), (14, 23);

-- Contrat 15: utilise les from 4 à 25
INSERT INTO CO_FROM (IdCO, IdFROM) VALUES
(15, 4), (15, 5), (15, 6), (15, 7), (15, 8), (15, 9), (15, 10), (15, 11), (15, 12), (15, 13),
(15, 14), (15, 15), (15, 16), (15, 17), (15, 18), (15, 19), (15, 20), (15, 21), (15, 22), (15, 23),
(15, 24), (15, 25);

-- Contrat 16: utilise les from 6 à 27
INSERT INTO CO_FROM (IdCO, IdFROM) VALUES
(16, 6), (16, 7), (16, 8), (16, 9), (16, 10), (16, 11), (16, 12), (16, 13), (16, 14), (16, 15),
(16, 16), (16, 17), (16, 18), (16, 19), (16, 20), (16, 21), (16, 22), (16, 23), (16, 24), (16, 25),
(16, 26), (16, 27);

-- Contrat 17: utilise les from 8 à 29
INSERT INTO CO_FROM (IdCO, IdFROM) VALUES
(17, 8), (17, 9), (17, 10), (17, 11), (17, 12), (17, 13), (17, 14), (17, 15), (17, 16), (17, 17),
(17, 18), (17, 19), (17, 20), (17, 21), (17, 22), (17, 23), (17, 24), (17, 25), (17, 26), (17, 27),
(17, 28), (17, 29);

-- Contrat 18: utilise les from 1 à 22
INSERT INTO CO_FROM (IdCO, IdFROM) VALUES
(18, 1), (18, 2), (18, 3), (18, 4), (18, 5), (18, 6), (18, 7), (18, 8), (18, 9), (18, 10),
(18, 11), (18, 12), (18, 13), (18, 14), (18, 15), (18, 16), (18, 17), (18, 18), (18, 19), (18, 20),
(18, 21), (18, 22);

-- Contrat 19: utilise les from 9 à 30
INSERT INTO CO_FROM (IdCO, IdFROM) VALUES
(19, 9), (19, 10), (19, 11), (19, 12), (19, 13), (19, 14), (19, 15), (19, 16), (19, 17), (19, 18),
(19, 19), (19, 20), (19, 21), (19, 22), (19, 23), (19, 24), (19, 25), (19, 26), (19, 27), (19, 28),
(19, 29), (19, 30);

-- Contrat 20: utilise les from 3 à 24
INSERT INTO CO_FROM (IdCO, IdFROM) VALUES
(20, 3), (20, 4), (20, 5), (20, 6), (20, 7), (20, 8), (20, 9), (20, 10), (20, 11), (20, 12),
(20, 13), (20, 14), (20, 15), (20, 16), (20, 17), (20, 18), (20, 19), (20, 20), (20, 21), (20, 22),
(20, 23), (20, 24);
