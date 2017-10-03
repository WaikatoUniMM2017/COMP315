package ac.waikato.nz.middlemanagement;


import io.undertow.Undertow;
import io.undertow.server.HttpHandler;
import io.undertow.server.HttpServerExchange;
import io.undertow.util.Headers;
import org.apache.commons.cli.*;

import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;
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

                                String aa = exchange.getQueryString();


                                if (aa == "") {
                                    //Return index.html
                                    exchange.getResponseHeaders().put(Headers.CONTENT_TYPE, "text/html");
                                    String output = "";
                                    //Needs to be a relative path
                                    output = readFile("/index.html", Charset.defaultCharset());
                                    exchange.getResponseSender().send(output);
                                } else if (aa.startsWith("api/")) {
                                    //Process the request type (get, put, delete, post) and map to database queries
                                } else {
                                    //Return the file, return a 404 if it doesn't exist remember to set the correct MIME type
                                    String output = "";
                                    output = readFile(aa, Charset.defaultCharset());
                                    exchange.getResponseSender().send(output);
                                }


//                                int index = aa.lastIndexOf("/");
//                                String type = aa.substring(index, aa.length());

//                                switch (type) {
//                                    case "": {
//                                        exchange.getResponseHeaders().put(Headers.CONTENT_TYPE, "text/html");
//                                        String output = "";
//                                        output = readFile("C:/Users/17255/Documents/GitHub/COMP315/index.html", Charset.defaultCharset());
//                                        exchange.getResponseSender().send(output);
//                                    }
//                                    case "File": {
//                                        exchange.getResponseHeaders().put(Headers.CONTENT_TYPE, "application/JSON");
//                                        String output = "";
//                                        output = readFile("somefile", Charset.defaultCharset());
//                                        exchange.getResponseSender().send(output);
//                                    }
//                                    case "Api": {
////                                        some method to fetch data...
//                                    }
//                                 }



//                                Connection connection = db.getConnection();
//                                final boolean execute = connection.createStatement().execute(
//                                        "CREATE TABLE IF NOT EXISTS example(id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(255)); INSERT INTO example(name) VALUES ('foo');");
//                                final ResultSet resultSet = connection.createStatement().executeQuery("SELECT * FROM example;");
//                                String output = "";
//                                while (resultSet.next()){
//                                    output +=
//                                            resultSet.getString(1) +":"+ resultSet.getString(2) + "\r\n";
//                                }
                                String output = "";
                                output = readFile("C:/Users/17255/Documents/GitHub/COMP315/index.html", Charset.defaultCharset());
                                exchange.getResponseSender().send(output);
//                                connection.close();
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

    static String readFile(String path, Charset encoding)
            throws IOException
    {
        byte[] encoded = Files.readAllBytes(Paths.get(path));
        return new String(encoded, encoding);
    }

}