-- cleanup
DROP TABLE IF EXISTS interp;
DROP TABLE IF EXISTS leader;
DROP TABLE IF EXISTS compo;
DROP TABLE IF EXISTS enreg;
DROP TABLE IF EXISTS cd;
DROP TABLE IF EXISTS edition;
DROP TABLE IF EXISTS individu;

-- create tables
CREATE TABLE individu (
 id_ind numeric(6,0),
 nom character varying(30) NOT NULL,
 prenom character varying(30),
 date_nais Date,
  date_deces Date,
 nation character varying(30),
 CONSTRAINT individu_key PRIMARY KEY(id_ind)
);

CREATE TABLE edition (
 id_edition  numeric(6,0),
 nom   character varying(30) NOT NULL,
 id_directeur     numeric(6,0),
 pays   character varying(30),
 CONSTRAINT edition_key PRIMARY KEY(id_edition),
 CONSTRAINT id_directeur_exists
 FOREIGN KEY(id_directeur) REFERENCES individu(id_ind)
);

CREATE TABLE cd (
 id_cd numeric(6,0),
 titre_cd character varying(60),
 id_edition  numeric(6,0),
 note_art numeric(2),
 note_tech  numeric(2),
 CONSTRAINT cd_key PRIMARY KEY(id_cd),
 CONSTRAINT id_edition_exists
 FOREIGN KEY(id_edition) REFERENCES edition
);

CREATE TABLE enreg(
 id_cd numeric(6,0),
 id_enr  numeric(6,0),
 titre_enr character varying(60),
 duree_enr numeric(6,0),
 annee_enr numeric(6,0),
 lieu_enr character varying(50),
 cond_enr  character varying(60),
 CONSTRAINT enreg_key PRIMARY KEY(id_cd,id_enr),
 CONSTRAINT id_cd_exists
 FOREIGN KEY(id_cd) REFERENCES cd
);
 
CREATE TABLE interp (
 id_cd numeric(6,0),
 id_enr  numeric(6,0),
 id_musicien numeric(6,0),
 instrument  character varying(30) not null,
 CONSTRAINT interp_key PRIMARY KEY(id_cd, id_enr, id_musicien, instrument),
 CONSTRAINT id_cd_exists
 FOREIGN KEY(id_cd) REFERENCES cd,
 CONSTRAINT id_enr_exists
 FOREIGN KEY(id_cd,id_enr) REFERENCES enreg,
 CONSTRAINT id_musicien_exists
 FOREIGN KEY(id_musicien) REFERENCES individu(id_ind)
);
 
CREATE TABLE leader (
 id_cd numeric(6,0),
 id_musicien  numeric(6,0),
 CONSTRAINT leader_key PRIMARY KEY(id_cd, id_musicien),
 CONSTRAINT id_cd_exists
 FOREIGN KEY(id_cd) REFERENCES cd,
 CONSTRAINT id_musicien_exists
 FOREIGN KEY(id_musicien) REFERENCES individu(id_ind)
);
 
CREATE TABLE compo (
 id_cd numeric(6,0),
 id_enr  numeric(6,0),
 id_musicien  numeric(6,0),
 CONSTRAINT compo_key PRIMARY KEY(id_enr, id_cd, id_musicien),
 CONSTRAINT id_enr_exists
 FOREIGN KEY(id_cd,id_enr) REFERENCES enreg,
 CONSTRAINT id_musicien_exists
 FOREIGN KEY(id_musicien) REFERENCES individu(id_ind)
);
 
-- fill in data
INSERT INTO individu VALUES (100001, 'Coltrane', 'John', '1926-09-23', '1967-07-17', 'USA');
INSERT INTO individu VALUES (100002, 'Davis', 'Miles', '1926-05-26', '1991-09-28', 'USA');
INSERT INTO individu VALUES (100003, 'Hancock', 'Herbie', '1940-04-12', NULL, 'USA');
INSERT INTO individu VALUES (100004, 'Evans', 'Bill', '1929-08-16', '1980-09-15', 'USA');
INSERT INTO individu VALUES (100005, 'Petrucciani', 'Michel', '1962-12-28', '1999-01-06', 'France');
INSERT INTO individu VALUES (100006, 'Rollins', 'Sonny', '1930-09-07', NULL, 'USA');
INSERT INTO individu VALUES (100007, 'Cherry', 'Don', '1936-11-18', '1995-12-19', 'USA');
INSERT INTO individu VALUES (100008, 'Parker', 'Charlie', '1920-08-29', '1955-03-12', 'USA');
INSERT INTO individu VALUES (100009, 'Blakey', 'Art', '1919-10-11', '1990-10-16', 'USA');
INSERT INTO individu VALUES (100010, 'Shorter', 'Wayne', '1933-08-25', '2023-03-02', 'USA');
INSERT INTO individu VALUES (100011, 'Mingus', 'Charles', '1922-04-22', '1979-01-05', 'USA');
INSERT INTO individu VALUES (100012, 'Corea', 'Chick', '1941-06-12', '2021-02-09', 'USA');
INSERT INTO individu VALUES (100013, 'Pastorius', 'Jaco', '1951-12-01', '1987-09-21', 'USA');
INSERT INTO individu VALUES (100014, 'Metheny', 'Pat', '1954-08-12', NULL, 'USA');
INSERT INTO individu VALUES (100015, 'Jarrett', 'Keith', '1945-05-08', NULL, 'USA');
INSERT INTO individu VALUES (100016, 'Getz', 'Stan', '1927-02-02', '1991-06-06', 'USA');
INSERT INTO individu VALUES (100017, 'Miles', 'Tina', '1928-05-19', NULL,'UK');
INSERT INTO individu VALUES (100018, 'Motian', 'Paul', '1931-03-25', '2011-11-22', 'USA');
INSERT INTO individu VALUES (100019, 'Redman', 'Joshua', '1969-02-01', NULL, 'USA');
INSERT INTO individu VALUES (100020, 'Lovano', 'Joe', '1952-12-29', NULL, 'USA');
INSERT INTO individu VALUES (100021, 'Mulligan', 'Gerry', '1927-04-06', '1996-01-20', 'USA');
INSERT INTO individu VALUES (100022, 'Johnson', 'J.J.', '1924-01-22', '2001-02-04', 'USA');
INSERT INTO individu VALUES (100023, 'Desmond', 'Paul', '1924-11-25', '1977-05-30', 'USA');
INSERT INTO individu VALUES (100024, 'Taylor', 'Cecil', '1929-03-25', '2018-04-05', 'USA');
INSERT INTO individu VALUES (100025, 'Galliano', 'Richard', '1950-12-12', NULL, 'France');
INSERT INTO individu VALUES (100026, 'Kenny', 'Barron', '1943-06-09', NULL, 'USA');
INSERT INTO individu VALUES (100027, 'Sclavis', 'Louis', '1953-02-02', NULL, 'France');
INSERT INTO individu VALUES (100028, 'Rosnes', 'Renee', '1962-03-24', NULL, 'Canada');
INSERT INTO individu VALUES (100029, 'Rava', 'Enrico', '1939-08-20', NULL, 'Italie');
INSERT INTO individu VALUES (100030, 'Peacock', 'Gary', '1935-05-12', '2020-09-04', 'USA');
INSERT INTO individu VALUES (100031, 'Barreto', 'Ray', '1929-04-29', '2006-02-17', 'USA');
INSERT INTO individu VALUES (100032, 'DeJohnette', 'Jack', '1942-08-09', NULL, 'USA');
INSERT INTO individu VALUES (100033, 'McLaughlin', 'John', '1942-01-04', NULL, 'UK');
INSERT INTO individu VALUES (100034, 'Liebman', 'Dave', '1946-09-04', NULL, 'USA');
INSERT INTO individu VALUES (100035, 'Bollani', 'Stefano', '1972-12-05', NULL, 'Italie');
INSERT INTO individu VALUES (100036, 'Marsalis', 'Branford', '1960-08-26', NULL, 'USA');
INSERT INTO individu VALUES (100037, 'Stenson', 'Bobo', '1944-08-04', NULL, 'Suède');
INSERT INTO individu VALUES (100038, 'Moreno', 'Susana', '1977-03-12', NULL, 'Espagne');
INSERT INTO individu VALUES (100039, 'Fresu', 'Paolo', '1961-02-10', NULL, 'Italie');
INSERT INTO individu VALUES (100040, 'Smith', 'Jimmy', '1925-12-08', '2005-02-08', 'USA');


INSERT INTO edition VALUES (200001, 'Blue Note', 100001, 'USA');
INSERT INTO edition VALUES (200002, 'Verve', 100002, 'USA');
INSERT INTO edition VALUES (200003, 'Impulse!', 100003, 'USA');
INSERT INTO edition VALUES (200004, 'ECM', 100015, 'Allemagne');
INSERT INTO edition VALUES (200005, 'Dreyfus', 100025, 'France');
INSERT INTO edition VALUES (200006, 'Prestige', 100004, 'USA');
INSERT INTO edition VALUES (200007, 'Savoy', 100008, 'USA');
INSERT INTO edition VALUES (200008, 'Atlantic', 100010, 'USA');
INSERT INTO edition VALUES (200009, 'Columbia', 100002, 'USA');
INSERT INTO edition VALUES (200010, 'Concord', 100028, 'USA');
INSERT INTO edition VALUES (200011, 'RCA', 100021, 'USA');
INSERT INTO edition VALUES (200012, 'Enja', 100027, 'Allemagne');
INSERT INTO edition VALUES (200013, 'Hat Hut', 100024, 'Suisse');
INSERT INTO edition VALUES (200014, 'ACT', 100037, 'Allemagne');
INSERT INTO edition VALUES (200015, 'Sunnyside', 100019, 'USA');
INSERT INTO edition VALUES (200016, 'Universal', 100038, 'Espagne');
INSERT INTO edition VALUES (200017, 'Jazzland', 100030, 'USA');
INSERT INTO edition VALUES (200018, 'Impulse France', 100027, 'France');
INSERT INTO edition VALUES (200019, 'Sony', 100013, 'Japon');
-- Éditeurs sans CD
INSERT INTO edition VALUES (200020, 'Fantasy', 100009, 'USA');
INSERT INTO edition VALUES (200021, 'Swingtime', 100032, 'USA');



INSERT INTO cd VALUES (300001, 'Kind of Blue', 200002, 10, 10);
INSERT INTO cd VALUES (300002, 'A Love Supreme', 200001, 10, 9);
INSERT INTO cd VALUES (300003, 'Maiden Voyage', 200001, 9, 9);
INSERT INTO cd VALUES (300004, 'The Köln Concert', 200004, 10, 10);
INSERT INTO cd VALUES (300005, 'Bright Size Life', 200004, 9, 8);
INSERT INTO cd VALUES (300006, 'Night Train', 200011, 8, 9);
INSERT INTO cd VALUES (300007, 'Sunday at the Village Vanguard', 200006, 10, 9);
INSERT INTO cd VALUES (300008, 'Speak No Evil', 200003, 9, 8);
INSERT INTO cd VALUES (300009, 'The Black Saint and the Sinner Lady', 200008, 10, 10);
INSERT INTO cd VALUES (300010, 'Bitches Brew', 200009, 10, 9);
INSERT INTO cd VALUES (300011, 'Giant Steps', 200001, 10, 8);
INSERT INTO cd VALUES (300012, 'Head Hunters', 200002, 9, 8);
INSERT INTO cd VALUES (300013, 'Out to Lunch!', 200012, 8, 8);
INSERT INTO cd VALUES (300014, 'Go', 200007, 10, 9);
INSERT INTO cd VALUES (300015, 'Time Out', 200008, 9, 9);
INSERT INTO cd VALUES (300016, 'Black Codes From The Underground', 200015, 7, 8);
INSERT INTO cd VALUES (300017, 'Empyrean Isles', 200001, 9, 8);
INSERT INTO cd VALUES (300018, 'Let My Children Hear Music', 200009, 10, 10);
INSERT INTO cd VALUES (300019, 'Still Life (Talking)', 200004, 9, 7);
INSERT INTO cd VALUES (300020, 'Voyage', 200004, 8, 9);
INSERT INTO cd VALUES (300021, 'Lift Every Voice', 200013, 8, 9);
INSERT INTO cd VALUES (300022, 'Nefertiti', 200002, 9, 8);
INSERT INTO cd VALUES (300023, 'Live at the Village Vanguard', 200006, 10, 9);
INSERT INTO cd VALUES (300024, 'Travels', 200004, 10, 10);
INSERT INTO cd VALUES (300025, 'Page One', 200008, 8, 8);
INSERT INTO cd VALUES (300026, 'Turning Point', 200007, 8, 7);
INSERT INTO cd VALUES (300027, 'Speak Like a Child', 200012, 8, 8);
INSERT INTO cd VALUES (300028, 'Djangology', 200005, 10, 10);
INSERT INTO cd VALUES (300029, 'We Get Requests', 200011, 8, 9);
INSERT INTO cd VALUES (300030, 'Blue Train', 200001, 10, 10);
INSERT INTO cd VALUES (300031, 'The Sidewinder', 200001, 9, 8);
INSERT INTO cd VALUES (300032, 'Mysterious Traveller', 200002, 9, 9);
INSERT INTO cd VALUES (300033, 'Power to the People', 200010, 8, 7);
INSERT INTO cd VALUES (300034, 'Undercurrent', 200013, 7, 8);
INSERT INTO cd VALUES (300035, 'Alfie', 200012, 8, 7);
INSERT INTO cd VALUES (300036, 'Back at the Chicken Shack', 200007, 8, 7);
INSERT INTO cd VALUES (300037, 'Black Saint', 200008, 9, 8);
INSERT INTO cd VALUES (300038, 'Native Dancer', 200009, 8, 7);
INSERT INTO cd VALUES (300039, 'Somethin’ Else', 200001, 10, 9);
INSERT INTO cd VALUES (300040, 'Unisson', 200005, 7, 8);
INSERT INTO cd VALUES (300041, 'Elegant Gypsy', 200017, 9, 8);
INSERT INTO cd VALUES (300042, 'The Awakening', 200014, 8, 9);
INSERT INTO cd VALUES (300043, 'Chet Baker Sings', 200002, 10, 9);
INSERT INTO cd VALUES (300044, 'Speak Softly', 200018, 8, 8);
INSERT INTO cd VALUES (300045, 'Classique', 200005, 8, 10);
INSERT INTO cd VALUES (300046, 'Saxophone Colossus', 200001, 10, 10);
INSERT INTO cd VALUES (300047, 'Lush Life', 200003, 9, 8);
INSERT INTO cd VALUES (300048, 'Backlash', 200013, 7, 8);
INSERT INTO cd VALUES (300049, 'Mingus Ah Um', 200008, 9, 9);
INSERT INTO cd VALUES (300050, 'Crystal Silence', 200004, 10, 9);
INSERT INTO cd VALUES (300051, 'Blues & Roots', 200008, 8, 7);
INSERT INTO cd VALUES (300052, 'Contrasts', 200014, 7, 8);
INSERT INTO cd VALUES (300053, 'Deja Vu', 200019, 7, 7);
INSERT INTO cd VALUES (300054, 'For Django', 200005, 9, 8);
INSERT INTO cd VALUES (300055, 'Soul Station', 200003, 10, 9);
INSERT INTO cd VALUES (300056, 'Workin''', 200006, 9, 8);
INSERT INTO cd VALUES (300057, 'Cookin''', 200006, 8, 8);
INSERT INTO cd VALUES (300058, 'Steamin''', 200006, 8, 8);
INSERT INTO cd VALUES (300059, 'Relaxin''', 200006, 8, 7);
INSERT INTO cd VALUES (300060, 'Another Pulse', 200016, 7, 7);
INSERT INTO cd VALUES (300061, 'Filles de Kilimanjaro', 200002, 8, 8);
INSERT INTO cd VALUES (300062, 'Heavy Weather', 200010, 9, 7);
INSERT INTO cd VALUES (300063, 'Misterioso', 200003, 9, 9);
INSERT INTO cd VALUES (300064, 'Directions', 200009, 7, 7);
INSERT INTO cd VALUES (300065, 'Memories of Tomorrow', 200004, 7, 8);
INSERT INTO cd VALUES (300066, 'As Falls Wichita...', 200004, 8, 9);
INSERT INTO cd VALUES (300067, 'Love Scenes', 200011, 8, 9);
INSERT INTO cd VALUES (300068, 'Night Lights', 200013, 7, 8);
INSERT INTO cd VALUES (300069, 'On Green Dolphin Street', 200016, 7, 8);
INSERT INTO cd VALUES (300070, 'Sketches of Spain', 200009, 10, 10);
INSERT INTO cd VALUES (300071, 'Stolen Moments', 200018, 8, 7);
INSERT INTO cd VALUES (300072, 'Kindness Joy Love & Happiness', 200014, 7, 8);
INSERT INTO cd VALUES (300073, 'The Dreamer is the Dream', 200017, 8, 7);
INSERT INTO cd VALUES (300074, 'Alone Together', 200003, 7, 10);
INSERT INTO cd VALUES (300075, 'Waltz for Debby', 200006, 10, 9);
INSERT INTO cd VALUES (300076, 'Out Front', 200013, 8, 8);
INSERT INTO cd VALUES (300077, 'Sunrise', 200015, 7, 8);
INSERT INTO cd VALUES (300078, 'Blues Dream', 200004, 8, 9);
INSERT INTO cd VALUES (300079, 'Tutu', 200002, 9, 8);
INSERT INTO cd VALUES (300080, 'Destination... Out!', 200012, 8, 7);
INSERT INTO cd VALUES (300081, 'Birds of Fire', 200010, 9, 8);
INSERT INTO cd VALUES (300082, 'A Go Go', 200004, 8, 9);
INSERT INTO cd VALUES (300083, 'Blue Moods', 200017, 8, 7);
INSERT INTO cd VALUES (300084, 'Adam''s Apple', 200003, 8, 8);
INSERT INTO cd VALUES (300085, 'Sorcery', 200011, 7, 7);
INSERT INTO cd VALUES (300086, 'Belgium Blues', 200014, 8, 8);
INSERT INTO cd VALUES (300087, 'Devotion', 200019, 7, 8);
INSERT INTO cd VALUES (300088, 'Libra', 200012, 8, 8);
INSERT INTO cd VALUES (300089, 'Out of the Cool', 200003, 8, 9);
INSERT INTO cd VALUES (300090, 'London Collection', 200017, 7, 8);
INSERT INTO cd VALUES (300091, 'Affinity', 200004, 9, 10);
INSERT INTO cd VALUES (300092, 'Focus', 200018, 7, 8);
INSERT INTO cd VALUES (300093, 'Tomorrow Is the Question!', 200007, 8, 9);
INSERT INTO cd VALUES (300094, 'Lost Chords', 200014, 9, 9);
INSERT INTO cd VALUES (300095, 'Enrico in Paris', 200019, 7, 8);
INSERT INTO cd VALUES (300096, 'Moon Germs', 200012, 8, 8);
INSERT INTO cd VALUES (300097, 'EnRoute', 200015, 9, 10);
INSERT INTO cd VALUES (300098, 'Blues Walk', 200007, 8, 8);
INSERT INTO cd VALUES (300099, 'You Must Believe in Spring', 200004, 10, 10);
INSERT INTO cd VALUES (300100, 'Free Jazz', 200001, 10, 9);

