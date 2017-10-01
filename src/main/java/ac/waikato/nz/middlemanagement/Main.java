package ac.waikato.nz.middlemanagement;


import io.undertow.Undertow;
import io.undertow.server.HttpHandler;
import io.undertow.server.HttpServerExchange;
import io.undertow.util.Headers;
import org.apache.commons.cli.*;

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
            Database db = Database.getDatabase();
            CommandLine cmd = parser.parse( options, args);
            if(cmd.hasOption("help")){
                formatter.printHelp( "WUGS", options );
            } else if(cmd.hasOption("script")){

                Connection connection = db.getConnection();
                String statement = "RUNSCRIPT FROM '" + cmd.getOptionValue("script") +"';";
                final boolean execute = connection.createStatement().execute(statement);
                connection.close();

            } else {
                Undertow server = Undertow.builder()
                        .addHttpListener(8080, "localhost")
                        .setHandler(new HttpHandler() {
                            @Override
                            public void handleRequest(final HttpServerExchange exchange) throws Exception {
                                exchange.getResponseHeaders().put(Headers.CONTENT_TYPE, "text/plain");

                                Connection connection = db.getConnection();
                                final boolean execute = connection.createStatement().execute(
                                        "CREATE TABLE IF NOT EXISTS example(id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(255)); INSERT INTO example(name) VALUES ('foo');");
                                final ResultSet resultSet = connection.createStatement().executeQuery("SELECT * FROM example;");
                                String output = "";
                                while (resultSet.next()){
                                    output +=
                                            resultSet.getString(1) +":"+ resultSet.getString(2) + "\r\n";
                                }

                                exchange.getResponseSender().send(output);
                                connection.close();
                            }
                        }).build();
                server.start();
            }
        } catch (ParseException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

}