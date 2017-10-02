package ac.waikato.nz.middlemanagement;

public class Queries {
    //Use String.format to work with these, replaces are positional. language=H2 is used for Intellij
    public static final String UPDATE_TOURNAMENT = "UPDATE TOURNAMENT SET NAME='%s', VENUE='%s', COMMENTS='%s', TSTART='%t', TEND='%t' WHERE ID='%d';";
    // language=H2
    public static final String UPDATE_BRACKET = "UPDATE BRACKET SET ROUND='%d', WINNERID='%d' WHERE ID='%d';";
    /*
    INSERT INTO PLAYER (EMAIL,FNAME,LNAME) VALUES ('eros.nec.tellus@Nullam.com','Stone','Burnett');
    INSERT INTO Team(tname) VALUES ('Lotlux');
    INSERT INTO Tournament(NAME,TSTART,TEND,VENUE,COMMENTS) VALUES ('heroofstormwinter','2017-08-22 10:00:00','2017-08-25 20:00:00','82, Otacu Street, Hamilton','Praesent efficitur velit a sem luctus volutpat. Ut vel tortor quis sem blandit faucibus. Nullam quis dapibus purus.');
    INSERT INTO Type(NAME) VALUES ('staff');
     */


}
