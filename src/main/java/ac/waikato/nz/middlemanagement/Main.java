package ac.waikato.nz.middlemanagement;


import io.undertow.Undertow;
import io.undertow.server.HttpHandler;
import io.undertow.server.HttpServerExchange;
import io.undertow.util.Headers;
import io.undertow.util.HttpString;
import org.apache.commons.cli.*;

import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Deque;
import java.util.Map;
import java.util.Set;

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
                                Database db = Database.getDatabase();
                                Connection connection = db.getConnection();

                                exchange.getResponseHeaders().put(Headers.CONTENT_TYPE, "text/plain");

                                String requestURI = exchange.getRequestURI();


                                if (requestURI == "") {
                                    //Return index.html
                                    exchange.getResponseHeaders().put(Headers.CONTENT_TYPE, "text/html");
                                    String output = "";
                                    //Needs to be a relative path
                                    output = readFile("index.html", Charset.defaultCharset());
                                    exchange.getResponseSender().send(output);
                                } else if (requestURI.startsWith("/api/")) {
                                    //Process the request type (get, put, delete, post) and map to database queries
                                    String out = "";

                                    for (Map.Entry<String, Deque<String>> set : exchange.getQueryParameters().entrySet()){
                                        out += set.getKey() + "：" + set.getValue().toString();
                                    }



                                    exchange.getResponseSender().send(out);

                                    HttpString requestMethod = exchange.getRequestMethod();
                                    String requestMethodString = requestMethod.toString();

                                    int startIndex = requestURI.lastIndexOf("/");
                                    int endIndex = requestURI.lastIndexOf("?");
                                    String tableType = requestURI.substring(startIndex, endIndex);

                                    switch (requestMethodString) {
                                        case "GET":

                                            switch (tableType) {

                                                case "player":

                                                    String emailValue = exchange.getQueryParameters().get("email").element();


//                                                    final ResultSet resultSet = connection.createStatement().executeQuery("SELECT * FROM Team;");
//                                                    String output = "";
//                                                    while (resultSet.next()){
//                                                        output +=
//                                                                resultSet.getString(1) +":"+ resultSet.getString(2) + "\r\n";
//                                                    }


                                                    break;

                                                case "team":

                                                    String teamName = exchange.getQueryParameters().get("name").toString();

                                                    break;

                                                case "tournament":

                                                    String tournamentName = exchange.getQueryParameters().get("name").toString();


                                                    break;

                                            }
                                            break;


                                        case "POST":

                                            break;

                                        case "PUT":

                                            switch (tableType) {

                                                case "player":
                                                    String emailValue = exchange.getQueryParameters().get("email").element();
                                                    String lnameValue = exchange.getQueryParameters().get("lname").element();
                                                    String fnameValue = exchange.getQueryParameters().get("fname").element();

                                                    break;

                                                case "team":

                                                    String teamName = exchange.getQueryParameters().get("name").toString();

                                                    break;

                                                case "tournament":

                                                    String tournamentName = exchange.getQueryParameters().get("name").toString();
                                                    String venue = exchange.getQueryParameters().get("venue").toString();
                                                    String comments = exchange.getQueryParameters().get("comments").toString();
                                                    String tStart = exchange.getQueryParameters().get("tstart").toString();
                                                    String tEnd = exchange.getQueryParameters().get("tend").toString();

//                                                    Is the id also come from the frontend?
                                                    connection.createStatement().execute(String.format(Queries.UPDATE_TOURNAMENT,
                                                            tournamentName, venue, comments, tStart, tEnd));

                                                    break;
                                            }

                                            break;

                                        case "DELETE":

                                            switch (tableType) {

                                                case "player":

                                                    String emailValue = exchange.getQueryParameters().get("email").element();

                                                    break;

                                                case "team":

                                                    String teamName = exchange.getQueryParameters().get("name").toString();

                                                    break;

                                                case "tournament":

                                                    String tournamentName = exchange.getQueryParameters().get("name").toString();

                                                    break;
                                            }

                                            break;
                                    }



                                } else {
                                    //Return the file, return a 404 if it doesn't exist remember to set the correct MIME type
                                    int index = requestURI.lastIndexOf(".");
                                    String type = requestURI.substring(index, requestURI.length());
                                    exchange.getResponseHeaders().put(Headers.CONTENT_TYPE, "text/" + type);
                                    String output = readFile(requestURI, Charset.defaultCharset());
                                    exchange.getResponseSender().send(output);
                                }


//


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

    static String readFile(String path, Charset encoding)
            throws IOException
    {
        byte[] encoded = Files.readAllBytes(Paths.get(path));
        return new String(encoded, encoding);
    }

}