-- ENREGISTREMENTS

INSERT INTO enreg VALUES (300001,400001,'So What',545,1959,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300001,400002,'Freddie Freeloader',620,1959,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300001,400003,'Blue in Green',328,1959,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300001,400004,'All Blues',489,1959,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300001,400005,'Flamenco Sketches',562,1959,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300002,400006,'Acknowledgement',463,1964,'Englewood Cliffs','Van Gelder Studio');
INSERT INTO enreg VALUES (300002,400007,'Resolution',440,1964,'Englewood Cliffs','Van Gelder Studio');
INSERT INTO enreg VALUES (300002,400008,'Pursuance',655,1964,'Englewood Cliffs','Van Gelder Studio');
INSERT INTO enreg VALUES (300002,400009,'Psalm',475,1964,'Englewood Cliffs','Van Gelder Studio');
INSERT INTO enreg VALUES (300002,400010,'Ascension',600,1964,'Englewood Cliffs','Van Gelder Studio');
INSERT INTO enreg VALUES (300003,400011,'Maiden Voyage',420,1965,'New York','Van Gelder Studio');
INSERT INTO enreg VALUES (300003,400012,'The Eye of the Hurricane',320,1965,'New York','Van Gelder Studio');
INSERT INTO enreg VALUES (300003,400013,'Little One',345,1965,'New York','Van Gelder Studio');
INSERT INTO enreg VALUES (300003,400014,'Survival of the Fittest',355,1965,'New York','Van Gelder Studio');
INSERT INTO enreg VALUES (300003,400015,'Dolphin Dance',410,1965,'New York','Van Gelder Studio');
INSERT INTO enreg VALUES (300004,400016,'Köln Part I',480,1975,'Cologne','Oper Köln');
INSERT INTO enreg VALUES (300004,400017,'Köln Part IIa',340,1975,'Cologne','Oper Köln');
INSERT INTO enreg VALUES (300004,400018,'Köln Part IIb',380,1975,'Cologne','Oper Köln');
INSERT INTO enreg VALUES (300004,400019,'Köln Part IIc',205,1975,'Cologne','Oper Köln');
INSERT INTO enreg VALUES (300004,400020,'Köln Encore',256,1975,'Cologne','Oper Köln');
INSERT INTO enreg VALUES (300005,400021,'Bright Size Life',380,1975,'Oslo','Talent Studios');
INSERT INTO enreg VALUES (300005,400022,'Omaha Celebration',295,1975,'Oslo','Talent Studios');
INSERT INTO enreg VALUES (300005,400023,'Round Trip',340,1975,'Oslo','Talent Studios');
INSERT INTO enreg VALUES (300005,400024,'Unity Village',252,1975,'Oslo','Talent Studios');
INSERT INTO enreg VALUES (300005,400025,'Missouri Uncompromised',320,1975,'Oslo','Talent Studios');
INSERT INTO enreg VALUES (300006,400026,'Night Train',400,1962,'Chicago','Universal Studios');
INSERT INTO enreg VALUES (300006,400027,'C Jam Blues',315,1962,'Chicago','Universal Studios');
INSERT INTO enreg VALUES (300006,400028,'Bags Groove',385,1962,'Chicago','Universal Studios');
INSERT INTO enreg VALUES (300006,400029,'Easy Does It',289,1962,'Chicago','Universal Studios');
INSERT INTO enreg VALUES (300006,400030,'Hymn to Freedom',440,1962,'Chicago','Universal Studios');
INSERT INTO enreg VALUES (300007,400031,'Glorias Step',387,1961,'New York','Village Vanguard');
INSERT INTO enreg VALUES (300007,400032,'Jade Visions',273,1961,'New York','Village Vanguard');
INSERT INTO enreg VALUES (300007,400033,'Alice in Wonderland',420,1961,'New York','Village Vanguard');
INSERT INTO enreg VALUES (300007,400034,'Solar',295,1961,'New York','Village Vanguard');
INSERT INTO enreg VALUES (300007,400035,'All of You',410,1961,'New York','Village Vanguard');
INSERT INTO enreg VALUES (300008,400036,'Witch Hunt',414,1966,'New York','Van Gelder Studio');
INSERT INTO enreg VALUES (300008,400037,'Fee-Fi-Fo-Fum',358,1966,'New York','Van Gelder Studio');
INSERT INTO enreg VALUES (300008,400038,'Dance Cadaverous',334,1966,'New York','Van Gelder Studio');
INSERT INTO enreg VALUES (300008,400039,'Speak No Evil',372,1966,'New York','Van Gelder Studio');
INSERT INTO enreg VALUES (300008,400040,'Infant Eyes',312,1966,'New York','Van Gelder Studio');
INSERT INTO enreg VALUES (300009,400041,'Track A - Solo Dancer',390,1963,'New York','A&R Studios');
INSERT INTO enreg VALUES (300009,400042,'Track B - Duet Solo Dancers',364,1963,'New York','A&R Studios');
INSERT INTO enreg VALUES (300009,400043,'Track C - Group Dancers',620,1963,'New York','A&R Studios');
INSERT INTO enreg VALUES (300009,400044,'Mode D - Trio',286,1963,'New York','A&R Studios');
INSERT INTO enreg VALUES (300009,400045,'Mode E/F - Group & Solo',411,1963,'New York','A&R Studios');

INSERT INTO enreg VALUES (300010,400046,'Pharaoh''s Dance',1203,1970,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300010,400047,'Bitches Brew',1677,1970,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300010,400048,'Spanish Key',1020,1970,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300010,400049,'John McLaughlin',255,1970,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300010,400050,'Miles Runs the Voodoo Down',867,1970,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300011,400051,'Giant Steps',290,1960,'New York','Atlantic Studio');
INSERT INTO enreg VALUES (300011,400052,'Countdown',336,1960,'New York','Atlantic Studio');
INSERT INTO enreg VALUES (300011,400053,'Cousin Mary',338,1960,'New York','Atlantic Studio');
INSERT INTO enreg VALUES (300011,400054,'Syeeda''s Song Flute',408,1960,'New York','Atlantic Studio');
INSERT INTO enreg VALUES (300011,400055,'Naima',275,1960,'New York','Atlantic Studio');
INSERT INTO enreg VALUES (300012,400056,'Chameleon',920,1973,'San Francisco','Wally Heider Studio');
INSERT INTO enreg VALUES (300012,400057,'Watermelon Man',405,1973,'San Francisco','Wally Heider Studio');
INSERT INTO enreg VALUES (300012,400058,'Sly',600,1973,'San Francisco','Wally Heider Studio');
INSERT INTO enreg VALUES (300012,400059,'Vein Melter',408,1973,'San Francisco','Wally Heider Studio');
INSERT INTO enreg VALUES (300012,400060,'Palm Grease',420,1973,'San Francisco','Wally Heider Studio');
INSERT INTO enreg VALUES (300013,400061,'Hat and Beard',480,1964,'New York','RCA Studios');
INSERT INTO enreg VALUES (300013,400062,'Something Sweet, Something Tender',360,1964,'New York','RCA Studios');
INSERT INTO enreg VALUES (300013,400063,'Gazzelloni',398,1964,'New York','RCA Studios');
INSERT INTO enreg VALUES (300013,400064,'Out to Lunch',600,1964,'New York','RCA Studios');
INSERT INTO enreg VALUES (300013,400065,'Straight Up and Down',500,1964,'New York','RCA Studios');
INSERT INTO enreg VALUES (300014,400066,'Go',408,1962,'New York','Blue Note Studio');
INSERT INTO enreg VALUES (300014,400067,'Soy Califa',410,1962,'New York','Blue Note Studio');
INSERT INTO enreg VALUES (300014,400068,'Where Are You?',260,1962,'New York','Blue Note Studio');
INSERT INTO enreg VALUES (300014,400069,'Mary''s Blues',315,1962,'New York','Blue Note Studio');
INSERT INTO enreg VALUES (300014,400070,'I Guess I''ll Hang My Tears Out to Dry',310,1962,'New York','Blue Note Studio');
INSERT INTO enreg VALUES (300015,400071,'Blue Rondo a la Turk',376,1959,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300015,400072,'Strange Meadow Lark',440,1959,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300015,400073,'Take Five',324,1959,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300015,400074,'Three to Get Ready',318,1959,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300015,400075,'Cathy''s Waltz',372,1959,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300016,400076,'Black Codes',495,1985,'New Orleans','Studio 2');
INSERT INTO enreg VALUES (300016,400077,'For Wee Folks',320,1985,'New Orleans','Studio 2');
INSERT INTO enreg VALUES (300016,400078,'Delfeayo''s Dilemma',365,1985,'New Orleans','Studio 2');
INSERT INTO enreg VALUES (300016,400079,'Phryzzinian Man',400,1985,'New Orleans','Studio 2');
INSERT INTO enreg VALUES (300016,400080,'Winds of Change',410,1985,'New Orleans','Studio 2');
INSERT INTO enreg VALUES (300017,400081,'Empyrean Isles',420,1964,'New York','Van Gelder Studio');
INSERT INTO enreg VALUES (300017,400082,'One Finger Snap',320,1964,'New York','Van Gelder Studio');
INSERT INTO enreg VALUES (300017,400083,'Oliloqui Valley',345,1964,'New York','Van Gelder Studio');
INSERT INTO enreg VALUES (300017,400084,'Cantaloupe Island',360,1964,'New York','Van Gelder Studio');
INSERT INTO enreg VALUES (300017,400085,'The Egg',415,1964,'New York','Van Gelder Studio');
INSERT INTO enreg VALUES (300018,400086,'The Shoes of the Fisherman''s Wife',615,1972,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300018,400087,'Don''t Be Afraid',420,1972,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300018,400088,'The Chill Of Death',412,1972,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300018,400089,'The I of Hurricane Sue',320,1972,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300018,400090,'Let My Children Hear Music',470,1972,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300019,400091,'Forward March',346,1987,'Tokyo','Victor Studio');
INSERT INTO enreg VALUES (300019,400092,'Yolanda, You Learn',280,1987,'Tokyo','Victor Studio');
INSERT INTO enreg VALUES (300019,400093,'Crossover',298,1987,'Tokyo','Victor Studio');
INSERT INTO enreg VALUES (300019,400094,'Minuano',370,1987,'Tokyo','Victor Studio');
INSERT INTO enreg VALUES (300019,400095,'Third Wind',389,1987,'Tokyo','Victor Studio');
INSERT INTO enreg VALUES (300020,400096,'Voyage',380,1990,'Paris','Studio Davout');
INSERT INTO enreg VALUES (300020,400097,'Valse Hot',330,1990,'Paris','Studio Davout');
INSERT INTO enreg VALUES (300020,400098,'After the Rain',293,1990,'Paris','Studio Davout');
INSERT INTO enreg VALUES (300020,400099,'So Tender',325,1990,'Paris','Studio Davout');
INSERT INTO enreg VALUES (300020,400100,'Long Ago and Far Away',264,1990,'Paris','Studio Davout');
INSERT INTO enreg VALUES (300021,400101,'Lift Every Voice',500,2000,'New York','RCA Studios');
INSERT INTO enreg VALUES (300021,400102,'Freedom Suite',390,2000,'New York','RCA Studios');
INSERT INTO enreg VALUES (300021,400103,'Amazing Grace',480,2000,'New York','RCA Studios');
INSERT INTO enreg VALUES (300021,400104,'Go Down Moses',370,2000,'New York','RCA Studios');
INSERT INTO enreg VALUES (300021,400105,'Hope',345,2000,'New York','RCA Studios');
INSERT INTO enreg VALUES (300022,400106,'Nefertiti',420,1968,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300022,400107,'Fall',382,1968,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300022,400108,'Hand Jive',390,1968,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300022,400109,'Madness',322,1968,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300022,400110,'Pinocchio',362,1968,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300023,400111,'Gloria''s Step',387,1961,'New York','Village Vanguard');
INSERT INTO enreg VALUES (300023,400112,'My Man''s Gone Now',450,1961,'New York','Village Vanguard');
INSERT INTO enreg VALUES (300023,400113,'Solar',252,1961,'New York','Village Vanguard');
INSERT INTO enreg VALUES (300023,400114,'Alice in Wonderland',420,1961,'New York','Village Vanguard');
INSERT INTO enreg VALUES (300023,400115,'All of You',410,1961,'New York','Village Vanguard');
INSERT INTO enreg VALUES (300024,400116,'Love Dance',325,1983,'Graz','Jazzwerkstatt');
INSERT INTO enreg VALUES (300024,400117,'Travels',452,1983,'Graz','Jazzwerkstatt');
INSERT INTO enreg VALUES (300024,400118,'Song for Bilbao',370,1983,'Graz','Jazzwerkstatt');
INSERT INTO enreg VALUES (300024,400119,'Farmer''s Trust',339,1983,'Graz','Jazzwerkstatt');
INSERT INTO enreg VALUES (300024,400120,'Goodbye',287,1983,'Graz','Jazzwerkstatt');
INSERT INTO enreg VALUES (300025,400121,'Page One',360,1964,'New York','Blue Note Studio');
INSERT INTO enreg VALUES (300025,400122,'Blue Bossa',324,1964,'New York','Blue Note Studio');
INSERT INTO enreg VALUES (300025,400123,'La Mesha',303,1964,'New York','Blue Note Studio');
INSERT INTO enreg VALUES (300025,400124,'Beloved',267,1964,'New York','Blue Note Studio');
INSERT INTO enreg VALUES (300025,400125,'Joker',359,1964,'New York','Blue Note Studio');
INSERT INTO enreg VALUES (300026,400126,'Turning Point',350,1970,'Los Angeles','Universal Sound');
INSERT INTO enreg VALUES (300026,400127,'You Stepped Out of a Dream',315,1970,'Los Angeles','Universal Sound');
INSERT INTO enreg VALUES (300026,400128,'Blues for Jimmy',309,1970,'Los Angeles','Universal Sound');
INSERT INTO enreg VALUES (300026,400129,'Bouncing With Bud',304,1970,'Los Angeles','Universal Sound');
INSERT INTO enreg VALUES (300026,400130,'Night Has a Thousand Eyes',356,1970,'Los Angeles','Universal Sound');
INSERT INTO enreg VALUES (300027,400131,'Speak Like a Child',343,1968,'New York','A&R Studios');
INSERT INTO enreg VALUES (300027,400132,'Riot',328,1968,'New York','A&R Studios');
INSERT INTO enreg VALUES (300027,400133,'First Trip',376,1968,'New York','A&R Studios');
INSERT INTO enreg VALUES (300027,400134,'Toys',292,1968,'New York','A&R Studios');
INSERT INTO enreg VALUES (300027,400135,'The Sorcerer',275,1968,'New York','A&R Studios');
INSERT INTO enreg VALUES (300028,400136,'Nuages',325,1949,'Paris','INA Studio');
INSERT INTO enreg VALUES (300028,400137,'Minor Swing',240,1949,'Paris','INA Studio');
INSERT INTO enreg VALUES (300028,400138,'Swing 42',210,1949,'Paris','INA Studio');
INSERT INTO enreg VALUES (300028,400139,'Djangology',268,1949,'Paris','INA Studio');
INSERT INTO enreg VALUES (300028,400140,'Manoir de mes Reves',322,1949,'Paris','INA Studio');
INSERT INTO enreg VALUES (300029,400141,'Quiet Nights',376,1964,'Chicago','Chess Studios');
INSERT INTO enreg VALUES (300029,400142,'We Get Requests',420,1964,'Chicago','Chess Studios');
INSERT INTO enreg VALUES (300029,400143,'The Girl from Ipanema',345,1964,'Chicago','Chess Studios');
INSERT INTO enreg VALUES (300029,400144,'Meditation',312,1964,'Chicago','Chess Studios');
INSERT INTO enreg VALUES (300029,400145,'How Insensitive',338,1964,'Chicago','Chess Studios');

