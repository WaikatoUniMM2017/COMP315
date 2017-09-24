package ac.waikato.nz.middlemanagement;


import org.apache.commons.cli.*;

import java.io.File;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Main{
    public static void main(String [] args){
        CommandLineParser parser = new DefaultParser();
        Options options = new Options();
        HelpFormatter formatter = new HelpFormatter();
        options.addOption("script", true, "script to execute on the database");
        options.addOption("help", "displays this message");


        try {
            CommandLine cmd = parser.parse( options, args);
            if(cmd.hasOption("help")){
                formatter.printHelp( "WUGS", options );
            } else if(cmd.hasOption("script")){
                Database db = Database.getDatabase();
                Connection connection = db.getConnection();
                String statement = "RUNSCRIPT FROM '" + cmd.getOptionValue("script") +"';";
                final boolean execute = connection.createStatement().execute(statement);
                connection.close();
                Database.dispose();
            } else {
                startDB();
            }
        } catch (ParseException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    private static void startDB() {
        try {
            Database db = Database.getDatabase(); //Initialise the connection
            Connection connection = db.getConnection();

            final boolean execute = connection.createStatement().execute(
                    "CREATE TABLE IF NOT EXISTS example(id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(255)); INSERT INTO example(name) VALUES ('foo');");
            final ResultSet resultSet = connection.createStatement().executeQuery("SELECT * FROM example;");
            while (resultSet.next()){
                System.out.println( resultSet.getString(1) +":"+ resultSet.getString(2));
            }

            connection.close();

            Database.dispose();

            //Remember: To close all database connections before we exit;

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}