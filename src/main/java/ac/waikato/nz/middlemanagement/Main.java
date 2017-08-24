package ac.waikato.nz.middlemanagement;


import java.sql.Connection;
import java.sql.ResultSet;

public class Main{
    public static void main(String [] args){
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