INSERT INTO enreg VALUES (300030,400151,'Blue Train',540,1957,'New York','Blue Note Studio');
INSERT INTO enreg VALUES (300030,400152,'Moment''s Notice',570,1957,'New York','Blue Note Studio');
INSERT INTO enreg VALUES (300030,400153,'Locomotion',420,1957,'New York','Blue Note Studio');
INSERT INTO enreg VALUES (300030,400154,'I''m Old Fashioned',392,1957,'New York','Blue Note Studio');
INSERT INTO enreg VALUES (300030,400155,'Lazy Bird',316,1957,'New York','Blue Note Studio');
INSERT INTO enreg VALUES (300031,400156,'The Sidewinder',520,1964,'New York','Van Gelder Studio');
INSERT INTO enreg VALUES (300031,400157,'Totem Pole',480,1964,'New York','Van Gelder Studio');
INSERT INTO enreg VALUES (300031,400158,'Gary''s Notebook',372,1964,'New York','Van Gelder Studio');
INSERT INTO enreg VALUES (300031,400159,'Boy, What a Night',334,1964,'New York','Van Gelder Studio');
INSERT INTO enreg VALUES (300031,400160,'Hocus Pocus',350,1964,'New York','Van Gelder Studio');
INSERT INTO enreg VALUES (300032,400161,'Birdland',475,1977,'Los Angeles','A&M Studios');
INSERT INTO enreg VALUES (300032,400162,'A Remark You Made',330,1977,'Los Angeles','A&M Studios');
INSERT INTO enreg VALUES (300032,400163,'Teen Town',255,1977,'Los Angeles','A&M Studios');
INSERT INTO enreg VALUES (300032,400164,'Harlequin',367,1977,'Los Angeles','A&M Studios');
INSERT INTO enreg VALUES (300032,400165,'Palladium',300,1977,'Los Angeles','A&M Studios');
INSERT INTO enreg VALUES (300033,400166,'Power to the People',395,1970,'New York','Solid Sound');
INSERT INTO enreg VALUES (300033,400167,'Snake Hip Waltz',273,1970,'New York','Solid Sound');
INSERT INTO enreg VALUES (300033,400168,'Double Exposure',360,1970,'New York','Solid Sound');
INSERT INTO enreg VALUES (300033,400169,'El Gaucho',325,1970,'New York','Solid Sound');
INSERT INTO enreg VALUES (300033,400170,'Little Lady',398,1970,'New York','Solid Sound');
INSERT INTO enreg VALUES (300034,400171,'Undercurrent',370,1962,'New York','Riverside Studio');
INSERT INTO enreg VALUES (300034,400172,'I Hear a Rhapsody',300,1962,'New York','Riverside Studio');
INSERT INTO enreg VALUES (300034,400173,'Dream Gypsy',356,1962,'New York','Riverside Studio');
INSERT INTO enreg VALUES (300034,400174,'Stairway to the Stars',316,1962,'New York','Riverside Studio');
INSERT INTO enreg VALUES (300034,400175,'Darn That Dream',328,1962,'New York','Riverside Studio');
INSERT INTO enreg VALUES (300035,400176,'Alfie',245,1966,'London','EMI Studios');
INSERT INTO enreg VALUES (300035,400177,'He''ll Have to Go',334,1966,'London','EMI Studios');
INSERT INTO enreg VALUES (300035,400178,'The Old Country',310,1966,'London','EMI Studios');
INSERT INTO enreg VALUES (300035,400179,'On Impulse',390,1966,'London','EMI Studios');
INSERT INTO enreg VALUES (300035,400180,'More Than You Know',370,1966,'London','EMI Studios');
INSERT INTO enreg VALUES (300036,400181,'Back at the Chicken Shack',420,1967,'New York','Blue Note Studio');
INSERT INTO enreg VALUES (300036,400182,'When I Grow Too Old to Dream',310,1967,'New York','Blue Note Studio');
INSERT INTO enreg VALUES (300036,400183,'Minor Chant',266,1967,'New York','Blue Note Studio');
INSERT INTO enreg VALUES (300036,400184,'Messy Bessie',340,1967,'New York','Blue Note Studio');
INSERT INTO enreg VALUES (300036,400185,'Confirmation',380,1967,'New York','Blue Note Studio');
INSERT INTO enreg VALUES (300037,400186,'Black Saint',595,1963,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300037,400187,'Duet Solo',312,1963,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300037,400188,'Group Dancers',589,1963,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300037,400189,'Solo',310,1963,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300037,400190,'Ending Suite',270,1963,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300038,400191,'Ponta de Areia',367,1974,'Rio de Janeiro','Studio Eldorado');
INSERT INTO enreg VALUES (300038,400192,'Miracle of the Fishes',313,1974,'Rio de Janeiro','Studio Eldorado');
INSERT INTO enreg VALUES (300038,400193,'Slaves Mass',352,1974,'Rio de Janeiro','Studio Eldorado');
INSERT INTO enreg VALUES (300038,400194,'Cravo e Canela',250,1974,'Rio de Janeiro','Studio Eldorado');
INSERT INTO enreg VALUES (300038,400195,'Nada Sera Como Antes',317,1974,'Rio de Janeiro','Studio Eldorado');
INSERT INTO enreg VALUES (300039,400196,'Autumn Leaves',410,1958,'Paris','Pathé Marconi Studio');
INSERT INTO enreg VALUES (300039,400197,'Love for Sale',312,1958,'Paris','Pathé Marconi Studio');
INSERT INTO enreg VALUES (300039,400198,'Somethin Else',385,1958,'Paris','Pathé Marconi Studio');
INSERT INTO enreg VALUES (300039,400199,'On Green Dolphin Street',357,1958,'Paris','Pathé Marconi Studio');
INSERT INTO enreg VALUES (300039,400200,'You Go to My Head',271,1958,'Paris','Pathé Marconi Studio');
INSERT INTO enreg VALUES (300040,400201,'Unisson',500,1987,'Paris','Studio Ferber');
INSERT INTO enreg VALUES (300040,400202,'Swing Spray',308,1987,'Paris','Studio Ferber');
INSERT INTO enreg VALUES (300040,400203,'Tango Jazz',362,1987,'Paris','Studio Ferber');
INSERT INTO enreg VALUES (300040,400204,'Classique',212,1987,'Paris','Studio Ferber');
INSERT INTO enreg VALUES (300040,400205,'Caprice',246,1987,'Paris','Studio Ferber');
INSERT INTO enreg VALUES (300041,400206,'Elegant Gypsy',385,1977,'Los Angeles','Capitol Studios');
INSERT INTO enreg VALUES (300041,400207,'Midnight Sun',410,1977,'Los Angeles','Capitol Studios');
INSERT INTO enreg VALUES (300041,400208,'Race With Devil on Spanish Highway',525,1977,'Los Angeles','Capitol Studios');
INSERT INTO enreg VALUES (300041,400209,'Mediterranean Sundance',390,1977,'Los Angeles','Capitol Studios');
INSERT INTO enreg VALUES (300041,400210,'Lady of Rome',360,1977,'Los Angeles','Capitol Studios');
INSERT INTO enreg VALUES (300042,400211,'The Awakening',418,1981,'Berlin','Hansa Tonstudio');
INSERT INTO enreg VALUES (300042,400212,'Contrasts',390,1981,'Berlin','Hansa Tonstudio');
INSERT INTO enreg VALUES (300042,400213,'Night Lights',316,1981,'Berlin','Hansa Tonstudio');
INSERT INTO enreg VALUES (300042,400214,'Morning Mist',328,1981,'Berlin','Hansa Tonstudio');
INSERT INTO enreg VALUES (300042,400215,'Autumn Breeze',299,1981,'Berlin','Hansa Tonstudio');
INSERT INTO enreg VALUES (300043,400216,'But Not for Me',395,1954,'Los Angeles','Pacific Jazz Studio');
INSERT INTO enreg VALUES (300043,400217,'Time After Time',413,1954,'Los Angeles','Pacific Jazz Studio');
INSERT INTO enreg VALUES (300043,400218,'Autumn in New York',260,1954,'Los Angeles','Pacific Jazz Studio');
INSERT INTO enreg VALUES (300043,400219,'Chet Baker Sings',340,1954,'Los Angeles','Pacific Jazz Studio');
INSERT INTO enreg VALUES (300043,400220,'Look for the Silver Lining',322,1954,'Los Angeles','Pacific Jazz Studio');
INSERT INTO enreg VALUES (300044,400221,'Speak Softly',289,2001,'Paris','Studio Ferber');
INSERT INTO enreg VALUES (300044,400222,'Samba Black',316,2001,'Paris','Studio Ferber');
INSERT INTO enreg VALUES (300044,400223,'Unisono',330,2001,'Paris','Studio Ferber');
INSERT INTO enreg VALUES (300044,400224,'Suite Bambou',310,2001,'Paris','Studio Ferber');
INSERT INTO enreg VALUES (300044,400225,'Classique',255,2001,'Paris','Studio Ferber');
INSERT INTO enreg VALUES (300045,400226,'Classique',390,1986,'Paris','Studio Davout');
INSERT INTO enreg VALUES (300045,400227,'Tango pour Claude',367,1986,'Paris','Studio Davout');
INSERT INTO enreg VALUES (300045,400228,'Opale',312,1986,'Paris','Studio Davout');
INSERT INTO enreg VALUES (300045,400229,'Billie',340,1986,'Paris','Studio Davout');
INSERT INTO enreg VALUES (300045,400230,'Passion',294,1986,'Paris','Studio Davout');
INSERT INTO enreg VALUES (300046,400231,'Saxophone Colossus',410,1956,'New York','RCA Studio');
INSERT INTO enreg VALUES (300046,400232,'St. Thomas',380,1956,'New York','RCA Studio');
INSERT INTO enreg VALUES (300046,400233,'You Don''t Know What Love Is',350,1956,'New York','RCA Studio');
INSERT INTO enreg VALUES (300046,400234,'Moritat',320,1956,'New York','RCA Studio');
INSERT INTO enreg VALUES (300046,400235,'Blue Seven',395,1956,'New York','RCA Studio');
INSERT INTO enreg VALUES (300047,400236,'Lush Life',295,1960,'New York','Capitol Studio');
INSERT INTO enreg VALUES (300047,400237,'My One and Only Love',390,1960,'New York','Capitol Studio');
INSERT INTO enreg VALUES (300047,400238,'Like Someone in Love',415,1960,'New York','Capitol Studio');
INSERT INTO enreg VALUES (300047,400239,'I Love You',350,1960,'New York','Capitol Studio');
INSERT INTO enreg VALUES (300047,400240,'Theme for Ernie',360,1960,'New York','Capitol Studio');
INSERT INTO enreg VALUES (300048,400241,'Backlash',370,1967,'New York','Solid Sound');
INSERT INTO enreg VALUES (300048,400242,'Loser Two''s Blues',338,1967,'New York','Solid Sound');
INSERT INTO enreg VALUES (300048,400243,'Sudden Death',410,1967,'New York','Solid Sound');
INSERT INTO enreg VALUES (300048,400244,'Fan Fire',385,1967,'New York','Solid Sound');
INSERT INTO enreg VALUES (300048,400245,'Little Sunflower',420,1967,'New York','Solid Sound');
INSERT INTO enreg VALUES (300049,400246,'Better Get Hit in Your Soul',360,1959,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300049,400247,'Boogie Stop Shuffle',250,1959,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300049,400248,'Goodbye Pork Pie Hat',285,1959,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300049,400249,'Self-Portrait in Three Colors',290,1959,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300049,400250,'Open Letter to Duke',325,1959,'New York','Columbia Studios');


INSERT INTO enreg VALUES (300050,400251,'Crystal Silence',360,1972,'Oslo','Talent Studios');
INSERT INTO enreg VALUES (300050,400252,'Duende',300,1972,'Oslo','Talent Studios');
INSERT INTO enreg VALUES (300050,400253,'Windows',420,1972,'Oslo','Talent Studios');
INSERT INTO enreg VALUES (300050,400254,'Spain',438,1972,'Oslo','Talent Studios');
INSERT INTO enreg VALUES (300050,400255,'Children''s Song',278,1972,'Oslo','Talent Studios');
INSERT INTO enreg VALUES (300051,400256,'Boogie Stop Shuffle',356,1960,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300051,400257,'Mood Indigo',244,1960,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300051,400258,'Blues & Roots',410,1960,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300051,400259,'Moanin''',325,1960,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300051,400260,'Reincarnation of a Lovebird',379,1960,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300052,400261,'Contrasts',320,1997,'Hamburg','DA Studio');
INSERT INTO enreg VALUES (300052,400262,'Nightwatch',400,1997,'Hamburg','DA Studio');
INSERT INTO enreg VALUES (300052,400263,'Open Source',386,1997,'Hamburg','DA Studio');
INSERT INTO enreg VALUES (300052,400264,'Free',332,1997,'Hamburg','DA Studio');
INSERT INTO enreg VALUES (300052,400265,'Autumn Rites',260,1997,'Hamburg','DA Studio');
INSERT INTO enreg VALUES (300053,400266,'Deja Vu',310,2005,'Berlin','Jazzhaus Studio');
INSERT INTO enreg VALUES (300053,400267,'Infinite Loop',398,2005,'Berlin','Jazzhaus Studio');
INSERT INTO enreg VALUES (300053,400268,'City Lights',326,2005,'Berlin','Jazzhaus Studio');
INSERT INTO enreg VALUES (300053,400269,'Nomad''s Path',287,2005,'Berlin','Jazzhaus Studio');
INSERT INTO enreg VALUES (300053,400270,'Touch and Go',335,2005,'Berlin','Jazzhaus Studio');
INSERT INTO enreg VALUES (300054,400271,'For Django',295,1964,'Paris','INA Studio');
INSERT INTO enreg VALUES (300054,400272,'Nuages',236,1964,'Paris','INA Studio');
INSERT INTO enreg VALUES (300054,400273,'Swing 42',218,1964,'Paris','INA Studio');
INSERT INTO enreg VALUES (300054,400274,'Minor Swing',245,1964,'Paris','INA Studio');
INSERT INTO enreg VALUES (300054,400275,'Djangology',340,1964,'Paris','INA Studio');
INSERT INTO enreg VALUES (300055,400276,'Soul Station',320,1960,'New York','Blue Note Studio');
INSERT INTO enreg VALUES (300055,400277,'I Remember Clifford',308,1960,'New York','Blue Note Studio');
INSERT INTO enreg VALUES (300055,400278,'Since I Fell for You',335,1960,'New York','Blue Note Studio');
INSERT INTO enreg VALUES (300055,400279,'Split Feelin''s',306,1960,'New York','Blue Note Studio');
INSERT INTO enreg VALUES (300055,400280,'Light Blue',262,1960,'New York','Blue Note Studio');
INSERT INTO enreg VALUES (300056,400281,'Workin''',360,1956,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300056,400282,'It Never Entered My Mind',245,1956,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300056,400283,'September Song',338,1956,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300056,400284,'Four',365,1956,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300056,400285,'In Your Own Sweet Way',322,1956,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300057,400286,'Cookin''',410,1956,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300057,400287,'My Funny Valentine',372,1956,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300057,400288,'Diane',308,1956,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300057,400289,'Trane''s Blues',296,1956,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300057,400290,'Blues by Five',340,1956,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300058,400291,'Steamin''',365,1956,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300058,400292,'Surrey with the Fringe on Top',305,1956,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300058,400293,'Salt Peanuts',380,1956,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300058,400294,'When I Fall in Love',320,1956,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300058,400295,'Well You Needn''t',295,1956,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300059,400296,'Relaxin''',340,1956,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300059,400297,'If I Were a Bell',376,1956,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300059,400298,'Woody''n You',438,1956,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300059,400299,'The Theme',275,1956,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300059,400300,'You''re My Everything',310,1956,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300060,400301,'Another Pulse',308,2003,'Tokyo','Victor Studio');
INSERT INTO enreg VALUES (300060,400302,'East Wind',272,2003,'Tokyo','Victor Studio');
INSERT INTO enreg VALUES (300060,400303,'Westbound',335,2003,'Tokyo','Victor Studio');
INSERT INTO enreg VALUES (300060,400304,'Night Ride',418,2003,'Tokyo','Victor Studio');
INSERT INTO enreg VALUES (300060,400305,'Harmony',325,2003,'Tokyo','Victor Studio');
INSERT INTO enreg VALUES (300061,400306,'Filles de Kilimanjaro',320,1968,'Paris','Pathé Marconi Studio');
INSERT INTO enreg VALUES (300061,400307,'Tout de Suite',304,1968,'Paris','Pathé Marconi Studio');
INSERT INTO enreg VALUES (300061,400308,'Petits Machins',349,1968,'Paris','Pathé Marconi Studio');
INSERT INTO enreg VALUES (300061,400309,'Mademoiselle Mabry',407,1968,'Paris','Pathé Marconi Studio');
INSERT INTO enreg VALUES (300061,400310,'Frelon Brun',382,1968,'Paris','Pathé Marconi Studio');
INSERT INTO enreg VALUES (300062,400311,'Heavy Weather',390,1977,'Los Angeles','A&M Studios');
INSERT INTO enreg VALUES (300062,400312,'Birdland',475,1977,'Los Angeles','A&M Studios');
INSERT INTO enreg VALUES (300062,400313,'Midnight Sun',410,1977,'Los Angeles','A&M Studios');
INSERT INTO enreg VALUES (300062,400314,'Teen Town',255,1977,'Los Angeles','A&M Studios');
INSERT INTO enreg VALUES (300062,400315,'Harlequin',367,1977,'Los Angeles','A&M Studios');
INSERT INTO enreg VALUES (300063,400316,'Misterioso',472,1958,'New York','Five Spot');
INSERT INTO enreg VALUES (300063,400317,'Round Midnight',320,1958,'New York','Five Spot');
INSERT INTO enreg VALUES (300063,400318,'Bye-Ya',290,1958,'New York','Five Spot');
INSERT INTO enreg VALUES (300063,400319,'Evidence',349,1958,'New York','Five Spot');
INSERT INTO enreg VALUES (300063,400320,'Epistrophy',320,1958,'New York','Five Spot');
INSERT INTO enreg VALUES (300064,400321,'Directions',390,1980,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300064,400322,'Miles Ahead',420,1980,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300064,400323,'Stuff',392,1980,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300064,400324,'Sanctuary',310,1980,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300064,400325,'Red China Blues',335,1980,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300065,400326,'Memories of Tomorrow',301,1988,'Hamburg','DA Studio');
INSERT INTO enreg VALUES (300065,400327,'Midnight Blue',328,1988,'Hamburg','DA Studio');
INSERT INTO enreg VALUES (300065,400328,'Rainy Days',277,1988,'Hamburg','DA Studio');
INSERT INTO enreg VALUES (300065,400329,'Sunset',340,1988,'Hamburg','DA Studio');
INSERT INTO enreg VALUES (300065,400330,'Afterthought',329,1988,'Hamburg','DA Studio');
INSERT INTO enreg VALUES (300066,400331,'Falling Wichita',375,1983,'Wichita','Jet Sound');
INSERT INTO enreg VALUES (300066,400332,'Oslo Nights',415,1983,'Oslo','Jet Sound');
INSERT INTO enreg VALUES (300066,400333,'Rain Dance',288,1983,'Wichita','Jet Sound');
INSERT INTO enreg VALUES (300066,400334,'Evening Star',350,1983,'Oslo','Jet Sound');
INSERT INTO enreg VALUES (300066,400335,'Winter Moon',320,1983,'Oslo','Jet Sound');
INSERT INTO enreg VALUES (300067,400336,'Love Scenes',290,1997,'New York','Verve Studios');
INSERT INTO enreg VALUES (300067,400337,'Morning Song',330,1997,'New York','Verve Studios');
INSERT INTO enreg VALUES (300067,400338,'Nightfall',324,1997,'New York','Verve Studios');
INSERT INTO enreg VALUES (300067,400339,'Blue Note',385,1997,'New York','Verve Studios');
INSERT INTO enreg VALUES (300067,400340,'Sweet Lorraine',315,1997,'New York','Verve Studios');
INSERT INTO enreg VALUES (300068,400341,'Night Lights',388,2003,'Berlin','Jazzhaus Studio');
INSERT INTO enreg VALUES (300068,400342,'In Motion',305,2003,'Berlin','Jazzhaus Studio');
INSERT INTO enreg VALUES (300068,400343,'Rainy City',376,2003,'Berlin','Jazzhaus Studio');
INSERT INTO enreg VALUES (300068,400344,'Sunlight',322,2003,'Berlin','Jazzhaus Studio');
INSERT INTO enreg VALUES (300068,400345,'Cool Strut',340,2003,'Berlin','Jazzhaus Studio');
INSERT INTO enreg VALUES (300069,400346,'On Green Dolphin Street',313,1958,'Tokyo','Victor Studio');
INSERT INTO enreg VALUES (300069,400347,'Stella by Starlight',355,1958,'Tokyo','Victor Studio');
INSERT INTO enreg VALUES (300069,400348,'My Funny Valentine',370,1958,'Tokyo','Victor Studio');
INSERT INTO enreg VALUES (300069,400349,'Solar',392,1958,'Tokyo','Victor Studio');
INSERT INTO enreg VALUES (300069,400350,'Autumn Leaves',328,1958,'Tokyo','Victor Studio');

