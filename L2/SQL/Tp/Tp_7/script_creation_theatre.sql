-- =======================================================================================
--  BASE THÉÂTRES – script complet (données d'origine + données complémentaires)
--  PostgreSQL
-- =======================================================================================

drop table if exists co_auteurs;
drop table if exists acteurs_rep;
drop table if exists acteurs_troupe;
drop table if exists representation;
drop table if exists spectacle;
drop table if exists troupe;
drop table if exists piece;
drop table if exists theatre;
drop table if exists personne;

create table personne (id_personne numeric(4), nom varchar(30), 
constraint pers_key Primary Key (id_personne));
insert into personne values (15, 'Moliere');
insert into personne values (16, 'Shakespeare');
insert into personne values (17, 'Novarina');
insert into personne values (18, 'Ribbes');
insert into personne values (19, 'Feydeau');
insert into personne values (20, 'Claudel');
insert into personne values (61, 'Jean dici');
insert into personne values (62, 'John touvu');
insert into personne values (63, 'Gerard Dumas');
insert into personne values (153, 'Dominique Fataccioli');
insert into personne values (154, 'Guy Deluc');
insert into personne values (155, 'Gerard Gelas');
insert into personne values (156, 'Serge Barbuscia');
insert into personne values (157, 'Jean Deluc');
insert into personne values (110, 'Guillaume Depardieu');
insert into personne values (111, 'Romane Borhinger');
insert into personne values (112, 'Patrick Bruel');
insert into personne values (113, 'Jean Naiplu');
insert into personne values (114, 'Georges Jungle');
insert into personne values (115, 'Eric Mozart');
insert into personne values (116, 'Gerard Depardieu');

create table theatre( id_theatre numeric(4) , nom varchar(30) , adresse varchar(50), telephone numeric(10), id_personne numeric(4), 
constraint theatre_key Primary Key(id_theatre),
CONSTRAINT id_personne_exists
FOREIGN KEY(id_personne) REFERENCES personne
);
insert into theatre values (53, 'Le Bourg Neuf', '3, rue du Bourg Neuf', '0490657132', 153);
insert into theatre values (55, 'Les Lucioles', '10, rue Saint Lazarre', '0432758964', 153);
insert into theatre values (61, 'Le Chene Noir', '82, rue Sainte Catherine', '0490864178', 155);
insert into theatre values (62, 'Le Balcon', '112, rue Guillaume Puy', '0432654125', 156);

create table piece  (id_piece numeric(4), nom varchar(30) , genre varchar(20) ,  
constraint piece_key Primary Key (id_piece)
);
insert into piece values (342, 'Don Juan', 'Comedie');
insert into piece values (356, 'The return of Scaramouche', 'Comedie');
insert into piece values (473, 'Le dindon', 'Vaudeville');
insert into piece values (503, 'Romeo et Juliette', 'Tragedie');
insert into piece values (504, 'Othello','Tragedie');
insert into piece values (505, 'Le songe d une nuit d ete', 'Comedie');
insert into piece values (472, 'Un fil a la patte', 'Vaudeville');
insert into piece values (653, 'Duel', 'Musical');
insert into piece values (455, 'Le tour complet du coeur', 'Theatre de rue');
insert into piece values (543, 'Guantanamour', 'Tragedie');

create table troupe (id_troupe numeric(4), nom varchar(30), id_personne numeric(4), ville varchar(20), adresse varchar(50), 
constraint troupe_key Primary Key (id_troupe),
CONSTRAINT id_personne_exists
FOREIGN KEY(id_personne) REFERENCES personne

);

insert into troupe values (2, 'Les dindons d Avignon', 61, 'Avignon', '3, rue de la Republique');
insert into troupe values (3, 'Le grand mix', 62, 'Paris', '39, avenue des Champs Elysees');
insert into troupe values (4, 'La compagnie du Chameau', 63, 'Marseille', '6, route des calanques');
insert into troupe values (5, 'Les virtuoses', 61 , 'Paris', '');
insert into troupe values (6, 'Le chene noir', 155, 'Avignon', 'theatre du chene noir');

create table spectacle (id_spectacle numeric(4) NOT NULL , id_troupe numeric(4) NOT NULL, id_piece numeric(4) NOT NULL , id_personne numeric(4) NOT NULL , 
constraint spect_key Primary Key (id_spectacle),
CONSTRAINT id_piece_exists
FOREIGN KEY(id_piece) REFERENCES piece,
CONSTRAINT id_troupe_exists
FOREIGN KEY(id_troupe) REFERENCES troupe,
CONSTRAINT id_personne_exists
FOREIGN KEY(id_personne) REFERENCES personne
);

insert into spectacle values (1120, 2, 473, 63);
insert into spectacle values (1435, 5, 653, 63);
insert into spectacle values (1344, 5, 543, 113);
insert into spectacle values (1290, 2, 504, 61);
insert into spectacle values (1250, 4, 505, 156);

create table representation (id_spectacle numeric(4) NOT NULL, annee numeric(4) NOT NULL, id_theatre numeric(4) NOT NULL, 
constraint rep_key Primary Key (id_spectacle, annee),
CONSTRAINT id_spectacle_exists
FOREIGN KEY(id_spectacle) REFERENCES spectacle,
CONSTRAINT id_theatre_exists
FOREIGN KEY(id_theatre) REFERENCES theatre
);

insert into representation values (1435, 2015, 62); 
insert into representation values (1435, 2017, 62);
insert into representation values (1344, 2016, 61);
insert into representation values (1290, 2014, 53); 
insert into representation values (1290, 2015, 53);
insert into representation values (1290, 2016, 55);
insert into representation values (1120, 2013, 55); 
insert into representation values (1250, 2013, 55);
insert into representation values (1250, 2016, 62);

create table co_auteurs ( id_piece numeric(4), id_personne numeric(4), 
constraint co_key Primary Key (id_piece, id_personne),
CONSTRAINT id_piece_exists
FOREIGN KEY(id_piece) REFERENCES piece,
CONSTRAINT id_personne_exists
FOREIGN KEY(id_personne) REFERENCES personne
);

insert into co_auteurs values (342, 15);
insert into co_auteurs values (356, 15);
insert into co_auteurs values (356, 16);
insert into co_auteurs values (472, 19);
insert into co_auteurs values (473, 19);
insert into co_auteurs values (543, 155);
insert into co_auteurs values (503, 16);
insert into co_auteurs values (504, 16);
insert into co_auteurs values (505, 16);
insert into co_auteurs values (653, 61);
insert into co_auteurs values (653, 62);
insert into co_auteurs values (543, 61);
insert into co_auteurs values (543, 62);

create table acteurs_rep (id_spectacle numeric(4) NOT NULL, annee numeric(4) NOT NULL, id_personne numeric(4), 
constraint acteurs_rep_key Primary Key (id_spectacle, annee, id_personne),
CONSTRAINT id_spect_annee_exists
FOREIGN KEY(id_spectacle, annee) REFERENCES representation,
CONSTRAINT id_personne_exists
FOREIGN KEY(id_personne) REFERENCES personne
);

insert into acteurs_rep values (1435, 2015, 154);
insert into acteurs_rep values (1435, 2015, 155);
insert into acteurs_rep values (1435, 2015, 156);
insert into acteurs_rep values (1435, 2017, 154);
insert into acteurs_rep values (1435, 2017, 155);
insert into acteurs_rep values (1435, 2017, 157);
insert into acteurs_rep values (1344, 2016, 61);
insert into acteurs_rep values (1344, 2016, 62);
insert into acteurs_rep values (1344, 2016, 155);
insert into acteurs_rep values (1344, 2016, 154);
insert into acteurs_rep values (1290, 2014, 111);
insert into acteurs_rep values (1290, 2014, 115);
insert into acteurs_rep values (1290, 2015, 111);
insert into acteurs_rep values (1290, 2015, 116);
insert into acteurs_rep values (1290, 2016, 111);
insert into acteurs_rep values (1290, 2016, 116);
insert into acteurs_rep values (1120, 2013, 111);
insert into acteurs_rep values (1250, 2013, 111);
insert into acteurs_rep values (1250, 2013, 155);
insert into acteurs_rep values (1250, 2013, 153);
insert into acteurs_rep values (1250, 2013, 63);
insert into acteurs_rep values (1250, 2013, 113);
insert into acteurs_rep values (1250, 2016, 115);
insert into acteurs_rep values (1250, 2016, 18);
insert into acteurs_rep values (1250, 2016, 61);
insert into acteurs_rep values (1250, 2016, 62);
insert into acteurs_rep values (1250, 2016, 113);

create table acteurs_troupe (id_troupe numeric(4) NOT NULL, id_personne numeric(4), 
constraint acteurs_tr_key Primary Key (id_troupe, id_personne),
CONSTRAINT id_troupe_exists
FOREIGN KEY(id_troupe) REFERENCES troupe,
CONSTRAINT id_personne_exists
FOREIGN KEY(id_personne) REFERENCES personne
);

insert into acteurs_troupe values (2,111);
insert into acteurs_troupe values (2,115);
insert into acteurs_troupe values (2,116);
insert into acteurs_troupe values (5,154);
insert into acteurs_troupe values (5,155);
insert into acteurs_troupe values (5,156);
insert into acteurs_troupe values (5,157);
insert into acteurs_troupe values (5,61);
insert into acteurs_troupe values (5,62);
insert into acteurs_troupe values (4,111);
insert into acteurs_troupe values (4,155);
insert into acteurs_troupe values (4,153);
insert into acteurs_troupe values (4,113);
insert into acteurs_troupe values (4,115);
insert into acteurs_troupe values (4,18);
insert into acteurs_troupe values (4,61);
insert into acteurs_troupe values (4,62);
insert into acteurs_troupe values (4,63);
insert into acteurs_troupe values (3,110);
insert into acteurs_troupe values (3,111);
insert into acteurs_troupe values (3,112);
insert into acteurs_troupe values (3,113);
insert into acteurs_troupe values (6,61);
insert into acteurs_troupe values (6,62);
insert into acteurs_troupe values (6,63);
insert into acteurs_troupe values (6,110);

-- =======================================================================================
--  DONNÉES COMPLÉMENTAIRES (TP Théâtre – version fusionnée TP4 + TP5)
--  À exécuter APRÈS les données d'origine.
-- =======================================================================================

-- ---------------------------------------------------------------------------------------
-- PERSONNES
-- ---------------------------------------------------------------------------------------
insert into personne values (21,  'Tchekhov');
insert into personne values (117, 'Gérard Lefranc');
insert into personne values (118, 'Jeanne Varlet');
insert into personne values (119, 'Jean-Pierre Coste');
insert into personne values (120, 'Marie Martin');
insert into personne values (121, 'Marie Martin');
insert into personne values (122, 'Lucie Bonnaud');
insert into personne values (123, 'Paul Roche');
insert into personne values (124, 'Ines Belkacem');
insert into personne values (125, 'Hugo Ferrand');
insert into personne values (126, 'Claire Daumas');
insert into personne values (127, 'gerard Vidal');
insert into personne values (158, 'Sophie Arnaud');

-- ---------------------------------------------------------------------------------------
-- THÉÂTRES
-- ---------------------------------------------------------------------------------------
insert into theatre values (63, 'La Manufacture', '2, rue des Ecoles', '0490851290', NULL);
insert into theatre values (64, 'Le Petit Louvre', '23, rue Saint Agricol', '0490862327', 158);

-- ---------------------------------------------------------------------------------------
-- PIÈCES
-- ---------------------------------------------------------------------------------------
insert into piece values (506, 'La Mouette', 'Comedie');
insert into piece values (507, 'Creation collective', NULL);

-- ---------------------------------------------------------------------------------------
-- TROUPES
-- ---------------------------------------------------------------------------------------
insert into troupe values (7, 'Les nouveaux venus', 122, 'Avignon', NULL);
insert into troupe values (8, 'Le Rideau Rouge', 120, 'Lyon', '14, quai Saint Antoine');

-- ---------------------------------------------------------------------------------------
-- SPECTACLES  (id_spectacle, id_troupe, id_piece, id_personne = metteur en scène)
-- ---------------------------------------------------------------------------------------
insert into spectacle values (1500, 3, 505, 112);
insert into spectacle values (1550, 2, 504, 116);
insert into spectacle values (1600, 6, 455, 155);
insert into spectacle values (1700, 8, 506, 120);
insert into spectacle values (1800, 8, 507, 121);
insert into spectacle values (1900, 4, 472, 63);

-- ---------------------------------------------------------------------------------------
-- REPRÉSENTATIONS  (id_spectacle, annee, id_theatre)
-- ---------------------------------------------------------------------------------------
insert into representation values (1500, 2017, 63);
insert into representation values (1600, 2016, 61);
insert into representation values (1600, 2017, 63);
insert into representation values (1700, 2016, 63);
insert into representation values (1700, 2017, 63);
insert into representation values (1700, 2018, 53);
insert into representation values (1900, 2017, 55);

-- ---------------------------------------------------------------------------------------
-- ACTEURS DES REPRÉSENTATIONS
-- ---------------------------------------------------------------------------------------
insert into acteurs_rep values (1290, 2014, 154);
insert into acteurs_rep values (1290, 2015, 115);

-- 1600 (troupe 6, Theatre de rue)
insert into acteurs_rep values (1600, 2016, 155);
insert into acteurs_rep values (1600, 2016, 61);
insert into acteurs_rep values (1600, 2016, 62);
insert into acteurs_rep values (1600, 2016, 110);
insert into acteurs_rep values (1600, 2016, 157);
insert into acteurs_rep values (1600, 2017, 155);
insert into acteurs_rep values (1600, 2017, 63);
insert into acteurs_rep values (1600, 2017, 110);
insert into acteurs_rep values (1600, 2017, 118);

-- 1700 (troupe 8, La Mouette)
insert into acteurs_rep values (1700, 2016, 120);
insert into acteurs_rep values (1700, 2016, 121);
insert into acteurs_rep values (1700, 2016, 123);
insert into acteurs_rep values (1700, 2016, 124);
insert into acteurs_rep values (1700, 2016, 125);
insert into acteurs_rep values (1700, 2016, 117);
insert into acteurs_rep values (1700, 2017, 120);
insert into acteurs_rep values (1700, 2017, 121);
insert into acteurs_rep values (1700, 2017, 123);
insert into acteurs_rep values (1700, 2017, 126);
insert into acteurs_rep values (1700, 2018, 125);

-- 1900 (troupe 4, Un fil a la patte – Vaudeville)
insert into acteurs_rep values (1900, 2017, 155);
insert into acteurs_rep values (1900, 2017, 113);
insert into acteurs_rep values (1900, 2017, 119);

-- ---------------------------------------------------------------------------------------
-- ACTEURS DES TROUPES
-- ---------------------------------------------------------------------------------------
insert into acteurs_troupe values (8, 120);
insert into acteurs_troupe values (8, 121);
insert into acteurs_troupe values (8, 123);
insert into acteurs_troupe values (8, 124);
insert into acteurs_troupe values (8, 125);
insert into acteurs_troupe values (8, 117);
insert into acteurs_troupe values (6, 118);
insert into acteurs_troupe values (4, 119);

-- ---------------------------------------------------------------------------------------
-- CO-AUTEURS
-- ---------------------------------------------------------------------------------------
insert into co_auteurs values (506, 21);
insert into co_auteurs values (455, 155);
insert into co_auteurs values (507, 120);
insert into co_auteurs values (507, 121);
