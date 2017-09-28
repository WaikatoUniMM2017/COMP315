CREATE TABLE player
(
    email VARCHAR(50) PRIMARY KEY,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL
);
CREATE TABLE type
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);
CREATE UNIQUE INDEX type_name_uindex ON type (name);
CREATE TABLE team
(
    TNAME VARCHAR(50) NOT NULL,
    id INT PRIMARY KEY NOT NULL
);

CREATE TABLE tournament
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    venue VARCHAR(50) NOT NULL,
    comments LONGVARCHAR,
    name VARCHAR(50),
    tstart DATETIME,
    tend DATETIME
);
CREATE TABLE belongsto
(
    teamid INT,
    playeremail INT PRIMARY KEY,
    CONSTRAINT belongsto_TEAM_id_fk FOREIGN KEY (teamid) REFERENCES PUBLIC.TEAM (id),
    CONSTRAINT belongsto_player_email_fk FOREIGN KEY (playeremail) REFERENCES player (email)
);
CREATE TABLE bracket
(
  id INT AUTO_INCREMENT PRIMARY KEY,
  round INT,
  winnerid INT,
  CONSTRAINT bracket_winner__fk FOREIGN KEY (id) REFERENCES team (id)
);
CREATE TABLE inbracket
(
    bracketid INT,
    teamid INT PRIMARY KEY,
    CONSTRAINT inbracket_BRACKET_ID_fk FOREIGN KEY (bracketid) REFERENCES BRACKET (ID),
    CONSTRAINT inbracket_TEAM_ID_fk FOREIGN KEY (teamid) REFERENCES TEAM (ID)
);
CREATE TABLE tournamenthas
(
    tournamentid INT,
    bracketid INT,
    CONSTRAINT tournamenthas_tournamentid_bracketid_pk PRIMARY KEY (tournamentid, bracketid)
);
CREATE TABLE teamin
(
    teamid INT,
    bracketid INT,
    CONSTRAINT teamin_bracketid_teamid_pk PRIMARY KEY (bracketid, teamid),
    CONSTRAINT teamin_TEAM_ID_fk FOREIGN KEY (teamid) REFERENCES TEAM (ID),
    CONSTRAINT teamin_BRACKET_ID_fk FOREIGN KEY (bracketid) REFERENCES BRACKET (ID)
);
CREATE TABLE playerbelongsto
(
    playeremail VARCHAR(50),
    teamid INT,
    CONSTRAINT playerbelongsto_teamid_playeremail_pk PRIMARY KEY (teamid, playeremail),
    CONSTRAINT playerbelongsto_PLAYER_EMAIL_fk FOREIGN KEY (playeremail) REFERENCES PLAYER (EMAIL),
    CONSTRAINT playerbelongsto_TEAM_ID_fk FOREIGN KEY (teamid) REFERENCES TEAM (ID)
);
CREATE TABLE PLAYERIS
(
    PLAYEREMAIL VARCHAR(50),
    TYPEID INTEGER NOT NULL,
    CONSTRAINT CONSTRAINT_9 PRIMARY KEY (TYPEID, PLAYEREMAIL),
    CONSTRAINT PLAYERIS_PLAYER_EMAIL_FK FOREIGN KEY (PLAYEREMAIL) REFERENCES PLAYER (EMAIL),
    CONSTRAINT PLAYERIS_TYPE_ID_FK FOREIGN KEY (TYPEID) REFERENCES TYPE (ID)
);