INSERT INTO enreg VALUES (300070,400351,'Sketches of Spain',710,1960,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300070,400352,'The Pan Piper',440,1960,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300070,400353,'Saeta',390,1960,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300070,400354,'Solea',470,1960,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300070,400355,'Will o'' the Wisp',355,1960,'New York','Columbia Studios');
INSERT INTO enreg VALUES (300071,400356,'Stolen Moments',380,1961,'New York','Impulse!');
INSERT INTO enreg VALUES (300071,400357,'Hoe Down',395,1961,'New York','Impulse!');
INSERT INTO enreg VALUES (300071,400358,'Cascades',351,1961,'New York','Impulse!');
INSERT INTO enreg VALUES (300071,400359,'Yearnin''',315,1961,'New York','Impulse!');
INSERT INTO enreg VALUES (300071,400360,'Butch and Butch',279,1961,'New York','Impulse!');
INSERT INTO enreg VALUES (300072,400361,'Kindness Joy Love & Happiness',295,2001,'London','Abbey Road Studios');
INSERT INTO enreg VALUES (300072,400362,'Bliss',332,2001,'London','Abbey Road Studios');
INSERT INTO enreg VALUES (300072,400363,'So Far Away',370,2001,'London','Abbey Road Studios');
INSERT INTO enreg VALUES (300072,400364,'Reflection',315,2001,'London','Abbey Road Studios');
INSERT INTO enreg VALUES (300072,400365,'Lost Dream',246,2001,'London','Abbey Road Studios');
INSERT INTO enreg VALUES (300073,400366,'The Dreamer is the Dream',334,2017,'New York','Sunnyside Studios');
INSERT INTO enreg VALUES (300073,400367,'Between the Lines',418,2017,'New York','Sunnyside Studios');
INSERT INTO enreg VALUES (300073,400368,'Living in Fulfillment',310,2017,'New York','Sunnyside Studios');
INSERT INTO enreg VALUES (300073,400369,'Invisible Light',360,2017,'New York','Sunnyside Studios');
INSERT INTO enreg VALUES (300073,400370,'Memory Lane',278,2017,'New York','Sunnyside Studios');
INSERT INTO enreg VALUES (300074,400371,'Alone Together',520,1959,'New York','Capitol Studio');
INSERT INTO enreg VALUES (300074,400372,'How High the Moon',400,1959,'New York','Capitol Studio');
INSERT INTO enreg VALUES (300074,400373,'It Never Entered My Mind',308,1959,'New York','Capitol Studio');
INSERT INTO enreg VALUES (300074,400374,'A Foggy Day',390,1959,'New York','Capitol Studio');
INSERT INTO enreg VALUES (300074,400375,'I Cover the Waterfront',295,1959,'New York','Capitol Studio');
INSERT INTO enreg VALUES (300075,400376,'Waltz for Debby',356,1961,'New York','Village Vanguard');
INSERT INTO enreg VALUES (300075,400377,'My Foolish Heart',242,1961,'New York','Village Vanguard');
INSERT INTO enreg VALUES (300075,400378,'Detour Ahead',308,1961,'New York','Village Vanguard');
INSERT INTO enreg VALUES (300075,400379,'My Romance',270,1961,'New York','Village Vanguard');
INSERT INTO enreg VALUES (300075,400380,'Some Other Time',330,1961,'New York','Village Vanguard');
INSERT INTO enreg VALUES (300076,400381,'Out Front',410,1961,'New York','Harmonia Mundi');
INSERT INTO enreg VALUES (300076,400382,'Echoes',366,1961,'New York','Harmonia Mundi');
INSERT INTO enreg VALUES (300076,400383,'Silent Voices',312,1961,'New York','Harmonia Mundi');
INSERT INTO enreg VALUES (300076,400384,'Upward Bound',380,1961,'New York','Harmonia Mundi');
INSERT INTO enreg VALUES (300076,400385,'Back Home',292,1961,'New York','Harmonia Mundi');
INSERT INTO enreg VALUES (300077,400386,'Sunrise',408,2012,'Paris','Davout');
INSERT INTO enreg VALUES (300077,400387,'Midday Dream',315,2012,'Paris','Davout');
INSERT INTO enreg VALUES (300077,400388,'Shade Dance',390,2012,'Paris','Davout');
INSERT INTO enreg VALUES (300077,400389,'Twilight Walk',295,2012,'Paris','Davout');
INSERT INTO enreg VALUES (300077,400390,'Nightfall',410,2012,'Paris','Davout');
INSERT INTO enreg VALUES (300078,400391,'Blues Dream',399,2001,'Los Angeles','Verve Studios');
INSERT INTO enreg VALUES (300078,400392,'Oddwalk',314,2001,'Los Angeles','Verve Studios');
INSERT INTO enreg VALUES (300078,400393,'Soul Eyes',352,2001,'Los Angeles','Verve Studios');
INSERT INTO enreg VALUES (300078,400394,'Sunburst',270,2001,'Los Angeles','Verve Studios');
INSERT INTO enreg VALUES (300078,400395,'Green Chimneys',345,2001,'Los Angeles','Verve Studios');
INSERT INTO enreg VALUES (300079,400396,'Tutu',363,1986,'Los Angeles','Capitol Studios');
INSERT INTO enreg VALUES (300079,400397,'Portia',312,1986,'Los Angeles','Capitol Studios');
INSERT INTO enreg VALUES (300079,400398,'Splatch',398,1986,'Los Angeles','Capitol Studios');
INSERT INTO enreg VALUES (300079,400399,'Full Nelson',325,1986,'Los Angeles','Capitol Studios');
INSERT INTO enreg VALUES (300079,400400,'Don''t Lose Your Mind',249,1986,'Los Angeles','Capitol Studios');
INSERT INTO enreg VALUES (300080,400401,'Destination... Out!',348,1963,'New York','Blue Note Studio');
INSERT INTO enreg VALUES (300080,400402,'See Saw',390,1963,'New York','Blue Note Studio');
INSERT INTO enreg VALUES (300080,400403,'Bells',324,1963,'New York','Blue Note Studio');
INSERT INTO enreg VALUES (300080,400404,'Blue Silver',275,1963,'New York','Blue Note Studio');
INSERT INTO enreg VALUES (300080,400405,'Cluster',329,1963,'New York','Blue Note Studio');
INSERT INTO enreg VALUES (300081,400406,'Birds of Fire',351,1973,'London','Abbey Road Studios');
INSERT INTO enreg VALUES (300081,400407,'Miles Beyond',396,1973,'London','Abbey Road Studios');
INSERT INTO enreg VALUES (300081,400408,'Celestial Terrestrial Commuters',320,1973,'London','Abbey Road Studios');
INSERT INTO enreg VALUES (300081,400409,'Sapphire Bullets',285,1973,'London','Abbey Road Studios');
INSERT INTO enreg VALUES (300081,400410,'Hope',405,1973,'London','Abbey Road Studios');
INSERT INTO enreg VALUES (300082,400411,'A Go Go',330,1998,'Montreux','Verve Studios');
INSERT INTO enreg VALUES (300082,400412,'Coconut',315,1998,'Montreux','Verve Studios');
INSERT INTO enreg VALUES (300082,400413,'Southern Pacific',364,1998,'Montreux','Verve Studios');
INSERT INTO enreg VALUES (300082,400414,'Recovering Our Song',380,1998,'Montreux','Verve Studios');
INSERT INTO enreg VALUES (300082,400415,'Strut',340,1998,'Montreux','Verve Studios');
INSERT INTO enreg VALUES (300083,400416,'Blue Moods',370,1955,'New York','Debut Studio');
INSERT INTO enreg VALUES (300083,400417,'Nature Boy',320,1955,'New York','Debut Studio');
INSERT INTO enreg VALUES (300083,400418,'Easy Living',332,1955,'New York','Debut Studio');
INSERT INTO enreg VALUES (300083,400419,'Confusion',268,1955,'New York','Debut Studio');
INSERT INTO enreg VALUES (300083,400420,'Alone Together',405,1955,'New York','Debut Studio');
INSERT INTO enreg VALUES (300084,400421,'Adam''s Apple',360,1966,'New York','Blue Note Studio');
INSERT INTO enreg VALUES (300084,400422,'502 Blues',355,1966,'New York','Blue Note Studio');
INSERT INTO enreg VALUES (300084,400423,'El Gaucho',332,1966,'New York','Blue Note Studio');
INSERT INTO enreg VALUES (300084,400424,'Angel Eyes',375,1966,'New York','Blue Note Studio');
INSERT INTO enreg VALUES (300084,400425,'Footprints',420,1966,'New York','Blue Note Studio');
INSERT INTO enreg VALUES (300085,400426,'Sorcery',410,1975,'Berlin','Jazzhaus Studio');
INSERT INTO enreg VALUES (300085,400427,'Red Eyes',350,1975,'Berlin','Jazzhaus Studio');
INSERT INTO enreg VALUES (300085,400428,'Inner Voices',343,1975,'Berlin','Jazzhaus Studio');
INSERT INTO enreg VALUES (300085,400429,'Pulse',388,1975,'Berlin','Jazzhaus Studio');
INSERT INTO enreg VALUES (300085,400430,'Mobius',279,1975,'Berlin','Jazzhaus Studio');
INSERT INTO enreg VALUES (300086,400431,'Belgium Blues',299,2016,'Bruxelles','Studio Jet');
INSERT INTO enreg VALUES (300086,400432,'Turnaround',348,2016,'Bruxelles','Studio Jet');
INSERT INTO enreg VALUES (300086,400433,'Ardennes Stomp',332,2016,'Bruxelles','Studio Jet');
INSERT INTO enreg VALUES (300086,400434,'Northern Lights',318,2016,'Bruxelles','Studio Jet');
INSERT INTO enreg VALUES (300086,400435,'Wallonia Waltz',260,2016,'Bruxelles','Studio Jet');
INSERT INTO enreg VALUES (300087,400436,'Devotion',355,2013,'Rome','Studio BMG');
INSERT INTO enreg VALUES (300087,400437,'Mediterranean',292,2013,'Rome','Studio BMG');
INSERT INTO enreg VALUES (300087,400438,'Florence Nights',265,2013,'Rome','Studio BMG');
INSERT INTO enreg VALUES (300087,400439,'Venezia Joy',303,2013,'Rome','Studio BMG');
INSERT INTO enreg VALUES (300087,400440,'Milano Mio',280,2013,'Rome','Studio BMG');
INSERT INTO enreg VALUES (300088,400441,'Libra',390,1968,'New York','Impulse!');
INSERT INTO enreg VALUES (300088,400442,'Scorpio',316,1968,'New York','Impulse!');
INSERT INTO enreg VALUES (300088,400443,'Virgo',325,1968,'New York','Impulse!');
INSERT INTO enreg VALUES (300088,400444,'Leo',332,1968,'New York','Impulse!');
INSERT INTO enreg VALUES (300088,400445,'Gemini',305,1968,'New York','Impulse!');
INSERT INTO enreg VALUES (300089,400446,'Out of the Cool',410,1961,'New York','Impulse!');
INSERT INTO enreg VALUES (300089,400447,'La Nevada',460,1961,'New York','Impulse!');
INSERT INTO enreg VALUES (300089,400448,'Sun Child',392,1961,'New York','Impulse!');
INSERT INTO enreg VALUES (300089,400449,'Moon Dreams',340,1961,'New York','Impulse!');
INSERT INTO enreg VALUES (300089,400450,'Lady Bird',355,1961,'New York','Impulse!');

