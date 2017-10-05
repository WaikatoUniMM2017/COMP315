package ac.waikato.nz.middlemanagement;

import org.h2.jdbcx.JdbcConnectionPool;

import java.sql.Connection;
import java.sql.SQLException;



/**
 * Singleton class for the H2 database
 */
public class Database {
    private static Database instance;
    private static String connectionString = "jdbc:h2:./database/data";
    private static String dbUsername = "";
    private static String dbPassword = "";

    private final JdbcConnectionPool cp;

    private Database(){
        cp = JdbcConnectionPool.
                        create(connectionString, dbUsername, dbPassword);
    }

    /**
     *
     * @return the instance of the database, creates it if it doesn't exist.
     */
    public static Database getDatabase(){
        if(instance == null)
            instance = new Database();
        return instance;
    }

    /**
     * Disposes of the connection pool
     * Should only be used for shutdown
     */

    public static void dispose(){
        instance.cp.dispose();
        instance = null;
    }

    /**
     *
     * @return A connection from the pool. REMEMBER TO .close() AND .dispose() WHEN DONE!!!
     * @throws SQLException
     */
    public Connection getConnection() throws SQLException {
        return cp.getConnection();
    }


}
