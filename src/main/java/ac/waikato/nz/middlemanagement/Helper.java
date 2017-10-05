package ac.waikato.nz.middlemanagement;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Helper {

    public String getJsonString(String query) {
        try {
            Connection connection = Database.getDatabase().getConnection();
            final ResultSet resultSet = connection.createStatement().executeQuery(query);

            JsonObject jsonObject = new JsonObject();
            JsonArray array = convertToJSON(resultSet);

            jsonObject.add("data", array);
            String jsonContent = jsonObject.toString();

            connection.close();
            return jsonContent;

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    public static JsonArray convertToJSON(ResultSet resultSet)
            throws Exception {
        JsonArray jsonArray = new JsonArray();
        Gson gson = new Gson();
        while (resultSet.next()) {
            int total_rows = resultSet.getMetaData().getColumnCount();
            JsonObject obj = new JsonObject();

            for (int i = 0; i < total_rows; i++) {
                obj.add(resultSet.getMetaData().getColumnLabel(i + 1).toLowerCase(), gson.toJsonTree( resultSet.getObject(i + 1)));
//                obj.

            }
            jsonArray.add(obj);
        }
        return jsonArray;
    }
}