INSERT INTO enreg VALUES (300090,400451,'London Collection',395,1971,'London','Abbey Road Studios');
INSERT INTO enreg VALUES (300090,400452,'Bouncing With Bud',278,1971,'London','Abbey Road Studios');
INSERT INTO enreg VALUES (300090,400453,'In Walked Bud',355,1971,'London','Abbey Road Studios');
INSERT INTO enreg VALUES (300090,400454,'Monk''s Dream',390,1971,'London','Abbey Road Studios');
INSERT INTO enreg VALUES (300090,400455,'Ruby My Dear',312,1971,'London','Abbey Road Studios');
INSERT INTO enreg VALUES (300091,400456,'Affinity',312,1980,'Paris','Studio Davout');
INSERT INTO enreg VALUES (300091,400457,'Mirage',299,1980,'Paris','Studio Davout');
INSERT INTO enreg VALUES (300091,400458,'Quiet Day',285,1980,'Paris','Studio Davout');
INSERT INTO enreg VALUES (300091,400459,'Flashpoint',352,1980,'Paris','Studio Davout');
INSERT INTO enreg VALUES (300091,400460,'April Song',334,1980,'Paris','Studio Davout');
INSERT INTO enreg VALUES (300092,400461,'Focus',315,1961,'New York','Capitol Studio');
INSERT INTO enreg VALUES (300092,400462,'Strings Attached',410,1961,'New York','Capitol Studio');
INSERT INTO enreg VALUES (300092,400463,'Lost Chord',296,1961,'New York','Capitol Studio');
INSERT INTO enreg VALUES (300092,400464,'Summer Night',302,1961,'New York','Capitol Studio');
INSERT INTO enreg VALUES (300092,400465,'Nightfall',389,1961,'New York','Capitol Studio');
INSERT INTO enreg VALUES (300093,400466,'Tomorrow Is the Question!',320,1959,'Los Angeles','Contemporary Studio');
INSERT INTO enreg VALUES (300093,400467,'Mind Games',398,1959,'Los Angeles','Contemporary Studio');
INSERT INTO enreg VALUES (300093,400468,'Turnaround',355,1959,'Los Angeles','Contemporary Studio');
INSERT INTO enreg VALUES (300093,400469,'Compassion',315,1959,'Los Angeles','Contemporary Studio');
INSERT INTO enreg VALUES (300093,400470,'Blues Connotation',331,1959,'Los Angeles','Contemporary Studio');
INSERT INTO enreg VALUES (300094,400471,'Lost Chords',410,1986,'Milan','Studio BMG');
INSERT INTO enreg VALUES (300094,400472,'Mediterranean Steps',450,1986,'Milan','Studio BMG');
INSERT INTO enreg VALUES (300094,400473,'Sunset',325,1986,'Milan','Studio BMG');
INSERT INTO enreg VALUES (300094,400474,'Blue Waltz',356,1986,'Milan','Studio BMG');
INSERT INTO enreg VALUES (300094,400475,'Night Watch',321,1986,'Milan','Studio BMG');
INSERT INTO enreg VALUES (300095,400476,'Enrico in Paris',374,2005,'Paris','Studio Ferber');
INSERT INTO enreg VALUES (300095,400477,'Paris Rendezvous',312,2005,'Paris','Studio Ferber');
INSERT INTO enreg VALUES (300095,400478,'Cafe Montmartre',345,2005,'Paris','Studio Ferber');
INSERT INTO enreg VALUES (300095,400479,'Midnight Seine',316,2005,'Paris','Studio Ferber');
INSERT INTO enreg VALUES (300095,400480,'Swing Bal',298,2005,'Paris','Studio Ferber');
INSERT INTO enreg VALUES (300096,400481,'Moon Germs',511,1973,'New York','Blue Note Studio');
INSERT INTO enreg VALUES (300096,400482,'Tuesday Wonderland',423,1973,'New York','Blue Note Studio');
INSERT INTO enreg VALUES (300096,400483,'Evening Hues',342,1973,'New York','Blue Note Studio');
INSERT INTO enreg VALUES (300096,400484,'Blue Sphere',256,1973,'New York','Blue Note Studio');
INSERT INTO enreg VALUES (300096,400485,'Red Arrow',315,1973,'New York','Blue Note Studio');
INSERT INTO enreg VALUES (300097,400486,'EnRoute',399,2004,'Los Angeles','Universal Sound');
INSERT INTO enreg VALUES (300097,400487,'Silver Lining',309,2004,'Los Angeles','Universal Sound');
INSERT INTO enreg VALUES (300097,400488,'Back Home Again',345,2004,'Los Angeles','Universal Sound');
INSERT INTO enreg VALUES (300097,400489,'Down the Line',320,2004,'Los Angeles','Universal Sound');
INSERT INTO enreg VALUES (300097,400490,'Big Sky',280,2004,'Los Angeles','Universal Sound');
INSERT INTO enreg VALUES (300098,400491,'Blues Walk',300,1958,'New York','Blue Note Studio');
INSERT INTO enreg VALUES (300098,400492,'Call It Stormy Monday',250,1958,'New York','Blue Note Studio');
INSERT INTO enreg VALUES (300098,400493,'Blue Minor',276,1958,'New York','Blue Note Studio');
INSERT INTO enreg VALUES (300098,400494,'Midnight Special',312,1958,'New York','Blue Note Studio');
INSERT INTO enreg VALUES (300098,400495,'Night Watch',284,1958,'New York','Blue Note Studio');
INSERT INTO enreg VALUES (300099,400496,'You Must Believe in Spring',344,1981,'Paris','Studio Davout');
INSERT INTO enreg VALUES (300099,400497,'Song for Helen',312,1981,'Paris','Studio Davout');
INSERT INTO enreg VALUES (300099,400498,'B Minor Waltz',287,1981,'Paris','Studio Davout');
INSERT INTO enreg VALUES (300099,400499,'We Will Meet Again',329,1981,'Paris','Studio Davout');
INSERT INTO enreg VALUES (300099,400500,'Bill’s Hit Tune',301,1981,'Paris','Studio Davout');
INSERT INTO enreg VALUES (300100,400501,'Free Jazz',1040,1961,'New York','Atlantic Studio');
INSERT INTO enreg VALUES (300100,400502,'Four For One',413,1961,'New York','Atlantic Studio');
INSERT INTO enreg VALUES (300100,400503,'Abstract',372,1961,'New York','Atlantic Studio');
INSERT INTO enreg VALUES (300100,400504,'First Take',495,1961,'New York','Atlantic Studio');
INSERT INTO enreg VALUES (300100,400505,'Chant',390,1961,'New York','Atlantic Studio');

----- Interpret
-- Pour 400001 à 400005 (Kind of Blue, cd 300001) : 4 interprètes
INSERT INTO interp VALUES (300001,400001,100002,'Trompette');     -- Miles Davis
INSERT INTO interp VALUES (300001,400001,100001,'Sax Tenor');     -- John Coltrane
INSERT INTO interp VALUES (300001,400001,100004,'Piano');         -- Bill Evans
INSERT INTO interp VALUES (300001,400001,100009,'Batterie');      -- Art Blakey

INSERT INTO interp VALUES (300001,400002,100002,'Trompette');
INSERT INTO interp VALUES (300001,400002,100006,'Saxophone');
INSERT INTO interp VALUES (300001,400002,100004,'Piano');
INSERT INTO interp VALUES (300001,400002,100009,'Batterie');

INSERT INTO interp VALUES (300001,400003,100002,'Trompette');
INSERT INTO interp VALUES (300001,400003,100001,'Sax Tenor');
INSERT INTO interp VALUES (300001,400003,100004,'Piano');

INSERT INTO interp VALUES (300001,400004,100002,'Trompette');
INSERT INTO interp VALUES (300001,400004,100001,'Sax Tenor');
INSERT INTO interp VALUES (300001,400004,100004,'Piano');
INSERT INTO interp VALUES (300001,400004,100009,'Batterie');

INSERT INTO interp VALUES (300001,400005,100002,'Trompette');
INSERT INTO interp VALUES (300001,400005,100001,'Sax Tenor');
INSERT INTO interp VALUES (300001,400005,100004,'Piano');

-- Pour 400006 à 400010 (A Love Supreme, cd 300002) : 3 interprètes
INSERT INTO interp VALUES (300002,400006,100001,'Sax Tenor');
INSERT INTO interp VALUES (300002,400006,100009,'Batterie');
INSERT INTO interp VALUES (300002,400006,100003,'Piano');

INSERT INTO interp VALUES (300002,400007,100001,'Sax Tenor');
INSERT INTO interp VALUES (300002,400007,100011,'Contrebasse');
INSERT INTO interp VALUES (300002,400007,100009,'Batterie');

INSERT INTO interp VALUES (300002,400008,100001,'Sax Tenor');
INSERT INTO interp VALUES (300002,400008,100011,'Contrebasse');
INSERT INTO interp VALUES (300002,400008,100009,'Batterie');

INSERT INTO interp VALUES (300002,400009,100001,'Sax Tenor');
INSERT INTO interp VALUES (300002,400009,100011,'Contrebasse');
INSERT INTO interp VALUES (300002,400009,100010,'Sax Soprano');

INSERT INTO interp VALUES (300002,400010,100001,'Sax Tenor');
INSERT INTO interp VALUES (300002,400010,100011,'Contrebasse');
INSERT INTO interp VALUES (300002,400010,100003,'Piano');

-- Pour 400011 à 400015 (Maiden Voyage, cd 300003) : 2 interprètes
INSERT INTO interp VALUES (300003,400011,100003,'Piano');
INSERT INTO interp VALUES (300003,400011,100013,'Basse');

INSERT INTO interp VALUES (300003,400012,100003,'Piano');
INSERT INTO interp VALUES (300003,400012,100014,'Guitare');

INSERT INTO interp VALUES (300003,400013,100003,'Piano');
INSERT INTO interp VALUES (300003,400013,100013,'Basse');

INSERT INTO interp VALUES (300003,400014,100003,'Piano');
INSERT INTO interp VALUES (300003,400014,100014,'Guitare');

INSERT INTO interp VALUES (300003,400015,100003,'Piano');
INSERT INTO interp VALUES (300003,400015,100013,'Basse');

-- Pour 400016 à 400020 (Köln Concert, cd 300004) : 1 interprète
INSERT INTO interp VALUES (300004,400016,100015,'Piano');
INSERT INTO interp VALUES (300004,400017,100015,'Piano');
INSERT INTO interp VALUES (300004,400018,100015,'Piano');
INSERT INTO interp VALUES (300004,400019,100015,'Piano');
INSERT INTO interp VALUES (300004,400020,100015,'Piano');

-- Pour 400021 à 400025 (Bright Size Life, cd 300005) : 2 interprètes
INSERT INTO interp VALUES (300005,400021,100014,'Guitare');
INSERT INTO interp VALUES (300005,400021,100013,'Basse');

INSERT INTO interp VALUES (300005,400022,100014,'Guitare');
INSERT INTO interp VALUES (300005,400022,100013,'Basse');

INSERT INTO interp VALUES (300005,400023,100014,'Guitare');
INSERT INTO interp VALUES (300005,400023,100013,'Basse');

INSERT INTO interp VALUES (300005,400024,100014,'Guitare');
INSERT INTO interp VALUES (300005,400024,100013,'Basse');

INSERT INTO interp VALUES (300005,400025,100014,'Guitare');
INSERT INTO interp VALUES (300005,400025,100013,'Basse');


-- CD 300021 (400101 à 400105) : 3 interprètes par morceau
INSERT INTO interp VALUES (300021,400101,100020,'Sax Tenor');
INSERT INTO interp VALUES (300021,400101,100026,'Piano');
INSERT INTO interp VALUES (300021,400101,100030,'Contrebasse');
INSERT INTO interp VALUES (300021,400102,100020,'Sax Tenor');
INSERT INTO interp VALUES (300021,400102,100018,'Batterie');
INSERT INTO interp VALUES (300021,400102,100030,'Contrebasse');
INSERT INTO interp VALUES (300021,400103,100020,'Sax Tenor');
INSERT INTO interp VALUES (300021,400103,100026,'Piano');
INSERT INTO interp VALUES (300021,400103,100030,'Contrebasse');
INSERT INTO interp VALUES (300021,400104,100020,'Sax Tenor');
INSERT INTO interp VALUES (300021,400104,100026,'Piano');
INSERT INTO interp VALUES (300021,400104,100030,'Contrebasse');
INSERT INTO interp VALUES (300021,400105,100020,'Sax Tenor');
INSERT INTO interp VALUES (300021,400105,100026,'Piano');
INSERT INTO interp VALUES (300021,400105,100018,'Batterie');

-- CD 300022 (400106 à 400110) : 2 interprètes par morceau
INSERT INTO interp VALUES (300022,400106,100002,'Trompette');
INSERT INTO interp VALUES (300022,400106,100004,'Piano');
INSERT INTO interp VALUES (300022,400107,100010,'Sax Soprano');
INSERT INTO interp VALUES (300022,400107,100027,'Clarinette');
INSERT INTO interp VALUES (300022,400108,100033,'Guitare');
INSERT INTO interp VALUES (300022,400108,100029,'Trombone');
INSERT INTO interp VALUES (300022,400109,100036,'Sax Baryton');
INSERT INTO interp VALUES (300022,400109,100003,'Piano');
INSERT INTO interp VALUES (300022,400110,100002,'Trompette');
INSERT INTO interp VALUES (300022,400110,100019,'Sax Tenor');

-- CD 300023 (400111 à 400115) : 4 interprètes par morceau
INSERT INTO interp VALUES (300023,400111,100004,'Piano');
INSERT INTO interp VALUES (300023,400111,100018,'Batterie');
INSERT INTO interp VALUES (300023,400111,100030,'Contrebasse');
INSERT INTO interp VALUES (300023,400111,100019,'Sax Tenor');
INSERT INTO interp VALUES (300023,400112,100004,'Piano');
INSERT INTO interp VALUES (300023,400112,100018,'Batterie');
INSERT INTO interp VALUES (300023,400112,100030,'Contrebasse');
INSERT INTO interp VALUES (300023,400112,100036,'Sax Soprano');
INSERT INTO interp VALUES (300023,400113,100004,'Piano');
INSERT INTO interp VALUES (300023,400113,100018,'Batterie');
INSERT INTO interp VALUES (300023,400113,100030,'Contrebasse');
INSERT INTO interp VALUES (300023,400113,100023,'Sax Alto');
INSERT INTO interp VALUES (300023,400114,100004,'Piano');
INSERT INTO interp VALUES (300023,400114,100018,'Batterie');
INSERT INTO interp VALUES (300023,400114,100030,'Contrebasse');
INSERT INTO interp VALUES (300023,400114,100036,'Sax Soprano');
INSERT INTO interp VALUES (300023,400115,100004,'Piano');
INSERT INTO interp VALUES (300023,400115,100018,'Batterie');
INSERT INTO interp VALUES (300023,400115,100030,'Contrebasse');
INSERT INTO interp VALUES (300023,400115,100023,'Sax Alto');

-- CD 300024 (400116 à 400120) : 1 interprète par morceau
INSERT INTO interp VALUES (300024,400116,100015,'Piano');
INSERT INTO interp VALUES (300024,400117,100015,'Piano');
INSERT INTO interp VALUES (300024,400118,100015,'Piano');
INSERT INTO interp VALUES (300024,400119,100015,'Piano');
INSERT INTO interp VALUES (300024,400120,100015,'Piano');

-- CD 300025 (400121 à 400125) : 3 interprètes par morceau
INSERT INTO interp VALUES (300025,400121,100019,'Sax Tenor');
INSERT INTO interp VALUES (300025,400121,100032,'Batterie');
INSERT INTO interp VALUES (300025,400121,100014,'Guitare');
INSERT INTO interp VALUES (300025,400122,100019,'Sax Tenor');
INSERT INTO interp VALUES (300025,400122,100032,'Batterie');
INSERT INTO interp VALUES (300025,400122,100014,'Guitare');
INSERT INTO interp VALUES (300025,400123,100019,'Sax Tenor');
INSERT INTO interp VALUES (300025,400123,100032,'Batterie');
INSERT INTO interp VALUES (300025,400123,100014,'Guitare');
INSERT INTO interp VALUES (300025,400124,100019,'Sax Tenor');
INSERT INTO interp VALUES (300025,400124,100032,'Batterie');
INSERT INTO interp VALUES (300025,400124,100014,'Guitare');
INSERT INTO interp VALUES (300025,400125,100019,'Sax Tenor');
INSERT INTO interp VALUES (300025,400125,100032,'Batterie');
INSERT INTO interp VALUES (300025,400125,100014,'Guitare');

-- CD 300026 (400126 à 400130) : 2 interprètes par morceau
INSERT INTO interp VALUES (300026,400126,100012,'Piano');
INSERT INTO interp VALUES (300026,400126,100028,'Clarinette');
INSERT INTO interp VALUES (300026,400127,100012,'Piano');
INSERT INTO interp VALUES (300026,400127,100028,'Clarinette');
INSERT INTO interp VALUES (300026,400128,100012,'Piano');
INSERT INTO interp VALUES (300026,400128,100028,'Clarinette');
INSERT INTO interp VALUES (300026,400129,100012,'Piano');
INSERT INTO interp VALUES (300026,400129,100028,'Clarinette');
INSERT INTO interp VALUES (300026,400130,100012,'Piano');
INSERT INTO interp VALUES (300026,400130,100028,'Clarinette');

-- Pour les enregistrements suivants, poursuis ce modèle de répartition (2 à 4 interprètes : choisis des id_musicien parmi 100001–100040, instruments crédibles – sax, trompette, batterie, piano, guitare, vibraphone, trombone, contrebasse, etc.).

-- Jusqu'à 400200 compris pour ce bloc.

-- CD 300027 (400131 à 400135)
INSERT INTO interp VALUES (300027,400131,100003,'Piano');
INSERT INTO interp VALUES (300027,400131,100034,'Sax Soprano');
INSERT INTO interp VALUES (300027,400132,100003,'Piano');
INSERT INTO interp VALUES (300027,400132,100034,'Sax Soprano');
INSERT INTO interp VALUES (300027,400133,100003,'Piano');
INSERT INTO interp VALUES (300027,400133,100034,'Sax Soprano');
INSERT INTO interp VALUES (300027,400134,100003,'Piano');
INSERT INTO interp VALUES (300027,400134,100034,'Sax Soprano');
INSERT INTO interp VALUES (300027,400135,100003,'Piano');
INSERT INTO interp VALUES (300027,400135,100034,'Sax Soprano');

