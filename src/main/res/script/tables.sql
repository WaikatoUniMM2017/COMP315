CREATE TABLE TEAM
(
  TNAME varchar(50) NOT NULL,
  ID integer AUTO_INCREMENT PRIMARY KEY NOT NULL
);
CREATE TABLE PLAYER
(
  EMAIL varchar(255) PRIMARY KEY NOT NULL,
  FNAME varchar(50) NOT NULL,
  LNAME varchar(50) NOT NULL
);
CREATE TABLE TOURNAMENT
(
  ID integer AUTO_INCREMENT PRIMARY KEY NOT NULL,
  VENUE varchar(50) NOT NULL,
  COMMENTS varchar(2147483647),
  NAME varchar(50),
  TSTART timestamp,
  TEND timestamp
);
CREATE TABLE TYPE
(
  ID integer AUTO_INCREMENT PRIMARY KEY NOT NULL,
  NAME varchar(50)
);
CREATE TABLE PLAYERBELONGSTO
(
  PLAYEREMAIL varchar(255) NOT NULL,
  TEAMID integer NOT NULL,
  CONSTRAINT PLAYERBELONGSTO_TEAMID_PLAYEREMAIL_PK PRIMARY KEY (TEAMID, PLAYEREMAIL),
  CONSTRAINT PLAYERBELONGSTO_PLAYER_EMAIL_FK FOREIGN KEY (PLAYEREMAIL) REFERENCES PLAYER (EMAIL),
  CONSTRAINT PLAYERBELONGSTO_TEAM_ID_FK FOREIGN KEY (TEAMID) REFERENCES TEAM (ID)
);


CREATE TABLE PLAYERIS
(
  PLAYEREMAIL varchar(255),
  TYPEID integer PRIMARY KEY NOT NULL,
  CONSTRAINT PLAYERIS_PLAYER_EMAIL_FK FOREIGN KEY (PLAYEREMAIL) REFERENCES PLAYER (EMAIL),
  CONSTRAINT PLAYERIS_TYPE_ID_FK FOREIGN KEY (TYPEID) REFERENCES TYPE (ID)
);

CREATE TABLE BRACKET
(
  ID integer AUTO_INCREMENT PRIMARY KEY NOT NULL,
  ROUND integer,
  WINNERID integer,
  CONSTRAINT BRACKET_WINNER__FK FOREIGN KEY (ID) REFERENCES TEAM (ID)
);
CREATE TABLE INBRACKET
(
  BRACKETID INTEGER,
  TEAMID INTEGER NOT NULL,
  CONSTRAINT CONSTRAINT_21 PRIMARY KEY (TEAMID, BRACKETID),
  CONSTRAINT INBRACKET_BRACKET_ID_FK FOREIGN KEY (BRACKETID) REFERENCES BRACKET (ID),
  CONSTRAINT INBRACKET_TEAM_ID_FK FOREIGN KEY (TEAMID) REFERENCES TEAM (ID)
);

CREATE TABLE TOURNAMENTHAS
(
  TOURNAMENTID integer NOT NULL,
  BRACKETID integer NOT NULL,
  CONSTRAINT TOURNAMENTHAS_TOURNAMENTID_BRACKETID_PK PRIMARY KEY (TOURNAMENTID, BRACKETID)
);

CREATE TABLE TEAMIN
(
  TEAMID integer NOT NULL,
  BRACKETID integer NOT NULL,
  CONSTRAINT TEAMIN_BRACKETID_TEAMID_PK PRIMARY KEY (BRACKETID, TEAMID),
  CONSTRAINT TEAMIN_TEAM_ID_FK FOREIGN KEY (TEAMID) REFERENCES TEAM (ID),
  CONSTRAINT TEAMIN_BRACKET_ID_FK FOREIGN KEY (BRACKETID) REFERENCES BRACKET (ID)
);

CREATE UNIQUE INDEX TYPE_NAME_UINDEX ON TYPE (NAME);

/*typeid,typename*/
INSERT INTO Type(NAME) VALUES ('gold');
INSERT INTO Type(NAME) VALUES ('silver');
INSERT INTO Type(NAME) VALUES ('bronze');
INSERT INTO Type(NAME) VALUES ('free');
INSERT INTO Type(NAME) VALUES ('nonmember');
INSERT INTO Type(NAME) VALUES ('staff');

