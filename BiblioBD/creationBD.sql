--Cr�ation des tables

CREATE TABLE public.langue (
                nom VARCHAR(50) NOT NULL,
                CONSTRAINT langue_pk PRIMARY KEY (nom)
);


CREATE SEQUENCE public.editeur_id_seq;

CREATE TABLE public.editeur (
                id INTEGER NOT NULL DEFAULT nextval('public.editeur_id_seq'),
                nom VARCHAR(100) NOT NULL,
                CONSTRAINT editeur_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.editeur_id_seq OWNED BY public.editeur.id;

CREATE SEQUENCE public.auteur_id_seq;

CREATE TABLE public.auteur (
                id INTEGER NOT NULL DEFAULT nextval('public.auteur_id_seq'),
                nom VARCHAR(100) NOT NULL,
                prenom VARCHAR(100),
                CONSTRAINT auteur_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.auteur_id_seq OWNED BY public.auteur.id;

CREATE SEQUENCE public.utilisateur_id_seq;

CREATE TABLE public.utilisateur (
                id INTEGER NOT NULL DEFAULT nextval('public.utilisateur_id_seq'),
                email VARCHAR(100) NOT NULL,
                nom VARCHAR(100) NOT NULL,
                prenom VARCHAR(100),
                mdp VARCHAR(100) NOT NULL,
                sel VARCHAR(20) NOT NULL,
                CONSTRAINT utilisateur_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.utilisateur_id_seq OWNED BY public.utilisateur.id;

CREATE UNIQUE INDEX utilisateur_idx
 ON public.utilisateur
 ( email );

CREATE TABLE public.bibliotheque (
                nom VARCHAR(50) NOT NULL,
                CONSTRAINT bibliotheque_pk PRIMARY KEY (nom)
);


CREATE TABLE public.genre (
                nom VARCHAR(20) NOT NULL,
                CONSTRAINT genre_pk PRIMARY KEY (nom)
);


CREATE SEQUENCE public.description_id_seq;

CREATE TABLE public.description (
                id INTEGER NOT NULL DEFAULT nextval('public.description_id_seq'),
                titre VARCHAR(100),
                CONSTRAINT description_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.description_id_seq OWNED BY public.description.id;

CREATE TABLE public.paragraphe (
                decription_id INTEGER NOT NULL,
                ordre INTEGER NOT NULL,
                texte VARCHAR NOT NULL,
                CONSTRAINT paragraphe_pk PRIMARY KEY (decription_id, ordre)
);


CREATE TABLE public.livre (
                isbn VARCHAR(20) NOT NULL,
                titre VARCHAR(100) NOT NULL,
                editeur_id INTEGER NOT NULL,
                date_publication DATE NOT NULL,
                description_id INTEGER NOT NULL,
                langue VARCHAR(50) NOT NULL,
                CONSTRAINT livre_pk PRIMARY KEY (isbn)
);


CREATE TABLE public.livre_genre (
                isbn VARCHAR(20) NOT NULL,
                nom VARCHAR(20) NOT NULL,
                CONSTRAINT livre_genre_pk PRIMARY KEY (isbn, nom)
);


CREATE TABLE public.livre_auteur (
                isbn VARCHAR(20) NOT NULL,
                auteur_id INTEGER NOT NULL,
                CONSTRAINT livre_auteur_pk PRIMARY KEY (isbn, auteur_id)
);


CREATE SEQUENCE public.exemplaire_id_seq;

CREATE TABLE public.exemplaire (
                id INTEGER NOT NULL DEFAULT nextval('public.exemplaire_id_seq'),
                isbn VARCHAR(20) NOT NULL,
                bibliotheque VARCHAR(50) NOT NULL,
                CONSTRAINT exemplaire_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.exemplaire_id_seq OWNED BY public.exemplaire.id;

CREATE TABLE public.pret (
                id INTEGER NOT NULL,
                date_debut DATE NOT NULL,
                date_fin VARCHAR,
                renouvele BOOLEAN NOT NULL,
                utilisateur_id INTEGER NOT NULL,
                exemplaire_id INTEGER NOT NULL,
                CONSTRAINT pret_pk PRIMARY KEY (id)
);


ALTER TABLE public.livre ADD CONSTRAINT langue_livre_fk
FOREIGN KEY (langue)
REFERENCES public.langue (nom)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.livre ADD CONSTRAINT editeur_livre_fk
FOREIGN KEY (editeur_id)
REFERENCES public.editeur (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.livre_auteur ADD CONSTRAINT auteur_auteur_livre_fk
FOREIGN KEY (auteur_id)
REFERENCES public.auteur (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pret ADD CONSTRAINT utilisateur_pret_fk
FOREIGN KEY (utilisateur_id)
REFERENCES public.utilisateur (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.exemplaire ADD CONSTRAINT bibliotheque_exemplaire_fk
FOREIGN KEY (bibliotheque)
REFERENCES public.bibliotheque (nom)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.livre_genre ADD CONSTRAINT genre_livre_genre_fk
FOREIGN KEY (nom)
REFERENCES public.genre (nom)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.livre ADD CONSTRAINT description_livre_fk
FOREIGN KEY (description_id)
REFERENCES public.description (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.paragraphe ADD CONSTRAINT description_paragraphe_fk
FOREIGN KEY (decription_id)
REFERENCES public.description (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.exemplaire ADD CONSTRAINT livre_exemplaire_fk
FOREIGN KEY (isbn)
REFERENCES public.livre (isbn)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.livre_auteur ADD CONSTRAINT livre_auteur_livre_fk
FOREIGN KEY (isbn)
REFERENCES public.livre (isbn)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.livre_genre ADD CONSTRAINT livre_livre_genre_fk
FOREIGN KEY (isbn)
REFERENCES public.livre (isbn)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pret ADD CONSTRAINT exemplaire_pret_fk
FOREIGN KEY (exemplaire_id)
REFERENCES public.exemplaire (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- Cr�ation donn�es de demonstration

--Genres
INSERT INTO public.genre (nom) VALUES ('Autobiographies');
INSERT INTO public.genre (nom) VALUES ('Aventure');
INSERT INTO public.genre (nom) VALUES ('B.D.');
INSERT INTO public.genre (nom) VALUES ('Biographies');
INSERT INTO public.genre (nom) VALUES ('Classiques');
INSERT INTO public.genre (nom) VALUES ('Essais');
INSERT INTO public.genre (nom) VALUES ('Fantasy');
INSERT INTO public.genre (nom) VALUES ('Histoire');
INSERT INTO public.genre (nom) VALUES ('Jeunesse');
INSERT INTO public.genre (nom) VALUES ('Nouvelles');
INSERT INTO public.genre (nom) VALUES ('Po�sie');
INSERT INTO public.genre (nom) VALUES ('Polar historique');
INSERT INTO public.genre (nom) VALUES ('Policier');
INSERT INTO public.genre (nom) VALUES ('Romans');
INSERT INTO public.genre (nom) VALUES ('S.F.');
INSERT INTO public.genre (nom) VALUES ('Th��tre');
INSERT INTO public.genre (nom) VALUES ('Thriller');
INSERT INTO public.genre (nom) VALUES ('Voyages');

-- Langues
INSERT INTO public.langue (nom) VALUES ('Fran�ais');
INSERT INTO public.langue (nom) VALUES ('Anglais');
INSERT INTO public.langue (nom) VALUES ('Allemand');

-- Auteurs
INSERT INTO public.auteur (id,nom,prenom) VALUES (1,'Rowling' ,'J. K.');

-- Editeurs
INSERT INTO public.editeur (id,nom) VALUES (1,'Gallimard Jeunesse');

-- Livres
--Harry Potter I
INSERT INTO public.description (id) VALUES (1);
INSERT INTO public.paragraphe (decription_id,ordre,texte) VALUES (1,1,'Le jour de ses 11 ans, Harry Potter, un orphelin �lev� par un oncle et une tante qui le d�testent, voit son existence boulevers�e. Un g�ant vient le chercher pour l''amener � Poudlard, une �cole de sorcellerie ! Voler en balai, jeter des sorts, combattre les trolls : Harry Potter se r�v�le un sorcier dou�. Mais un myst�re entoure sa naissance et l''effroyable V..., le mage dont personne n''ose prononcer le nom.');
INSERT INTO public.livre (isbn,titre,editeur_id,date_publication,description_id,langue) VALUES ('978-2070649693', 'Harry Potter, I : Harry Potter � l''�cole des sorciers' , 1 ,{d '2012-10-25'} , 1, 'Fran�ais');
INSERT INTO public.livre_genre (isbn,nom) VALUES ('978-2070649693','Fantasy');
INSERT INTO public.livre_genre (isbn,nom) VALUES ('978-2070649693','Jeunesse');
INSERT INTO public.livre_auteur (isbn,auteur_id) VALUES ('978-2070649693' ,1);

--Harry Potter II
INSERT INTO public.description (id) VALUES (2);
INSERT INTO public.paragraphe (decription_id,ordre,texte) VALUES (2,1,'Harry Potter fait une deuxi�me rentr�e fracassante en voiture volante � l''�cole des sorciers. Cette deuxi�me ann�e ne s''annonce pas de tout repos... surtout depuis qu''une �trange mal�diction s''est abattue sur les �l�ves. Entre les cours de potion magique, les matchs de Quidditch et les combats de mauvais sorts, Harry trouvera-t-il le temps de percer le myst�re de la Chambre des Secrets ? Un livre magique pour sorciers et sorci�res confirm�s !');
INSERT INTO public.livre (isbn,titre,editeur_id,date_publication,description_id,langue) VALUES ('978-2070624539', 'Harry Potter, II : Harry Potter et la Chambre des Secrets' , 1 ,{d '2016-10-3'} , 2, 'Fran�ais');
INSERT INTO public.livre_genre (isbn,nom) VALUES ('978-2070624539','Fantasy');
INSERT INTO public.livre_genre (isbn,nom) VALUES ('978-2070624539','Jeunesse');
INSERT INTO public.livre_auteur (isbn,auteur_id) VALUES ('978-2070624539' ,1);

--Harry Potter III
INSERT INTO public.description (id) VALUES (3);
INSERT INTO public.paragraphe (decription_id,ordre,texte) VALUES (3,1,'Harry Potter a treize ans. Apr�s des vacances insupportables chez les horribles Dursley, il retrouve ses fid�les amis, Ron et Hermione, pour prendre le train qui les ram�ne au coll�ge Poudlard. Le monde des gens ordinaires, les Moldus, comme celui des sorciers, est en �moi : aux derni�res nouvelles, Sirius Black, un dangereux criminel proche de Voldemort, s''est �chapp� de la prison d''Azkaban. Les redoutables gardiens de la prison assureront la s�curit� du coll�ge Poudlard, car le prisonnier �vad� recherche Harry Potter, responsable de l''�limination de son ma�tre. C''est donc sous bonne garde que l''apprenti sorcier fait sa troisi�me rentr�e. Au programme : des cours de divination, la fabrication d''une potion de ratatinage, le dressage des hippogriffes... Mais Harry est-il vraiment � l''abri du danger qui le menace ?');
INSERT INTO public.livre (isbn,titre,editeur_id,date_publication,description_id,langue) VALUES ('978-2070624546', 'Harry Potter, III : Harry Potter et le prisonnier d''Azkaban' , 1 ,{d '2016-10-3'} , 3, 'Fran�ais');
INSERT INTO public.livre_genre (isbn,nom) VALUES ('978-2070624546','Fantasy');
INSERT INTO public.livre_genre (isbn,nom) VALUES ('978-2070624546','Jeunesse');
INSERT INTO public.livre_auteur (isbn,auteur_id) VALUES ('978-2070624546' ,1);

--Harry Potter IV
INSERT INTO public.description (id) VALUES (4);
INSERT INTO public.paragraphe (decription_id,ordre,texte) VALUES (4,1,'Apr�s un horrible �t� chez les Dursley, Harry Potter entre en quatri�me ann�e au coll�ge de Poudlard. A quatorze ans, il voudrait simplement �tre un jeune sorcier comme les autres, retrouver ses amis Ron et Hermione, assister avec eux � la Coupe du Monde de Quidditch, apprendre de nouveaux sortil�ges et essayer des potions inconnues. Une grande nouvelle l''attend � son arriv�e : la tenue � Poudlard d''un tournoi de magie entre les plus c�l�bres �coles de sorcellerie. D�j� les spectaculaires d�l�gations �trang�res font leur entr�e... Harry se r�jouit. Trop vite. Il va se trouver plong� au coeur des �v�nements les plus dramatiques qu''il ait jamais eu � affronter. Envo�tant, dr�le, bouleversant, ce quatri�me tome est le pilier central des aventures de Harry Potter.');
INSERT INTO public.livre (isbn,titre,editeur_id,date_publication,description_id,langue) VALUES ('978-2070624553', 'Harry Potter, IV : Harry Potter et la Coupe de Feu' , 1 ,{d '2016-10-3'} , 4, 'Fran�ais');
INSERT INTO public.livre_genre (isbn,nom) VALUES ('978-2070624553','Fantasy');
INSERT INTO public.livre_genre (isbn,nom) VALUES ('978-2070624553','Jeunesse');
INSERT INTO public.livre_auteur (isbn,auteur_id) VALUES ('978-2070624553' ,1);

--Harry Potter V
INSERT INTO public.description (id) VALUES (5);
INSERT INTO public.paragraphe (decription_id,ordre,texte) VALUES (5,1,'� quinze ans, Harry s''appr�te � entrer en cinqui�me ann�e � Poudlard. Et s''il est heureux de retrouver le monde des sorciers, il n''a jamais �t� aussi anxieux. L''adolescence, la perspective des examens importants en fin d''ann�e et ces �tranges cauchemars... Car Celui-Dont-On-Ne-Doit-Pas-Prononcer-Le-Nom est de retour et, plus que jamais, Harry sent peser sur lui une terrible menace. Une menace que le minist�re de la Magie ne semble pas prendre au s�rieux, contrairement � Dumbledore. Poudlard devient alors le terrain d''une v�ritable lutte de pouvoir. La r�sistance s''organise autour de Harry qui va devoir compter sur le courage et la fid�lit� de ses amis de toujours...');
INSERT INTO public.livre (isbn,titre,editeur_id,date_publication,description_id,langue) VALUES ('978-2070624560', 'Harry Potter, V : Harry Potter et l''Ordre du Ph�nix' , 1 ,{d '2016-10-3'} , 5, 'Fran�ais');
INSERT INTO public.livre_genre (isbn,nom) VALUES ('978-2070624560','Fantasy');
INSERT INTO public.livre_genre (isbn,nom) VALUES ('978-2070624560','Jeunesse');
INSERT INTO public.livre_auteur (isbn,auteur_id) VALUES ('978-2070624560' ,1);

--Harry Potter VI
INSERT INTO public.description (id) VALUES (6);
INSERT INTO public.paragraphe (decription_id,ordre,texte) VALUES (6,1,'Dans un monde de plus en plus inqui�tant, Harry se pr�pare � retrouver Ron et Hermione. Bient�t, ce sera la rentr�e � Poudlard, avec les autres �tudiants de sixi�me ann�e. Mais pourquoi le professeur Dumbledore vient-il en personne chercher Harry chez les Dursley ? Harry, Ron et Hermione entrent en sixi�me ann�e � Poudlard o� ils vont vivre leur derni�re ann�e avant la majorit� qui est fix�e, chez les sorciers, � l''�ge de dix-sept ans. Des �v�nements particuli�rement marquants vont contribuer � faire passer Harry du statut d''adolescent � celui d''homme. Ce tome, sur fond de guerre contre un Voldemort plus puissant que jamais, se r�v�le plus sombre que les pr�c�dents. Secrets, alliances et trahisons conduisent aux �v�nements les plus dramatiques qu''Harry ait eu � affronter. Mais, en d�pit de ces �pisodes tragiques, il �mane du texte un sentiment g�n�ral d''all�gresse et de joie de vivre d� � l''humour, aux preuves d''amiti�, aux sc�nes romantiques, � de nouvelles trouvailles po�tiques de J. K. Rowling, mais surtout � la s�r�nit� retrouv�e de Harry qui reprend confiance en lui. Ce dernier se plonge �galement dans les souvenirs d''enfance de Voldemort. Il va ainsi mieux comprendre la personnalit� de son adversaire car m�me cet �tre monstrueux poss�de une part d''humanit�. Le sens des responsabilit�s et du sacrifice rev�tent, ici encore, une dimension particuli�rement importante.');
INSERT INTO public.livre (isbn,titre,editeur_id,date_publication,description_id,langue) VALUES ('978-2070624904', 'Harry Potter, VI : Harry Potter et le Prince de Sang-M�l�' , 1 ,{d '2016-10-3'} , 6, 'Fran�ais');
INSERT INTO public.livre_genre (isbn,nom) VALUES ('978-2070624904','Fantasy');
INSERT INTO public.livre_genre (isbn,nom) VALUES ('978-2070624904','Jeunesse');
INSERT INTO public.livre_auteur (isbn,auteur_id) VALUES ('978-2070624904' ,1);

--Harry Potter VII
INSERT INTO public.description (id) VALUES (7);
INSERT INTO public.paragraphe (decription_id,ordre,texte) VALUES (7,1,'Cet �t�-l�, Harry atteint ses dix-sept ans, l''�ge de la majorit� pour un sorcier, et s''appr�te � faire face � son destin. Soutenu par Ron et Hermione, Harry se consacre pleinement � la mission confi�e par Dumbledore avant de mourir, la chasse aux Horcruxes. Mais le Seigneur des T�n�bres r�gne d�sormais en ma�tre absolu. Traqu�s, en exil, les trois fid�les amis vont conna�tre une solitude sans pr�c�dent, o� leur courage, leurs choix et leurs sacrifices seront d�terminants dans la lutte contre les forces du mal. Leur qu�te croisera celle des Reliques de la Mort, et fera surgir du pass� des r�v�lations capitales et parfois douloureuses. Ces �preuves conduiront Harry, sans d�tour, vers sa destin�e, l''affrontement final avec Lord Voldemort.');
INSERT INTO public.livre (isbn,titre,editeur_id,date_publication,description_id,langue) VALUES ('978-2070624911', 'Harry Potter, VII : Harry Potter et les Reliques de la Mort' , 1 ,{d '2016-10-3'} , 7, 'Fran�ais');
INSERT INTO public.livre_genre (isbn,nom) VALUES ('978-2070624911','Fantasy');
INSERT INTO public.livre_genre (isbn,nom) VALUES ('978-2070624911','Jeunesse');
INSERT INTO public.livre_auteur (isbn,auteur_id) VALUES ('978-2070624911' ,1);

--Biblioth�ques de la ville
INSERT INTO public.bibliotheque (nom) VALUES ('Biblioth�que centrale');
INSERT INTO public.bibliotheque (nom) VALUES ('Biblioth�que des oies');
INSERT INTO public.bibliotheque (nom) VALUES ('Biblioth�que des canards');

-- Exemplaires
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070649693','Biblioth�que centrale');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070649693','Biblioth�que centrale');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070649693','Biblioth�que centrale');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070649693','Biblioth�que centrale');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070649693','Biblioth�que centrale');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070649693','Biblioth�que des oies');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070649693','Biblioth�que des oies');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070649693','Biblioth�que des oies');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070649693','Biblioth�que des canards');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070649693','Biblioth�que des canards');

INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624539','Biblioth�que centrale');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624539','Biblioth�que centrale');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624539','Biblioth�que centrale');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624539','Biblioth�que centrale');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624539','Biblioth�que des oies');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624539','Biblioth�que des oies');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624539','Biblioth�que des oies');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624539','Biblioth�que des canards');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624539','Biblioth�que des canards');

INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624546','Biblioth�que centrale');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624546','Biblioth�que centrale');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624546','Biblioth�que centrale');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624546','Biblioth�que centrale');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624546','Biblioth�que centrale');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624546','Biblioth�que des oies');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624546','Biblioth�que des oies');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624546','Biblioth�que des oies');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624546','Biblioth�que des canards');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624546','Biblioth�que des canards');

INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624553','Biblioth�que centrale');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624553','Biblioth�que centrale');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624553','Biblioth�que centrale');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624553','Biblioth�que centrale');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624553','Biblioth�que centrale');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624553','Biblioth�que des oies');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624553','Biblioth�que des oies');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624553','Biblioth�que des canards');

INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624560','Biblioth�que centrale');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624560','Biblioth�que centrale');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624560','Biblioth�que centrale');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624560','Biblioth�que centrale');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624560','Biblioth�que centrale');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624560','Biblioth�que centrale');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624560','Biblioth�que des oies');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624560','Biblioth�que des oies');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624560','Biblioth�que des oies');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624560','Biblioth�que des canards');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624560','Biblioth�que des canards');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624560','Biblioth�que des canards');

INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624904','Biblioth�que centrale');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624904','Biblioth�que centrale');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624904','Biblioth�que centrale');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624904','Biblioth�que centrale');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624904','Biblioth�que centrale');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624904','Biblioth�que centrale');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624904','Biblioth�que centrale');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624904','Biblioth�que centrale');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624904','Biblioth�que des oies');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624904','Biblioth�que des oies');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624904','Biblioth�que des oies');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624904','Biblioth�que des oies');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624904','Biblioth�que des oies');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624904','Biblioth�que des canards');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624904','Biblioth�que des canards');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624904','Biblioth�que des canards');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624904','Biblioth�que des canards');

INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624911','Biblioth�que centrale');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624911','Biblioth�que centrale');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624911','Biblioth�que centrale');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624911','Biblioth�que centrale');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624911','Biblioth�que centrale');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624911','Biblioth�que centrale');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624911','Biblioth�que centrale');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624911','Biblioth�que centrale');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624911','Biblioth�que des oies');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624911','Biblioth�que des oies');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624911','Biblioth�que des oies');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624911','Biblioth�que des oies');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624911','Biblioth�que des oies');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624911','Biblioth�que des canards');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624911','Biblioth�que des canards');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624911','Biblioth�que des canards');
INSERT INTO public.exemplaire (isbn,bibliotheque) VALUES ('978-2070624911','Biblioth�que des canards');


-- Utilisateur
INSERT INTO public.utilisateur (id,email,nom,prenom,mdp,sel) VALUES (1,'jeremylootens@gmail.com' ,'Lootens' ,'J�r�my' ,'9Gb+Cm0HWmVuF7zuSK4L4Pg+GOvPFNsbAWoU/cM2Ywg=' ,'t0P7IvDKzv36W2npOfR4' );

-- Pret
INSERT INTO public.pret (id,date_debut,renouvele,utilisateur_id,exemplaire_id) VALUES (1,{d '2018-06-06'} ,false , 1, 5);