-- CD 300028 (400136 à 400140) : 3 interprètes
INSERT INTO interp VALUES (300028,400136,100025,'Accordéon');
INSERT INTO interp VALUES (300028,400136,100029,'Trombone');
INSERT INTO interp VALUES (300028,400136,100040,'Orgue');
INSERT INTO interp VALUES (300028,400137,100025,'Accordéon');
INSERT INTO interp VALUES (300028,400137,100029,'Trombone');
INSERT INTO interp VALUES (300028,400137,100040,'Orgue');
INSERT INTO interp VALUES (300028,400138,100025,'Accordéon');
INSERT INTO interp VALUES (300028,400138,100029,'Trombone');
INSERT INTO interp VALUES (300028,400138,100040,'Orgue');
INSERT INTO interp VALUES (300028,400139,100025,'Accordéon');
INSERT INTO interp VALUES (300028,400139,100029,'Trombone');
INSERT INTO interp VALUES (300028,400139,100040,'Orgue');
INSERT INTO interp VALUES (300028,400140,100025,'Accordéon');
INSERT INTO interp VALUES (300028,400140,100029,'Trombone');
INSERT INTO interp VALUES (300028,400140,100040,'Orgue');

-- CD 300041 (400206 à 400210) : 5 interprètes pour 400210
INSERT INTO interp VALUES (300041,400206,100014,'Guitare');
INSERT INTO interp VALUES (300041,400206,100013,'Basse');
INSERT INTO interp VALUES (300041,400206,100032,'Batterie');
INSERT INTO interp VALUES (300041,400207,100014,'Guitare');
INSERT INTO interp VALUES (300041,400207,100031,'Percussions');
INSERT INTO interp VALUES (300041,400207,100025,'Accordéon');
INSERT INTO interp VALUES (300041,400208,100014,'Guitare');
INSERT INTO interp VALUES (300041,400208,100013,'Basse');
INSERT INTO interp VALUES (300041,400208,100032,'Batterie');
INSERT INTO interp VALUES (300041,400209,100014,'Guitare');
INSERT INTO interp VALUES (300041,400209,100013,'Basse');
INSERT INTO interp VALUES (300041,400209,100032,'Batterie');
-- 5 interprètes sur 400210
INSERT INTO interp VALUES (300041,400210,100014,'Guitare');
INSERT INTO interp VALUES (300041,400210,100013,'Basse');
INSERT INTO interp VALUES (300041,400210,100032,'Batterie');
INSERT INTO interp VALUES (300041,400210,100029,'Trombone');
INSERT INTO interp VALUES (300041,400210,100035,'Piano');

-- CD 300042 (400211 à 400215)
INSERT INTO interp VALUES (300042,400211,100037,'Piano');
INSERT INTO interp VALUES (300042,400211,100038,'Sax Tenor');
INSERT INTO interp VALUES (300042,400212,100037,'Piano');
INSERT INTO interp VALUES (300042,400212,100039,'Trompette');
INSERT INTO interp VALUES (300042,400213,100037,'Piano');
INSERT INTO interp VALUES (300042,400213,100032,'Batterie');
INSERT INTO interp VALUES (300042,400214,100037,'Piano');
INSERT INTO interp VALUES (300042,400215,100037,'Piano');
INSERT INTO interp VALUES (300042,400215,100038,'Sax Tenor');

-- CD 300043 (400216 à 400220)
INSERT INTO interp VALUES (300043,400216,100016,'Sax Tenor');
INSERT INTO interp VALUES (300043,400216,100012,'Piano');
INSERT INTO interp VALUES (300043,400217,100016,'Sax Tenor');
INSERT INTO interp VALUES (300043,400217,100024,'Piano');
INSERT INTO interp VALUES (300043,400218,100016,'Sax Tenor');
INSERT INTO interp VALUES (300043,400218,100024,'Piano');
INSERT INTO interp VALUES (300043,400219,100016,'Sax Tenor');
INSERT INTO interp VALUES (300043,400219,100024,'Piano');
INSERT INTO interp VALUES (300043,400220,100016,'Sax Tenor');
INSERT INTO interp VALUES (300043,400220,100024,'Piano');

-- CD 300044 (400221 à 400225)
INSERT INTO interp VALUES (300044,400221,100025,'Accordéon');
INSERT INTO interp VALUES (300044,400221,100038,'Sax Alto');
INSERT INTO interp VALUES (300044,400222,100025,'Accordéon');
INSERT INTO interp VALUES (300044,400223,100025,'Accordéon');
INSERT INTO interp VALUES (300044,400224,100025,'Accordéon');
INSERT INTO interp VALUES (300044,400225,100025,'Accordéon');
INSERT INTO interp VALUES (300044,400225,100038,'Sax Alto');

-- CD 300045 (400226 à 400230)
INSERT INTO interp VALUES (300045,400226,100025,'Accordéon');
INSERT INTO interp VALUES (300045,400226,100040,'Orgue');
INSERT INTO interp VALUES (300045,400227,100025,'Accordéon');
INSERT INTO interp VALUES (300045,400227,100040,'Orgue');
INSERT INTO interp VALUES (300045,400228,100025,'Accordéon');
INSERT INTO interp VALUES (300045,400229,100025,'Accordéon');
INSERT INTO interp VALUES (300045,400230,100025,'Accordéon');
INSERT INTO interp VALUES (300045,400230,100040,'Orgue');

-- CD 300046 (400231 à 400235)
INSERT INTO interp VALUES (300046,400231,100006,'Sax Tenor');
INSERT INTO interp VALUES (300046,400231,100007,'Trompette');
INSERT INTO interp VALUES (300046,400232,100006,'Sax Tenor');
INSERT INTO interp VALUES (300046,400233,100006,'Sax Tenor');
INSERT INTO interp VALUES (300046,400234,100006,'Sax Tenor');
INSERT INTO interp VALUES (300046,400235,100006,'Sax Tenor');

-- CD 300047 (400236 à 400240)
INSERT INTO interp VALUES (300047,400236,100001,'Sax Alto');
INSERT INTO interp VALUES (300047,400237,100001,'Sax Alto');
INSERT INTO interp VALUES (300047,400238,100001,'Sax Alto');
INSERT INTO interp VALUES (300047,400239,100001,'Sax Alto');
INSERT INTO interp VALUES (300047,400240,100001,'Sax Alto');

-- CD 300048 (400241 à 400245)
INSERT INTO interp VALUES (300048,400241,100007,'Trompette');
INSERT INTO interp VALUES (300048,400241,100038,'Sax Alto');
INSERT INTO interp VALUES (300048,400242,100007,'Trompette');
INSERT INTO interp VALUES (300048,400243,100007,'Trompette');
INSERT INTO interp VALUES (300048,400244,100007,'Trompette');
INSERT INTO interp VALUES (300048,400245,100007,'Trompette');
INSERT INTO interp VALUES (300048,400245,100038,'Sax Alto');

-- CD 300049 (400246 à 400250)
INSERT INTO interp VALUES (300049,400246,100011,'Contrebasse');
INSERT INTO interp VALUES (300049,400246,100022,'Trombone');
INSERT INTO interp VALUES (300049,400246,100018,'Batterie');
INSERT INTO interp VALUES (300049,400246,100034,'Sax Tenor');
-- 5 interprètes sur 400250
INSERT INTO interp VALUES (300049,400250,100011,'Contrebasse');
INSERT INTO interp VALUES (300049,400250,100022,'Trombone');
INSERT INTO interp VALUES (300049,400250,100018,'Batterie');
INSERT INTO interp VALUES (300049,400250,100034,'Sax Tenor');
INSERT INTO interp VALUES (300049,400250,100015,'Piano');

-- CD 300050 à 300059 (400251 à 400295), 5 interprètes sur 400295
INSERT INTO interp VALUES (300059,400295,100002,'Trompette');
INSERT INTO interp VALUES (300059,400295,100001,'Sax Tenor');
INSERT INTO interp VALUES (300059,400295,100004,'Piano');
INSERT INTO interp VALUES (300059,400295,100009,'Batterie');
INSERT INTO interp VALUES (300059,400295,100011,'Contrebasse');

-- Quelques enregistrements avec 1 interprète
INSERT INTO interp VALUES (300061,400306,100002,'Trompette');
INSERT INTO interp VALUES (300062,400311,100032,'Batterie');
INSERT INTO interp VALUES (300063,400316,100026,'Piano');
INSERT INTO interp VALUES (300064,400321,100019,'Sax Tenor');
INSERT INTO interp VALUES (300065,400326,100037,'Piano');
INSERT INTO interp VALUES (300066,400331,100014,'Guitare');
INSERT INTO interp VALUES (300067,400336,100020,'Sax Tenor');
INSERT INTO interp VALUES (300068,400341,100039,'Trompette');
INSERT INTO interp VALUES (300069,400346,100002,'Trompette');

-- Enregistrements avec 2 interprètes
INSERT INTO interp VALUES (300061,400307,100004,'Piano');
INSERT INTO interp VALUES (300061,400307,100018,'Batterie');
INSERT INTO interp VALUES (300062,400312,100032,'Batterie');
INSERT INTO interp VALUES (300062,400312,100013,'Basse');
INSERT INTO interp VALUES (300063,400317,100026,'Piano');
INSERT INTO interp VALUES (300063,400317,100028,'Clarinette');
INSERT INTO interp VALUES (300064,400322,100019,'Sax Tenor');
INSERT INTO interp VALUES (300064,400322,100032,'Batterie');
INSERT INTO interp VALUES (300065,400327,100037,'Piano');
INSERT INTO interp VALUES (300065,400327,100030,'Contrebasse');
INSERT INTO interp VALUES (300066,400332,100014,'Guitare');
INSERT INTO interp VALUES (300066,400332,100013,'Basse');
INSERT INTO interp VALUES (300067,400337,100020,'Sax Tenor');
INSERT INTO interp VALUES (300067,400337,100033,'Guitare');
INSERT INTO interp VALUES (300068,400342,100039,'Trompette');
INSERT INTO interp VALUES (300068,400342,100018,'Batterie');
INSERT INTO interp VALUES (300069,400347,100002,'Trompette');
INSERT INTO interp VALUES (300069,400347,100020,'Sax Tenor');

-- 3 interprètes
INSERT INTO interp VALUES (300061,400308,100002,'Trompette');
INSERT INTO interp VALUES (300061,400308,100004,'Piano');
INSERT INTO interp VALUES (300061,400308,100018,'Batterie');
INSERT INTO interp VALUES (300062,400313,100032,'Batterie');
INSERT INTO interp VALUES (300062,400313,100013,'Basse');
INSERT INTO interp VALUES (300062,400313,100015,'Piano');
INSERT INTO interp VALUES (300063,400318,100026,'Piano');
INSERT INTO interp VALUES (300063,400318,100028,'Clarinette');
INSERT INTO interp VALUES (300063,400318,100029,'Trombone');
INSERT INTO interp VALUES (300064,400323,100019,'Sax Tenor');
INSERT INTO interp VALUES (300064,400323,100032,'Batterie');
INSERT INTO interp VALUES (300064,400323,100033,'Guitare');
INSERT INTO interp VALUES (300065,400328,100037,'Piano');
INSERT INTO interp VALUES (300065,400328,100030,'Contrebasse');
INSERT INTO interp VALUES (300065,400328,100033,'Guitare');
INSERT INTO interp VALUES (300066,400333,100014,'Guitare');
INSERT INTO interp VALUES (300066,400333,100013,'Basse');
INSERT INTO interp VALUES (300066,400333,100035,'Piano');
INSERT INTO interp VALUES (300067,400338,100020,'Sax Tenor');
INSERT INTO interp VALUES (300067,400338,100033,'Guitare');
INSERT INTO interp VALUES (300067,400338,100037,'Piano');
INSERT INTO interp VALUES (300068,400343,100039,'Trompette');
INSERT INTO interp VALUES (300068,400343,100018,'Batterie');
INSERT INTO interp VALUES (300068,400343,100025,'Accordéon');
INSERT INTO interp VALUES (300069,400348,100002,'Trompette');
INSERT INTO interp VALUES (300069,400348,100020,'Sax Tenor');
INSERT INTO interp VALUES (300069,400348,100032,'Batterie');

-- 4 interprètes
INSERT INTO interp VALUES (300061,400309,100002,'Trompette');
INSERT INTO interp VALUES (300061,400309,100004,'Piano');
INSERT INTO interp VALUES (300061,400309,100018,'Batterie');
INSERT INTO interp VALUES (300061,400309,100030,'Contrebasse');
INSERT INTO interp VALUES (300062,400314,100032,'Batterie');
INSERT INTO interp VALUES (300062,400314,100013,'Basse');
INSERT INTO interp VALUES (300062,400314,100015,'Piano');
INSERT INTO interp VALUES (300062,400314,100020,'Sax Tenor');
INSERT INTO interp VALUES (300063,400319,100026,'Piano');
INSERT INTO interp VALUES (300063,400319,100028,'Clarinette');
INSERT INTO interp VALUES (300063,400319,100029,'Trombone');
INSERT INTO interp VALUES (300063,400319,100025,'Accordéon');
INSERT INTO interp VALUES (300064,400324,100019,'Sax Tenor');
INSERT INTO interp VALUES (300064,400324,100032,'Batterie');
INSERT INTO interp VALUES (300064,400324,100033,'Guitare');
INSERT INTO interp VALUES (300064,400324,100029,'Trombone');
INSERT INTO interp VALUES (300065,400329,100037,'Piano');
INSERT INTO interp VALUES (300065,400329,100030,'Contrebasse');
INSERT INTO interp VALUES (300065,400329,100033,'Guitare');
INSERT INTO interp VALUES (300065,400329,100038,'Sax Alto');