/*tournamenttid,tournamentname,starttime,endtime,venue,comment*/
INSERT INTO Tournament(NAME,TSTART,TEND,VENUE,COMMENTS) VALUES ('overwatchsummer','2017-05-12 09:00:00','2017-05-14 21:00:00','144, Keith Street, Hamilton','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce accumsan neque ut metus interdum efficitur. ');
INSERT INTO Tournament(NAME,TSTART,TEND,VENUE,COMMENTS) VALUES ('heroofstormwinter','2017-08-22 10:00:00','2017-08-25 20:00:00','82, Otacu Street, Hamilton','Praesent efficitur velit a sem luctus volutpat. Ut vel tortor quis sem blandit faucibus. Nullam quis dapibus purus.');

/*tname*/
INSERT INTO Team(tname) VALUES ('Quo Lux');
INSERT INTO Team(tname) VALUES ('Trippledex');
INSERT INTO Team(tname) VALUES ('Rank');
INSERT INTO Team(tname) VALUES ('Viva');
INSERT INTO Team(tname) VALUES ('Konklux');
INSERT INTO Team(tname) VALUES ('Prodder');
INSERT INTO Team(tname) VALUES ('Opela');
INSERT INTO Team(tname) VALUES ('Lotlux');

INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('parturient.montes.nascetur@quamafelis.edu','Stella','Shields');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('Nullam.vitae.diam@magnaa.com','Erich','Wise');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('adipiscing.ligula.Aenean@Suspendisse.net','Yuli','Leblanc');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('malesuada.id@magnatellusfaucibus.co.uk','Kendall','Campbell');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('Etiam.laoreet.libero@Pellentesqueultriciesdignissim.org','Trevor','Bolton');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('dictum.Phasellus@euligula.org','Colt','Kirkland');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('in.dolor.Fusce@purus.edu','Kasper','Estrada');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('nec@velsapienimperdiet.org','Jeremy','Wagner');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('Pellentesque.habitant@vitaediam.edu','Wang','Pace');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('ipsum.sodales.purus@Vestibulumante.net','Germane','Walton');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('ipsum.Suspendisse.non@sedtortorInteger.com','Timon','Garza');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('sed.libero.Proin@ipsumsodales.com','Lucius','Deleon');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('mi@Integeridmagna.ca','Rashad','Mcgee');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('magna.Duis.dignissim@tempusscelerisquelorem.ca','Christopher','Powers');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('ac.eleifend@odioNaminterdum.ca','Halee','Vaughan');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('interdum.Sed@velitCraslorem.org','Asher','White');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('et.malesuada.fames@sitamet.com','Gisela','Cannon');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('mollis@ornareInfaucibus.org','Taylor','Roach');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('ac.risus.Morbi@ultricesposuere.com','Nerea','Hughes');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('libero.est@Innec.net','Dillon','Buck');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('amet.luctus.vulputate@Nuncsed.org','Faith','Pittman');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('turpis.nec.mauris@ligulaconsectetuer.edu','Shannon','Wells');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('nec.ante.blandit@elementumlorem.edu','Richard','Meyer');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('interdum@incursus.org','Dante','Allen');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('eros.Nam@auguemalesuadamalesuada.co.uk','Uma','Stephenson');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('nec.cursus.a@semper.net','Latifah','Kim');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('mi@sagittisNullam.ca','Phillip','Perry');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('Nullam.enim.Sed@tempuseu.net','Russell','Lynn');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('urna.et@ornareIn.net','Danielle','Ayers');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('tincidunt.congue@Curabitur.net','Nicole','Mccarty');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('metus.sit@semper.edu','Hedley','Merritt');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('libero.Donec.consectetuer@augue.net','Orson','Chase');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('Proin.eget.odio@dictumcursusNunc.org','Scott','Whitfield');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('nascetur.ridiculus@penatibuset.edu','Quintessa','Kirkland');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('Vivamus.molestie.dapibus@elit.net','Josiah','Hicks');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('a.scelerisque@quis.co.uk','Brendan','Charles');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('faucibus@inconsequat.ca','Emery','Fitzgerald');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('a.sollicitudin@arcu.co.uk','Harlan','Oneill');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('risus.at@augue.ca','Diana','Ellis');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('nulla.ante@placeratorci.co.uk','Audra','Schultz');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('commodo.at.libero@diameudolor.ca','Haviva','Solis');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('auctor.nunc.nulla@suscipitest.org','Chelsea','Burgess');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('Aenean@SuspendisseeleifendCras.com','Courtney','Cardenas');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('id.ante.dictum@velarcueu.com','Cally','Arnold');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('molestie@eleifendegestas.ca','Oliver','Glass');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('condimentum.eget@dapibusidblandit.ca','Medge','Ballard');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('mi@asollicitudinorci.net','Eaton','Russo');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('massa.Integer@imperdietornareIn.ca','Fay','Freeman');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('Cras.pellentesque.Sed@sodaleselit.ca','Charles','Le');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('ultrices.posuere.cubilia@mollis.ca','Hasad','Cline');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('mus.Donec.dignissim@Aenean.ca','Fulton','Bentley');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('Nunc@Proin.ca','Walter','Pittman');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('enim.Mauris@at.net','Ali','Brady');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('Morbi.sit.amet@sitamet.net','Anika','Roth');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('et.malesuada.fames@nonummyutmolestie.net','Kieran','English');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('mi.felis@eudui.org','Castor','Middleton');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('nunc.sed.libero@interdum.com','Heather','Raymond');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('ac.ipsum@Proin.edu','Nadine','Bolton');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('elit.pharetra.ut@nequeNullam.com','Hedley','Lambert');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('Integer.aliquam@pellentesquetellussem.co.uk','Jacob','Albert');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('non@parturientmontesnascetur.net','Paloma','Bullock');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('et.euismod.et@euduiCum.co.uk','Desirae','Hale');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('amet.ornare.lectus@imperdiet.edu','Chandler','Walter');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('non@iaculisneceleifend.com','Jonas','Watson');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('Phasellus.in.felis@tristiqueac.net','Octavius','Webb');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('Curabitur.vel.lectus@Duismienim.com','Miranda','Cameron');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('et.tristique.pellentesque@seddictum.ca','Zena','Richmond');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('nonummy@acipsumPhasellus.co.uk','Avye','Henderson');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('Ut@faucibusidlibero.edu','Haley','Weeks');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('sed.sem.egestas@euultricessit.com','Hanae','Fleming');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('auctor.quis.tristique@est.edu','Erich','Petersen');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('eu.odio.tristique@est.edu','Griffith','Mayo');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('ut.pellentesque@montesnascetur.co.uk','Jerry','Barnes');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('natoque.penatibus.et@ante.org','Kieran','Ferrell');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('nulla.at.sem@ultricesmaurisipsum.edu','Paki','Mays');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('mus@sedestNunc.co.uk','Akeem','Horton');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('porttitor.tellus.non@velvenenatisvel.org','Dane','Walters');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('sit.amet@nonummyipsum.org','Gillian','Herman');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('libero.Morbi.accumsan@nibhDonec.ca','Libby','Huffman');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('condimentum.eget.volutpat@Innecorci.org','Chandler','Ballard');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('posuere.vulputate.lacus@pharetra.org','Risa','Barrett');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('pharetra.Quisque.ac@ornaretortor.com','Garrison','Schultz');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('interdum.Nunc.sollicitudin@sedestNunc.edu','Marshall','Haynes');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('dolor@montes.ca','Macaulay','Alvarez');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('nunc.sed.pede@nascetur.net','Louis','Vaughn');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('et.nunc.Quisque@lectussit.com','Angelica','Wiley');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('Proin@enim.edu','Aileen','Franklin');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('libero@dictum.com','Michael','Burris');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('euismod.enim.Etiam@aliquetPhasellusfermentum.edu','Zachary','Hatfield');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('nec.tempus@ligulaAeneaneuismod.org','Aquila','Booth');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('eget@commodo.org','Branden','Moss');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('ornare.placerat.orci@perinceptoshymenaeos.net','Quemby','Jensen');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('sit@pede.org','Inga','Cannon');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('nisi@Phasellusfermentumconvallis.org','Vanna','Morse');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('rutrum.magna@pellentesqueafacilisis.co.uk','Hope','Maddox');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('a@atsem.ca','Imani','Ashley');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('luctus.et@Quisquefringilla.co.uk','Reagan','Atkins');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('Donec.tempus.lorem@orcilobortisaugue.edu','Vincent','Hobbs');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('ipsum.Phasellus@Curae.co.uk','Lysandra','Osborn');
INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('eros.nec.tellus@Nullam.com','Stone','Burnett');