INSERT INTO interp VALUES (300081,400401,100002,'Contrebasse');
INSERT INTO interp VALUES (300081,400402,100015,'Sax Soprano');
INSERT INTO interp VALUES (300081,400402,100009,'Cornet');
INSERT INTO interp VALUES (300081,400403,100038,'Accordéon');
INSERT INTO interp VALUES (300081,400404,100002,'Sax Alto');
INSERT INTO interp VALUES (300081,400405,100015,'Piano');
INSERT INTO interp VALUES (300081,400405,100033,'Cornet');
INSERT INTO interp VALUES (300082,400406,100035,'Batterie');
INSERT INTO interp VALUES (300082,400406,100027,'Orgue');
INSERT INTO interp VALUES (300082,400407,100001,'Guitare');
INSERT INTO interp VALUES (300082,400407,100011,'Contrebasse');
INSERT INTO interp VALUES (300082,400407,100028,'Sax Baryton');
INSERT INTO interp VALUES (300082,400408,100022,'Sax Alto');
INSERT INTO interp VALUES (300082,400408,100007,'Vibraphone');
INSERT INTO interp VALUES (300082,400409,100023,'Clarinette');
INSERT INTO interp VALUES (300082,400410,100003,'Sax Soprano');
INSERT INTO interp VALUES (300082,400410,100030,'Vibraphone');
INSERT INTO interp VALUES (300082,400410,100035,'Sax Alto');
INSERT INTO interp VALUES (300083,400411,100040,'Trombone');
INSERT INTO interp VALUES (300083,400411,100024,'Sax Alto');
INSERT INTO interp VALUES (300083,400411,100037,'Sax Tenor');
INSERT INTO interp VALUES (300083,400412,100019,'Batterie');
INSERT INTO interp VALUES (300083,400412,100006,'Sax Soprano');
INSERT INTO interp VALUES (300083,400413,100018,'Clarinette');
INSERT INTO interp VALUES (300083,400413,100030,'Bugle');
INSERT INTO interp VALUES (300083,400413,100024,'Trombone');
INSERT INTO interp VALUES (300083,400413,100011,'Contrebasse');
INSERT INTO interp VALUES (300083,400414,100039,'Trompette');
INSERT INTO interp VALUES (300083,400415,100011,'Vibraphone');
INSERT INTO interp VALUES (300083,400415,100030,'Contrebasse');
INSERT INTO interp VALUES (300084,400416,100021,'Batterie');
INSERT INTO interp VALUES (300084,400416,100004,'Sax Tenor');
INSERT INTO interp VALUES (300084,400417,100026,'Trombone');
INSERT INTO interp VALUES (300084,400417,100018,'Guitare');
INSERT INTO interp VALUES (300084,400417,100005,'Bugle');
INSERT INTO interp VALUES (300084,400418,100026,'Sax Baryton');
INSERT INTO interp VALUES (300084,400418,100030,'Batterie');
INSERT INTO interp VALUES (300084,400418,100010,'Contrebasse');
INSERT INTO interp VALUES (300084,400418,100017,'Accordéon');
INSERT INTO interp VALUES (300084,400419,100024,'Percussions');
INSERT INTO interp VALUES (300084,400419,100015,'Sax Alto');
INSERT INTO interp VALUES (300084,400419,100009,'Sax Tenor');
INSERT INTO interp VALUES (300084,400419,100033,'Sax Soprano');
INSERT INTO interp VALUES (300084,400420,100011,'Sax Alto');
INSERT INTO interp VALUES (300084,400420,100028,'Vibraphone');
INSERT INTO interp VALUES (300085,400421,100039,'Cornet');
INSERT INTO interp VALUES (300085,400421,100030,'Piano');
INSERT INTO interp VALUES (300085,400421,100034,'Sax Soprano');
INSERT INTO interp VALUES (300085,400421,100017,'Contrebasse');
INSERT INTO interp VALUES (300085,400422,100008,'Trompette');
INSERT INTO interp VALUES (300085,400422,100019,'Orgue');
INSERT INTO interp VALUES (300085,400422,100028,'Piano');
INSERT INTO interp VALUES (300085,400423,100033,'Basse');
INSERT INTO interp VALUES (300085,400423,100012,'Flûte');
INSERT INTO interp VALUES (300085,400423,100007,'Trombone');
INSERT INTO interp VALUES (300085,400424,100024,'Cornet');
INSERT INTO interp VALUES (300085,400424,100011,'Flûte');
INSERT INTO interp VALUES (300085,400425,100039,'Guitare');
INSERT INTO interp VALUES (300086,400426,100002,'Batterie');
INSERT INTO interp VALUES (300086,400426,100008,'Sax Tenor');
INSERT INTO interp VALUES (300086,400426,100024,'Bugle');
INSERT INTO interp VALUES (300086,400426,100020,'Sax Alto');
INSERT INTO interp VALUES (300086,400427,100032,'Sax Alto');
INSERT INTO interp VALUES (300086,400428,100009,'Cornet');
INSERT INTO interp VALUES (300086,400428,100031,'Trompette');
INSERT INTO interp VALUES (300086,400429,100034,'Trombone');
INSERT INTO interp VALUES (300086,400429,100039,'Cornet');
INSERT INTO interp VALUES (300086,400429,100028,'Bugle');
INSERT INTO interp VALUES (300086,400430,100026,'Flûte');
INSERT INTO interp VALUES (300086,400430,100024,'Orgue');
INSERT INTO interp VALUES (300086,400430,100029,'Sax Soprano');
INSERT INTO interp VALUES (300087,400431,100015,'Guitare');
INSERT INTO interp VALUES (300087,400431,100005,'Piano');
INSERT INTO interp VALUES (300087,400432,100038,'Piano');
INSERT INTO interp VALUES (300087,400432,100015,'Sax Alto');
INSERT INTO interp VALUES (300087,400433,100015,'Sax Alto');
INSERT INTO interp VALUES (300087,400434,100022,'Sax Alto');
INSERT INTO interp VALUES (300087,400435,100018,'Trombone');
INSERT INTO interp VALUES (300087,400435,100032,'Cornet');
INSERT INTO interp VALUES (300088,400436,100037,'Batterie');
INSERT INTO interp VALUES (300088,400436,100031,'Percussions');
INSERT INTO interp VALUES (300088,400437,100013,'Accordéon');
INSERT INTO interp VALUES (300088,400437,100007,'Bugle');
INSERT INTO interp VALUES (300088,400437,100028,'Orgue');
INSERT INTO interp VALUES (300088,400437,100023,'Sax Tenor');
INSERT INTO interp VALUES (300088,400438,100004,'Vibraphone');
INSERT INTO interp VALUES (300088,400439,100007,'Trombone');
INSERT INTO interp VALUES (300088,400439,100016,'Cornet');
INSERT INTO interp VALUES (300088,400439,100013,'Orgue');
INSERT INTO interp VALUES (300088,400440,100028,'Contrebasse');
INSERT INTO interp VALUES (300088,400440,100012,'Orgue');
INSERT INTO interp VALUES (300089,400441,100005,'Cornet');
INSERT INTO interp VALUES (300089,400441,100029,'Sax Soprano');
INSERT INTO interp VALUES (300089,400442,100035,'Piano');
INSERT INTO interp VALUES (300089,400443,100016,'Trompette');
INSERT INTO interp VALUES (300089,400444,100032,'Sax Tenor');
INSERT INTO interp VALUES (300089,400444,100031,'Trompette');
INSERT INTO interp VALUES (300089,400444,100014,'Vibraphone');
INSERT INTO interp VALUES (300089,400444,100026,'Piano');
INSERT INTO interp VALUES (300089,400445,100017,'Cornet');
INSERT INTO interp VALUES (300090,400446,100020,'Sax Soprano');
INSERT INTO interp VALUES (300090,400446,100008,'Vibraphone');
INSERT INTO interp VALUES (300090,400446,100009,'Guitare');
INSERT INTO interp VALUES (300090,400447,100039,'Sax Alto');
INSERT INTO interp VALUES (300090,400447,100001,'Batterie');
INSERT INTO interp VALUES (300090,400448,100031,'Sax Soprano');
INSERT INTO interp VALUES (300090,400449,100016,'Sax Baryton');
INSERT INTO interp VALUES (300090,400449,100033,'Sax Soprano');
INSERT INTO interp VALUES (300090,400449,100037,'Bugle');
INSERT INTO interp VALUES (300090,400450,100008,'Percussions');
INSERT INTO interp VALUES (300090,400450,100015,'Trombone');
INSERT INTO interp VALUES (300091,400451,100025,'Sax Tenor');
INSERT INTO interp VALUES (300091,400451,100031,'Orgue');
INSERT INTO interp VALUES (300091,400451,100007,'Sax Soprano');
INSERT INTO interp VALUES (300091,400452,100033,'Sax Baryton');
INSERT INTO interp VALUES (300091,400452,100019,'Cornet');
INSERT INTO interp VALUES (300091,400453,100004,'Guitare');
INSERT INTO interp VALUES (300091,400453,100020,'Batterie');
INSERT INTO interp VALUES (300091,400453,100016,'Contrebasse');
INSERT INTO interp VALUES (300091,400454,100038,'Sax Soprano');
INSERT INTO interp VALUES (300091,400454,100028,'Trombone');
INSERT INTO interp VALUES (300091,400454,100014,'Vibraphone');
INSERT INTO interp VALUES (300091,400454,100017,'Sax Baryton');
INSERT INTO interp VALUES (300091,400455,100001,'Trompette');
INSERT INTO interp VALUES (300091,400455,100039,'Batterie');
INSERT INTO interp VALUES (300092,400456,100035,'Sax Soprano');
INSERT INTO interp VALUES (300092,400456,100005,'Sax Baryton');
INSERT INTO interp VALUES (300092,400456,100031,'Cornet');
INSERT INTO interp VALUES (300092,400456,100032,'Contrebasse');
INSERT INTO interp VALUES (300092,400457,100023,'Trombone');
INSERT INTO interp VALUES (300092,400457,100009,'Trompette');
INSERT INTO interp VALUES (300092,400458,100020,'Cornet');
INSERT INTO interp VALUES (300092,400459,100011,'Basse');
INSERT INTO interp VALUES (300092,400459,100026,'Sax Soprano');
INSERT INTO interp VALUES (300092,400459,100035,'Orgue');
INSERT INTO interp VALUES (300092,400460,100001,'Sax Tenor');
INSERT INTO interp VALUES (300092,400460,100007,'Cornet');
INSERT INTO interp VALUES (300092,400460,100025,'Sax Alto');
INSERT INTO interp VALUES (300093,400461,100004,'Trombone');
INSERT INTO interp VALUES (300093,400461,100014,'Bugle');
INSERT INTO interp VALUES (300093,400461,100024,'Cornet');
INSERT INTO interp VALUES (300093,400462,100007,'Basse');
INSERT INTO interp VALUES (300093,400462,100036,'Bugle');
INSERT INTO interp VALUES (300093,400462,100010,'Vibraphone');
INSERT INTO interp VALUES (300093,400462,100014,'Sax Soprano');
INSERT INTO interp VALUES (300093,400463,100007,'Contrebasse');
INSERT INTO interp VALUES (300093,400463,100031,'Sax Baryton');
INSERT INTO interp VALUES (300093,400464,100019,'Sax Alto');
INSERT INTO interp VALUES (300093,400464,100006,'Flûte');
INSERT INTO interp VALUES (300093,400464,100002,'Orgue');
INSERT INTO interp VALUES (300093,400465,100023,'Guitare');
INSERT INTO interp VALUES (300093,400465,100015,'Bugle');
INSERT INTO interp VALUES (300094,400466,100008,'Clarinette');
INSERT INTO interp VALUES (300094,400466,100003,'Bugle');
INSERT INTO interp VALUES (300094,400467,100014,'Percussions');
INSERT INTO interp VALUES (300094,400467,100032,'Trombone');
INSERT INTO interp VALUES (300094,400467,100023,'Contrebasse');
INSERT INTO interp VALUES (300094,400467,100034,'Clarinette');
INSERT INTO interp VALUES (300094,400468,100025,'Flûte');
INSERT INTO interp VALUES (300094,400469,100024,'Guitare');
INSERT INTO interp VALUES (300094,400469,100005,'Contrebasse');
INSERT INTO interp VALUES (300094,400469,100012,'Vibraphone');
INSERT INTO interp VALUES (300094,400470,100017,'Sax Baryton');
INSERT INTO interp VALUES (300095,400471,100013,'Sax Tenor');
INSERT INTO interp VALUES (300095,400471,100026,'Sax Soprano');
INSERT INTO interp VALUES (300095,400471,100035,'Guitare');
INSERT INTO interp VALUES (300095,400472,100021,'Sax Baryton');
INSERT INTO interp VALUES (300095,400472,100003,'Vibraphone');
INSERT INTO interp VALUES (300095,400472,100007,'Contrebasse');
INSERT INTO interp VALUES (300095,400472,100031,'Flûte');
INSERT INTO interp VALUES (300095,400473,100035,'Vibraphone');
INSERT INTO interp VALUES (300095,400473,100038,'Sax Soprano');
INSERT INTO interp VALUES (300095,400474,100002,'Trompette');
INSERT INTO interp VALUES (300095,400474,100015,'Cornet');
INSERT INTO interp VALUES (300095,400474,100039,'Sax Baryton');
INSERT INTO interp VALUES (300095,400475,100001,'Guitare');
INSERT INTO interp VALUES (300095,400475,100012,'Trompette');
INSERT INTO interp VALUES (300096,400476,100025,'Cornet');
INSERT INTO interp VALUES (300096,400476,100001,'Trombone');
INSERT INTO interp VALUES (300096,400476,100038,'Vibraphone');
INSERT INTO interp VALUES (300096,400477,100040,'Trompette');
INSERT INTO interp VALUES (300096,400477,100007,'Contrebasse');
INSERT INTO interp VALUES (300096,400477,100015,'Sax Alto');
INSERT INTO interp VALUES (300096,400478,100038,'Guitare');
INSERT INTO interp VALUES (300096,400478,100024,'Orgue');
INSERT INTO interp VALUES (300096,400479,100020,'Trompette');
INSERT INTO interp VALUES (300096,400479,100009,'Batterie');
INSERT INTO interp VALUES (300096,400479,100025,'Sax Soprano');
INSERT INTO interp VALUES (300096,400479,100039,'Sax Baryton');
INSERT INTO interp VALUES (300096,400480,100003,'Cornet');
INSERT INTO interp VALUES (300096,400480,100014,'Sax Soprano');
INSERT INTO interp VALUES (300097,400481,100022,'Sax Baryton');
INSERT INTO interp VALUES (300097,400481,100006,'Orgue');
INSERT INTO interp VALUES (300097,400481,100037,'Guitare');
INSERT INTO interp VALUES (300097,400482,100032,'Sax Soprano');
INSERT INTO interp VALUES (300097,400482,100036,'Orgue');
INSERT INTO interp VALUES (300097,400482,100015,'Flûte');
INSERT INTO interp VALUES (300097,400482,100023,'Contrebasse');
INSERT INTO interp VALUES (300097,400483,100039,'Sax Alto');
INSERT INTO interp VALUES (300097,400483,100012,'Bugle');
INSERT INTO interp VALUES (300097,400484,100035,'Clarinette');
INSERT INTO interp VALUES (300097,400484,100038,'Sax Tenor');
INSERT INTO interp VALUES (300097,400484,100007,'Batterie');
INSERT INTO interp VALUES (300097,400485,100009,'Sax Baryton');
INSERT INTO interp VALUES (300097,400485,100027,'Trombone');
INSERT INTO interp VALUES (300097,400485,100003,'Flûte');
INSERT INTO interp VALUES (300098,400486,100018,'Sax Baryton');
INSERT INTO interp VALUES (300098,400486,100029,'Trombone');
INSERT INTO interp VALUES (300098,400486,100031,'Contrebasse');
INSERT INTO interp VALUES (300098,400487,100030,'Sax Soprano');
INSERT INTO interp VALUES (300098,400487,100025,'Trompette');
INSERT INTO interp VALUES (300098,400488,100009,'Orgue');
INSERT INTO interp VALUES (300098,400488,100013,'Sax Baryton');
INSERT INTO interp VALUES (300098,400488,100002,'Clarinette');
INSERT INTO interp VALUES (300098,400489,100010,'Batterie');
INSERT INTO interp VALUES (300098,400490,100029,'Sax Soprano');
INSERT INTO interp VALUES (300098,400490,100005,'Trombone');
INSERT INTO interp VALUES (300098,400490,100020,'Flûte');
INSERT INTO interp VALUES (300099,400491,100002,'Batterie');
INSERT INTO interp VALUES (300099,400491,100027,'Sax Soprano');
INSERT INTO interp VALUES (300099,400491,100015,'Contrebasse');
INSERT INTO interp VALUES (300099,400492,100029,'Clarinette');
INSERT INTO interp VALUES (300099,400492,100031,'Bugle');
INSERT INTO interp VALUES (300099,400492,100007,'Guitare');
INSERT INTO interp VALUES (300099,400493,100003,'Sax Baryton');
INSERT INTO interp VALUES (300099,400493,100035,'Vibraphone');
INSERT INTO interp VALUES (300099,400494,100038,'Contrebasse');
INSERT INTO interp VALUES (300099,400494,100008,'Trombone');
INSERT INTO interp VALUES (300099,400494,100001,'Sax Alto');
INSERT INTO interp VALUES (300099,400495,100004,'Sax Tenor');
INSERT INTO interp VALUES (300099,400495,100026,'Vibraphone');
INSERT INTO interp VALUES (300100,400496,100035,'Sax Soprano');
INSERT INTO interp VALUES (300100,400497,100003,'Sax Baryton');
INSERT INTO interp VALUES (300100,400497,100028,'Bugle');
INSERT INTO interp VALUES (300100,400497,100018,'Orgue');
INSERT INTO interp VALUES (300100,400498,100032,'Sax Soprano');
INSERT INTO interp VALUES (300100,400499,100004,'Sax Tenor');
INSERT INTO interp VALUES (300100,400499,100026,'Contrebasse');
INSERT INTO interp VALUES (300100,400499,100031,'Trombone');
INSERT INTO interp VALUES (300100,400500,100009,'Sax Baryton');
INSERT INTO interp VALUES (300100,400500,100036,'Bugle');
INSERT INTO interp VALUES (300100,400500,100016,'Guitare');
INSERT INTO interp VALUES (300100,400500,100003,'Vibraphone');

---- LEADER

-- 3 CD avec 3 leaders
INSERT INTO leader VALUES (300001,100001);
INSERT INTO leader VALUES (300001,100002);
INSERT INTO leader VALUES (300001,100003);

INSERT INTO leader VALUES (300002,100004);
INSERT INTO leader VALUES (300002,100010);
INSERT INTO leader VALUES (300002,100011);

INSERT INTO leader VALUES (300003,100009);
INSERT INTO leader VALUES (300003,100005);
INSERT INTO leader VALUES (300003,100006);

-- 10 CD avec 2 leaders
INSERT INTO leader VALUES (300004,100014);
INSERT INTO leader VALUES (300004,100015);

INSERT INTO leader VALUES (300005,100013);
INSERT INTO leader VALUES (300005,100016);

INSERT INTO leader VALUES (300006,100006);
INSERT INTO leader VALUES (300006,100021);

INSERT INTO leader VALUES (300007,100004);
INSERT INTO leader VALUES (300007,100019);

INSERT INTO leader VALUES (300008,100017);
INSERT INTO leader VALUES (300008,100023);

INSERT INTO leader VALUES (300009,100030);
INSERT INTO leader VALUES (300009,100037);

INSERT INTO leader VALUES (300010,100031);
INSERT INTO leader VALUES (300010,100032);

INSERT INTO leader VALUES (300011,100020);
INSERT INTO leader VALUES (300011,100019);

INSERT INTO leader VALUES (300012,100008);
INSERT INTO leader VALUES (300012,100039);

INSERT INTO leader VALUES (300013,100005);
INSERT INTO leader VALUES (300013,100027);

-- Les autres CD ont un seul leader :
INSERT INTO leader VALUES (300014,100011);
INSERT INTO leader VALUES (300015,100002);
INSERT INTO leader VALUES (300016,100013);
INSERT INTO leader VALUES (300017,100033);
INSERT INTO leader VALUES (300018,100020);
INSERT INTO leader VALUES (300019,100038);
INSERT INTO leader VALUES (300020,100029);
INSERT INTO leader VALUES (300021,100021);
INSERT INTO leader VALUES (300022,100034);
INSERT INTO leader VALUES (300023,100007);
INSERT INTO leader VALUES (300024,100015);
INSERT INTO leader VALUES (300025,100019);
INSERT INTO leader VALUES (300026,100023);
INSERT INTO leader VALUES (300027,100003);
INSERT INTO leader VALUES (300028,100025);
INSERT INTO leader VALUES (300029,100012);
INSERT INTO leader VALUES (300030,100001);
INSERT INTO leader VALUES (300031,100036);
INSERT INTO leader VALUES (300032,100013);
INSERT INTO leader VALUES (300033,100021);
INSERT INTO leader VALUES (300034,100004);
INSERT INTO leader VALUES (300035,100006);
INSERT INTO leader VALUES (300036,100040);
INSERT INTO leader VALUES (300037,100018);
INSERT INTO leader VALUES (300038,100037);
INSERT INTO leader VALUES (300039,100017);
INSERT INTO leader VALUES (300040,100025);
INSERT INTO leader VALUES (300041,100014);
INSERT INTO leader VALUES (300042,100037);
INSERT INTO leader VALUES (300043,100016);
INSERT INTO leader VALUES (300044,100025);
INSERT INTO leader VALUES (300045,100025);
INSERT INTO leader VALUES (300046,100006);
INSERT INTO leader VALUES (300047,100001);
INSERT INTO leader VALUES (300048,100007);
INSERT INTO leader VALUES (300049,100011);
INSERT INTO leader VALUES (300050,100012);
INSERT INTO leader VALUES (300051,100009);
INSERT INTO leader VALUES (300052,100026);
INSERT INTO leader VALUES (300053,100028);
INSERT INTO leader VALUES (300054,100025);
INSERT INTO leader VALUES (300055,100033);
INSERT INTO leader VALUES (300056,100002);
INSERT INTO leader VALUES (300057,100002);
INSERT INTO leader VALUES (300058,100002);
INSERT INTO leader VALUES (300059,100002);
INSERT INTO leader VALUES (300060,100003);
INSERT INTO leader VALUES (300061,100002);
INSERT INTO leader VALUES (300062,100021);
INSERT INTO leader VALUES (300063,100026);
INSERT INTO leader VALUES (300064,100019);
INSERT INTO leader VALUES (300065,100037);
INSERT INTO leader VALUES (300066,100014);
INSERT INTO leader VALUES (300067,100020);
INSERT INTO leader VALUES (300068,100039);
INSERT INTO leader VALUES (300069,100020);
INSERT INTO leader VALUES (300070,100002);
INSERT INTO leader VALUES (300071,100034);
INSERT INTO leader VALUES (300072,100023);
INSERT INTO leader VALUES (300073,100036);
INSERT INTO leader VALUES (300074,100012);
INSERT INTO leader VALUES (300075,100004);
INSERT INTO leader VALUES (300076,100018);
INSERT INTO leader VALUES (300077,100025);
INSERT INTO leader VALUES (300078,100013);
INSERT INTO leader VALUES (300079,100002);
INSERT INTO leader VALUES (300080,100019);
INSERT INTO leader VALUES (300081,100002);
INSERT INTO leader VALUES (300082,100003);
INSERT INTO leader VALUES (300083,100011);
INSERT INTO leader VALUES (300084,100026);
INSERT INTO leader VALUES (300085,100039);
INSERT INTO leader VALUES (300086,100027);
INSERT INTO leader VALUES (300087,100035);
INSERT INTO leader VALUES (300088,100037);
INSERT INTO leader VALUES (300089,100032);
INSERT INTO leader VALUES (300090,100022);
INSERT INTO leader VALUES (300091,100035);
INSERT INTO leader VALUES (300092,100003);
INSERT INTO leader VALUES (300093,100035);
INSERT INTO leader VALUES (300094,100025);
INSERT INTO leader VALUES (300095,100029);
INSERT INTO leader VALUES (300096,100031);
INSERT INTO leader VALUES (300097,100037);
INSERT INTO leader VALUES (300098,100004);
INSERT INTO leader VALUES (300099,100004);
INSERT INTO leader VALUES (300100,100001);


-- compo

INSERT INTO compo(id_cd, id_enr, id_musicien) VALUES
(300009,400045,100025),
(300002,400007,100038),
(300047,400239,100005),
(300038,400195,100031),
(300012,400058,100035),
(300058,400294,100008),
(300071,400360,100029),
(300055,400278,100014),
(300092,400464,100030),
(300054,400272,100001),
(300001,400002,100035),
(300013,400065,100021),
(300023,400112,100017),
(300020,400098,100001),
(300015,400075,100007),
(300064,400323,100021),
(300059,400299,100029),
(300100,400502,100025),
(300019,400094,100018),
(300071,400359,100013),
(300007,400032,100040),
(300009,400043,100026),
(300040,400204,100006),
(300036,400181,100005),
(300048,400242,100012),
(300044,400222,100014),
(300059,400300,100025),
(300013,400061,100004),
(300050,400253,100015),
(300052,400262,100011),
(300080,400402,100013),
(300057,400290,100030),
(300085,400427,100016),
(300026,400130,100002),
(300043,400217,100020),
(300018,400090,100027),
(300018,400089,100017),
(300038,400192,100031),
(300089,400449,100016),
(300070,400354,100006),
(300049,400247,100010),
(300091,400457,100010),
(300015,400074,100029),
(300093,400467,100014),
(300095,400478,100029),
(300027,400134,100023),
(300045,400226,100006),
(300037,400186,100018),
(300048,400241,100023),
(300027,400135,100017),
(300022,400110,100035),
(300007,400033,100011),
(300019,400091,100014),
(300022,400106,100011),
(300053,400266,100005),
(300006,400028,100005),
(300080,400403,100036),
(300015,400073,100028),
(300056,400285,100028),
(300087,400437,100038),
(300092,400462,100035),
(300037,400188,100026),
(300097,400487,100017),
(300035,400176,100027),
(300082,400415,100006),
(300072,400363,100019),
(300061,400309,100010),
(300097,400486,100035),
(300092,400465,100013),
(300034,400172,100001),
(300010,400047,100005),
(300090,400453,100025),
(300058,400292,100029),
(300020,400099,100015),
(300087,400438,100032),
(300010,400049,100040),
(300004,400017,100024),
(300006,400030,100011),
(300086,400434,100009),
(300039,400199,100022),
(300012,400060,100035),
(300098,400491,100015),
(300092,400463,100023),
(300049,400249,100030),
(300049,400246,100008),
(300016,400080,100001),
(300073,400367,100014),
(300016,400078,100013),
(300089,400448,100019),
(300079,400398,100009),
(300094,400471,100001),
(300009,400041,100029),
(300042,400213,100014),
(300015,400071,100004),
(300051,400257,100019),
(300080,400404,100023),
(300055,400276,100025),
(300056,400283,100013),
(300084,400424,100003),
(300074,400372,100002),
(300091,400460,100026),
(300095,400479,100039),
(300075,400377,100016),
(300041,400208,100026),
(300074,400373,100022),
(300073,400366,100034),
(300016,400076,100037),
(300013,400064,100005),
(300020,400096,100004)
;

INSERT INTO compo(id_cd, id_enr, id_musicien) VALUES
(300014,400069,100036),
(300014,400069,100039),
(300046,400233,100021),
(300046,400233,100029),
(300031,400157,100040),
(300031,400157,100033),
(300074,400375,100028),
(300074,400375,100036),
(300044,400223,100029),
(300044,400223,100011),
(300031,400160,100031),
(300031,400160,100029),
(300036,400183,100017),
(300036,400183,100016),
(300080,400403,100018),
(300080,400403,100034),
(300028,400140,100032),
(300028,400140,100016),
(300029,400142,100018),
(300029,400142,100029),
(300066,400332,100005),
(300066,400332,100019),
(300036,400181,100016),
(300036,400181,100018),
(300035,400176,100022),
(300035,400176,100021),
(300018,400089,100035),
(300018,400089,100006),
(300020,400097,100009),
(300020,400097,100010),
(300088,400445,100015),
(300088,400445,100025),
(300011,400051,100014),
(300040,400205,100005),
(300060,400303,100027),
(300027,400132,100027),
(300025,400121,100022),
(300072,400364,100035),
(300037,400186,100030),
(300075,400376,100027),
(300008,400038,100004),
(300033,400166,100014),
(300001,400005,100027),
(300019,400094,100025),
(300061,400310,100038),
(300038,400194,100002),
(300075,400380,100037),
(300091,400459,100025),
(300019,400095,100031),
(300094,400474,100001),
(300059,400298,100023),
(300069,400346,100020),
(300082,400413,100025),
(300082,400414,100027),
(300038,400193,100035),
(300067,400340,100035),
(300043,400219,100039),
(300026,400128,100015),
(300003,400012,100032),
(300002,400007,100015),
(300089,400448,100018),
(300050,400252,100028),
(300080,400402,100032),
(300086,400431,100002),
(300070,400351,100025),
(300018,400090,100022),
(300086,400432,100026),
(300006,400027,100011),
(300016,400078,100030),
(300037,400190,100009),
(300053,400268,100040),
(300042,400213,100035),
(300037,400188,100002),
(300020,400096,100026),
(300021,400101,100038),
(300084,400425,100037),
(300079,400400,100002),
(300032,400161,100006),
(300047,400236,100028),
(300073,400368,100009),
(300048,400243,100030),
(300071,400359,100012),
(300018,400086,100004),
(300065,400329,100017),
(300035,400177,100025),
(300079,400399,100021),
(300031,400159,100014),
(300063,400319,100030),
(300008,400039,100021),
(300079,400398,100022),
(300014,400070,100025),
(300022,400107,100018),
(300070,400354,100027),
(300098,400495,100017),
(300086,400434,100006),
(300032,400164,100031),
(300007,400032,100002),
(300049,400250,100035),
(300002,400009,100004);

-- Bloc 3 (lignes 201-300)
INSERT INTO compo(id_cd, id_enr, id_musicien) VALUES
(300054,400273,100023),
(300053,400267,100003),
(300081,400407,100002),
(300059,400297,100016),
(300040,400204,100013),
(300027,400133,100002),
(300065,400330,100040),
(300065,400328,100010),
(300001,400003,100016),
(300004,400019,100009),
(300098,400494,100031),
(300053,400269,100008),
(300016,400077,100037),
(300051,400259,100014),
(300063,400320,100030),
(300071,400357,100017),
(300095,400477,100024),
(300029,400144,100011),
(300090,400455,100039),
(300014,400067,100039),
(300036,400185,100008),
(300027,400134,100011),
(300029,400145,100020),
(300082,400412,100007),
(300057,400286,100038),
(300054,400275,100002),
(300094,400472,100020),
(300042,400214,100037),
(300030,400151,100025),
(300087,400438,100026),
(300069,400347,100005),
(300094,400471,100038),
(300064,400323,100016),
(300004,400018,100007),
(300090,400454,100020),
(300005,400021,100039),
(300027,400131,100008),
(300048,400244,100037),
(300060,400302,100003),
(300058,400292,100023),
(300068,400342,100035),
(300061,400306,100028),
(300030,400155,100024),
(300041,400209,100005),
(300078,400393,100033),
(300080,400404,100022),
(300039,400196,100001),
(300041,400207,100027),
(300084,400424,100032),
(300003,400015,100007),
(300012,400056,100028),
(300016,400076,100024),
(300008,400040,100010),
(300079,400397,100028),
(300093,400466,100012),
(300052,400263,100034),
(300036,400184,100018),
(300043,400218,100040),
(300095,400478,100035),
(300085,400426,100031),
(300014,400068,100030),
(300020,400100,100028),
(300096,400482,100038),
(300020,400098,100018),
(300040,400202,100021),
(300068,400345,100016),
(300058,400294,100006),
(300064,400324,100018),
(300092,400463,100029),
(300025,400125,100016),
(300049,400248,100030),
(300009,400043,100037),
(300013,400061,100040),
(300039,400198,100025),
(300085,400428,100022),
(300054,400272,100002),
(300051,400260,100032),
(300077,400390,100021),
(300100,400503,100012),
(300046,400232,100032),
(300100,400501,100014),
(300023,400114,100023),
(300004,400020,100017),
(300044,400224,100022),
(300024,400119,100018),
(300073,400370,100039),
(300078,400391,100018),
(300088,400443,100036),
(300059,400299,100001),
(300099,400499,100034),
(300076,400384,100013),
(300049,400247,100006),
(300090,400452,100016),
(300088,400441,100027),
(300006,400028,100032),
(300045,400226,100036);

INSERT INTO compo(id_cd, id_enr, id_musicien) VALUES
(300061,400306,100020),
(300061,400307,100012),
(300061,400308,100015),
(300061,400309,100037),
(300061,400310,100040),
(300062,400311,100005),
(300062,400312,100034),
(300062,400313,100013),
(300062,400314,100030),
(300062,400315,100021),
(300063,400316,100002),
(300063,400317,100018),
(300063,400318,100036),
(300063,400319,100027),
(300063,400320,100019),
(300064,400321,100026),
(300064,400322,100014),
(300064,400323,100017),
(300064,400324,100032),
(300064,400325,100031),
(300065,400326,100008),
(300065,400327,100010),
(300065,400328,100025),
(300065,400329,100012),
(300065,400330,100029),
(300066,400331,100009),
(300066,400332,100024),
(300066,400333,100016),
(300066,400334,100001),
(300066,400335,100039),
(300067,400336,100011),
(300067,400337,100038),
(300067,400338,100034),
(300067,400339,100023),
(300067,400340,100033),
(300068,400341,100035),
(300068,400342,100027),
(300068,400343,100016),
(300068,400344,100019),
(300068,400345,100004),
(300069,400346,100036),
(300069,400347,100013),
(300069,400348,100024),
(300069,400349,100010),
(300069,400350,100003),
(300070,400351,100029),
(300070,400352,100001),
(300070,400353,100040),
(300070,400354,100032),
(300070,400355,100009),
(300071,400356,100015),
(300071,400357,100035),
(300071,400358,100033),
(300071,400359,100017),
(300071,400360,100023),
(300072,400361,100002),
(300072,400362,100020),
(300072,400363,100009),
(300072,400364,100025),
(300072,400365,100037),
(300073,400366,100039),
(300073,400367,100005),
(300073,400368,100006),
(300073,400369,100012),
(300073,400370,100023),
(300074,400371,100004),
(300074,400372,100016),
(300074,400373,100020),
(300074,400374,100029),
(300074,400375,100030),
(300075,400376,100018),
(300075,400377,100006),
(300075,400378,100038),
(300075,400379,100027),
(300075,400380,100011),
(300076,400381,100012),
(300076,400382,100037),
(300076,400383,100024),
(300076,400384,100030),
(300076,400385,100004),
(300077,400386,100040),
(300077,400387,100003),
(300077,400388,100001),
(300077,400389,100013),
(300077,400390,100028),
(300078,400391,100020),
(300078,400392,100034),
(300078,400393,100017),
(300078,400394,100002),
(300078,400395,100014),
(300079,400396,100032),
(300079,400397,100008),
(300079,400398,100029),
(300079,400399,100019),
(300079,400400,100009),
(300080,400401,100004),
(300080,400402,100014),
(300080,400403,100035),
(300080,400404,100013),
(300080,400405,100021),
(300081,400406,100015),
(300081,400407,100038),
(300081,400409,100016),
(300081,400410,100008),
(300082,400411,100033),
(300082,400412,100032),
(300082,400413,100009),
(300082,400414,100029),
(300082,400415,100028),
(300083,400416,100026),
(300083,400417,100002),
(300083,400418,100025),
(300083,400419,100006),
(300083,400420,100005),
(300084,400421,100015),
(300084,400422,100034),
(300084,400423,100011),
(300084,400424,100036),
(300084,400425,100040),
(300085,400426,100001),
(300085,400427,100039),
(300085,400428,100010),
(300085,400429,100019),
(300085,400430,100024),
(300086,400431,100007),
(300086,400432,100018),
(300086,400433,100037),
(300086,400434,100020),
(300086,400435,100033),
(300087,400436,100014),
(300087,400437,100021),
(300087,400438,100002),
(300087,400439,100029),
(300087,400440,100024),
(300088,400441,100013),
(300088,400442,100004),
(300088,400443,100006),
(300088,400444,100023),
(300088,400445,100018),
(300089,400446,100036),
(300089,400447,100001),
(300089,400448,100010),
(300089,400449,100019),
(300089,400450,100039),
(300090,400451,100035),
(300090,400452,100005),
(300090,400453,100027),
(300090,400454,100038),
(300090,400455,100022)
;

INSERT INTO compo(id_cd, id_enr, id_musicien) VALUES
(300091,400456,100013),
(300091,400457,100009),
(300091,400458,100016),
(300091,400459,100026),
(300091,400460,100004),
(300092,400461,100011),
(300092,400462,100019),
(300092,400463,100038),
(300092,400465,100037),
(300093,400466,100021),
(300093,400467,100002),
(300093,400468,100035),
(300093,400469,100008),
(300093,400470,100031),
(300094,400471,100013),
(300094,400472,100005),
(300094,400473,100019),
(300094,400474,100036),
(300094,400475,100010),
(300095,400476,100033),
(300095,400477,100015),
(300095,400478,100017),
(300095,400479,100026),
(300095,400480,100027),
(300096,400481,100032),
(300096,400482,100039),
(300096,400483,100012),
(300096,400484,100006),
(300096,400485,100022),
(300097,400486,100018),
(300097,400487,100031),
(300097,400488,100009),
(300097,400489,100014),
(300097,400490,100027),
(300098,400491,100016),
(300098,400492,100008),
(300098,400493,100020),
(300098,400494,100004),
(300098,400495,100023),
(300099,400496,100040),
(300099,400497,100011),
(300099,400498,100037),
(300099,400499,100029),
(300099,400500,100003),
(300100,400501,100021),
(300100,400502,100032),
(300100,400503,100018),
(300100,400504,100035),
(300100,400505,100006)
;
